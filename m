Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA34A0B544
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 12:18:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870545.1281721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXIRV-00086d-LJ; Mon, 13 Jan 2025 11:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870545.1281721; Mon, 13 Jan 2025 11:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXIRV-00083w-IE; Mon, 13 Jan 2025 11:17:13 +0000
Received: by outflank-mailman (input) for mailman id 870545;
 Mon, 13 Jan 2025 11:17:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HC3z=UF=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tXIRU-00083q-2H
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 11:17:12 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2606::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee2dfa50-d19f-11ef-99a4-01e77a169b0f;
 Mon, 13 Jan 2025 12:17:10 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU4PR03MB10910.eurprd03.prod.outlook.com
 (2603:10a6:10:593::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.15; Mon, 13 Jan
 2025 11:17:07 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 11:17:07 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ee2dfa50-d19f-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYCaSdGufDsjRiKjx9X+oJDsZGV1Zoymhog0rJmK/CNxwmtHTQibZoRUk2RSje2rIlQFQ2Tsf4Xtrv28jXisA3J8oXTh+W+rpajQuPoIjcJ+ru0Rqh8cCKaDvR1aaPSvMfhsymfeBrj+8vqPN+0lnVOoylLKpH/gXCPZhScVPuNFHTxrxYbtqsONZEVZUx+6YKJd/AfOR6DqgHxqRoafRknNa28r4N14KhiGAPT/suZbei/KAJN9OJgmuJV87IjjJu8WcHyov5bidKQMgTEBavo3/iWuzorUeX+yFci9Bx6I/xTI3uX+iuF9c0GK+6txXe8kCDKh3b/v5YWKt/cvzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgURsy4YwBnvPiRigmAIYMMg7+Fk6RmqJNdDHl5Jio8=;
 b=Xyd9+D768aaAfNfzyE9vB/JyV6B8ZQeWjGibBSYWts5GpdCfnG1r/g2NnTIuThGEcXFP77EnASifO1LSqVpWyparbW3kTQG1EtSM3TK4ReP33oe+PJLP85lXFJJi/Ixc3qv0IU1A2711IZhyLCA4i3K/pGM3/yrLSIjcgloV4QtdXIRFIH1PIRM/zqEKjXAlgEHErilegjYIaZHxdWczb187vFQj/WMUWKUcRqpYzjSIRdDtYZfHMidOuN7cCg20edgBH7WruHJLcfBysfFEKqhRIe5f8KlkGC1ySB+qAaHzUATN9NjLwZ8+mJGXMj1Q/vBH8eTFu24O0SaflC/EAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgURsy4YwBnvPiRigmAIYMMg7+Fk6RmqJNdDHl5Jio8=;
 b=dNAdtvF0Qm/Sq1SZ6p3RSujmnxm1rxvolSVs2viiWttDM2r545NsZDT7Rt+rK4mqpQG98uuArTZkeIv9rR+cY05URKgdeauF5hSCDZuET5thKeChA/gikyRaJhBIAoadwbN2SzAn9RbRXCVeZl9m8T40mRA+kvRrs6n5G4UTMAMS54X35KqoWHG8ZE/GaY4J1RXoynJ9+Ks7Od1AAezgPhD2p/8n7Ca0KeyX6WLK5Vybeh/2lAWRY4UIYUw1hNVixQ4uxSsmaKazGiUoKHQjOU8md+EMXwHlY+FqymPsOljRl9nNxU5UW4QGTTP0F0xDasxRWskWKkbEp3aY5d824A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 0/9] SMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v6 0/9] SMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHaEzqaKbzl/PvS3EG/aAIeGF3kObMXMuYA
Date: Mon, 13 Jan 2025 11:17:07 +0000
Message-ID: <9b2740a0-7347-4b91-a687-1e8e4c120288@epam.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
In-Reply-To: <20231109182716.367119-1-stewart.hildebrand@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU4PR03MB10910:EE_
x-ms-office365-filtering-correlation-id: c959017f-bb66-4ba1-4a6a-08dd33c3d0f4
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RXNubWNNejhGOWE5cHFudUp4b3hpRE9WZXBITThJMThpNlF1NjN1NXdhTzRz?=
 =?utf-8?B?ZjUyQjVMZW14cjAyWkVqOTVvekxHQlMvQWhuY0pwN0FidXZzdUpMVDd2czBB?=
 =?utf-8?B?aFBZM1VkemRqdEhSbDFaVHhoNlVRbHU4dXFyTlVKWTRNT2lHWFlRV0szMklN?=
 =?utf-8?B?OVl4bGRqd0NSTVpXVzVoT1cweGwxejR1b2c2QmxFY0lLZktDbFdEK3BFblN1?=
 =?utf-8?B?bHpHMnJ2U0xkckFKY2FHL3RYbi81R2g2VEYzUjMvTFV6ZjNoOUVNa3BlMjlJ?=
 =?utf-8?B?OVUzemg2Nzh5K2V5RkxJeFNUK241MXFzMnRMYThYUnhSK2kxYmxwbGs4aGcv?=
 =?utf-8?B?elM1ZVN0djNtNmxMM2xoNElkTXlOUHpxNDNrVHdWd1dkMzFpSm5aZ082Si95?=
 =?utf-8?B?RFJ2QnNJZ0JzalRCUlhpRTd4RG80V1VMN1ordHVoYkJMMzVIYXdhK01aMXdR?=
 =?utf-8?B?bWl2Q3F4K1JDS3NCK1czNVFoWEpSOExHOTNzcVpXU1JoOFdZOU1KaDJCeXFy?=
 =?utf-8?B?d0pubDg1NU1na09KKzQvc0NWemFxdHJkR3ErdENoUnZjRUZBblBnY1pLZWFQ?=
 =?utf-8?B?NzZUcWJSRDNNV0x4V0hJNjhpQWJRb0I0SVRtU1djd3hsU1pLUHdUOHA0QW5F?=
 =?utf-8?B?cUowQ0pTVWt0aVVFYlRCRmdjeGgyV21UMmQyRGtJaDhOTExXTC9Ldi94cUkx?=
 =?utf-8?B?Y3hzK0NNdHBuUWhZQ1gyQkxEQzhEOWNndFdQRU9QdFFxUE1nZ2VtODZBR1M2?=
 =?utf-8?B?YzJSRk9YRzk1dnlYWWZRS1JtZG5rR1JnZlNnQ1dQZm9NYTlWRGdsbVJ4bGlv?=
 =?utf-8?B?S0hKWE1lNTdIenRORXQ1ZHAvYWlFc1kvbEFjamZMNENycjAvSUxKbW5JTlJl?=
 =?utf-8?B?b1NMNytxeDhuK0RGbXQyRGIwWVRaTExjMlc3QlNmbXV3TER2enNsRWljS1pS?=
 =?utf-8?B?M3haSWxsZGljTnRrQ1lGMWZRMGNLTjJjZC9qT0Q5VXRLUkpjKzRTWno3Z0gy?=
 =?utf-8?B?LzBMQ20wVjlUc0FSeno0VnpDTkVWb2wvWk1icVpNdlBvWGJtL3BoRnpXUHQx?=
 =?utf-8?B?RURKbEV5S0hremtEdTIxZ0pYbU9aZmNzSnI3OUJkaEwwcGplSU9CWkpDbGVR?=
 =?utf-8?B?Z1doVHFDaTY4dG5Kai9takRVYWpJV2xBeGUySG5JZEpHaGYzN3FIa3FCRTRI?=
 =?utf-8?B?Sm1wak83MktuMGFtWkptekVkUDlGaHRsMmE3Nk14MGlkK281NVpwckdPS0xu?=
 =?utf-8?B?cU1DYjFrenI5NENnUFdranY2VlpoTmx1NkdTaXh6Yms4amZKcStlSno5cHpI?=
 =?utf-8?B?MytxaGhRVkJIVWVvVUR5UTQxWGp0aHp5NENudXNTK3hGeVRwREZZaXdjaHND?=
 =?utf-8?B?bUh0YVBoT1pmZFFlYVhuQ2lBMGc4bFRmNFVXVzRMSm5ZRHZRT0tvS25CNENi?=
 =?utf-8?B?V09IeDhWb3VhVXNxdzNjb1NMcjk0bmg3dkRrU2xoMlpwK0pKM21pcVdXYTg5?=
 =?utf-8?B?Qlg4VTM5MWk3bWM4NkljK1JMMlVIK0UyL3JrQlpKZVMwRzl3N21hK2tiL0M1?=
 =?utf-8?B?RlJMYzlsYXQ5MVR3SkF1dVZzZUVOVHdJbGlicDM5TG4vVlhjZEhYMEcwT3lv?=
 =?utf-8?B?QnUyUjZRbkF0d3oyelVRakJlQ2M0SUwrM1V3T2QxUEliUW1yQWF5dkdieEhK?=
 =?utf-8?B?U0IvWGx1NlhKc2ZMMFQxY24zZEFyUEw0MldYSFRPdjFkREZacVdPeFhyN3RH?=
 =?utf-8?B?YXZsVjRHTkgxYkh6cU94bHNDUjRxOFdkMUpQWnBmRXR2cGpPeFZKRkx5Y0dF?=
 =?utf-8?B?REVoRlZCdDd3ejY1cHQ4ZGNJTjJlTzZCblNPRjBldDY2M0V0U2d5SzJnNGJw?=
 =?utf-8?B?RmM4L0dlMm1NY3NDakZIUHR4Mm1NOVpNRHc5eU1OUE1WVWc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SkkwL0pGVGZqczJKRlBUOHdOMTlHMjJRY0t5SXRJdkdlS3hadW90ajFpeUNI?=
 =?utf-8?B?NmFhSWRVSFdSUXIyWFhPZVFyUWUrTng5bklTU1BuSllveEtpNVFvaWRwS1RF?=
 =?utf-8?B?ODVpREFwak9zeDRWWjI5Z3Nqb3dnUFluRWRISXM5MUN4OGRaNU1vMHVqUEFv?=
 =?utf-8?B?WEdDRzNuWFZzQ2JQQklacmRjNi9aVkhna2lqRWgzSUk5WEd2dzZUdyt1cHpZ?=
 =?utf-8?B?VkdUTDdBU0dzazM4V3hDL2NNUVJ5K0RVTmh3YzM0VFNacFFVSFMrV1BzbjZh?=
 =?utf-8?B?NVFQSnB4a1kyY1ZLQm8vN3dIeFhTSGgrSm03MDVZSlYzcXAwMndibFNHc1I4?=
 =?utf-8?B?UE9IeDlUOFBpdTZ2VlQrMEVXUmN3eFFjV2JFd0hWL3J4a0FOZ0Y3OFkydEtG?=
 =?utf-8?B?VjFucG11bWpTelZLa0drVWs0ajVaR0lad3FPUVJ1a0hnK1ZvdWw0M2hnZVJF?=
 =?utf-8?B?Q0xxdjhWcHc3QjkwRlU3Tk91ZGlBUnRNSmd1VlA2NHk1d1RMS3dCd2VPZEJK?=
 =?utf-8?B?c2ZkTENPcmQ2WGx2a3oyYTExc2lvVWdYbzRua1M0UkpyclZleWRwUENwWTlw?=
 =?utf-8?B?S2tyY1g0RVdzbG1zRGVubnRXdVM2ZVBIOWc4VHpGc3pzMGhqc2tuVUNseVNl?=
 =?utf-8?B?d29kN2NaN1I1VGJFZmRFYjZObmdWNmNVMHlwRHovRm5BT1ZqQXRydHdPR0xS?=
 =?utf-8?B?QzFEV0ZMNmlUekY4ZC9hMTk4S1Mvb0J5eTdVOUpKNkYyeFpuY2ZBWGgwY2xn?=
 =?utf-8?B?K0NhTWZqd2g4QSttS3plZHpXMWlUOTdBeTFCbW9xSFFGdmlzMWZNQkFwTjU2?=
 =?utf-8?B?bWRzdHE3K3g4dVNRWDFjbjB6ZEVGb015STUzb0NueGd0NGZteGc5OWFoK25W?=
 =?utf-8?B?YzJIOEs0eU5kOVVXcWN1bzd6Rk5vQUUvRkl2ZWFjZEZMYndtZW5FVmlja0FQ?=
 =?utf-8?B?dnA3QmlyTEMxRVdCYUc1eWhjM2ZwaWpQbVhmTnNnN05YY044MTlYUnNvdTNB?=
 =?utf-8?B?RDg1aklGV3dqbnJ0MUkzbk5sZS85RWVINlFIR1lXQ0VYNSs1eUtyK0M3Ri83?=
 =?utf-8?B?aHJEa05HUGl6bytWazk1RzVLeWw2b0pPU2NpRTJSV2F0TE9oQ2p5b29hZ05a?=
 =?utf-8?B?V3BscWFMd2xIZ1ZaVk1JN05WRVlBQVh3anBRTGd6eW1rWjZlYWNEd1hDSlNk?=
 =?utf-8?B?ZnRCdXJ1SWU1bHY2b0NUY214STFZc01KeEFLamFsNUtxNnR1azBaNVNtTVd1?=
 =?utf-8?B?OWV2R2tkVHp4cURDcGRVQ1BLaDlZSUlWcDdZMUt2R2c4ZG1kdjJ5enpicGM1?=
 =?utf-8?B?SVVxNEV3eDZLVnY0b2F0R0xBZG9Kb2d6Y2hFaTFVNTlhMFhsVHhxRjZJN3Jp?=
 =?utf-8?B?cTFHZWNmU1VjK3JlQmlZRmFsamJ4eVZiRUhZdUlkN0wxbGEvZnBaUXg5dmdY?=
 =?utf-8?B?RFEwZm9RZGRQYUVkWVY4QjhYYU5DQWNYVnA1bGhnandsa3JxQ3YrNm9ZOFlx?=
 =?utf-8?B?ZFV5SEFaQlJESDR1WVlSVWFMcU4zVVBHZ240aWE3aU1icjN6VHh5VEZFQmJS?=
 =?utf-8?B?QVk2MFFTTTU2QUpMbllmd3k3UWU4ZG1IUzBTakcrZEMxcThzVGprR0U0RWVK?=
 =?utf-8?B?R1p3bkFxMHhiUnI0VE9OVVVHdEorQ2dDeDNnOHo5V3RMSXFKaGNpQThSTlpI?=
 =?utf-8?B?aVdIZ2g5VVU4LzZpRUdLZmFydjRBU3hYL3JjcnFDd05FUFFsMWt2RTdjZ0RW?=
 =?utf-8?B?Z3BZVDVlMTBXblo2QStBUFFoL0xkMGsvSVhRSVdUWDFuV2c0cEdyS1V1Y3Jj?=
 =?utf-8?B?ZWxRc0RHUnY0RTlSSFBLcTV5K2c3TFVMQWVGbEdQWitBYi85NjBaM2IyOEUx?=
 =?utf-8?B?eXVtd0pZdTFMaXQreGc3K0pabGZuQXhJSDJ6ZFpicGlqc3R3eG80QVpNKzBm?=
 =?utf-8?B?Z0VESW1QRXUyT3pKVDhHUjZuWjdpUDU5dWREZzJVbFRhSlNuNUNvTVFtblBp?=
 =?utf-8?B?RTVLSVk3OGRlMFFBQjZXWkViVjBWa0xqNzJVeDNMZXNGUWxYZVplRVcyZE44?=
 =?utf-8?B?ZVNnaHdqN2RFQWZEUTZNT1lyVVVsQjNFZi9OMmw2bUVQUUhIRld4N2lnUkta?=
 =?utf-8?B?VUhZRk5zc3FUVUJBNDRVOWc3a3pQdWU0ekxjZ2hDNStDb3NEbnN5ZGpZeThS?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E13A43D8BF7D2E42BAE76C73886B0AB7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c959017f-bb66-4ba1-4a6a-08dd33c3d0f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 11:17:07.3477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 40rqBCNdZulKEtWh9hXb6HXxxuCA5WSPVAmESWlSRWsC27i2NhkmWsWK17CN2eycOkP19rNiIjfK9ss3/n4G8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10910

T24gMDkuMTEuMjMgMjA6MjcsIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90ZToNCj4gVGhpcyBzZXJp
ZXMgaW50cm9kdWNlcyBTTU1VIGhhbmRsaW5nIGZvciBQQ0llIHBhc3N0aHJvdWdoIG9uIEFSTS4g
VGhlc2UgcGF0Y2hlcw0KPiBzaG91bGQgYmUgYWJsZSB0byBiZSB1cHN0cmVhbWVkIGluZGVwZW5k
ZW50bHkgZnJvbSB0aGUgdlBDSSBzZXJpZXMgWzFdLiBTZWUgWzJdDQo+IGZvciBub3RlcyBhYm91
dCB0ZXN0IGNhc2VzLg0KPiANCj4gWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJj
aGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMy0xMC9tc2cwMDY2MC5odG1sDQo+IFsyXSBodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjMtMDYvbXNn
MDExMzUuaHRtbA0KPiANCj4gdjUtPnY2Og0KPiAqIGRvbid0IHJldmVydCAoInhlbi9hcm06IEFk
ZCBjbWRsaW5lIGJvb3Qgb3B0aW9uICJwY2ktcGFzc3Rocm91Z2ggPSA8Ym9vbGVhbj4iIikNCj4g
KiBhZGQgKCJ4ZW4vYXJtOiBlbmFibGUgZG9tMCB0byB1c2UgUENJIGRldmljZXMgd2l0aCBwY2kt
cGFzc3Rocm91Z2g9bm8iKQ0KPiANCj4gdjQtPnY1Og0KPiAqIGRyb3AgKCJ4ZW4vYXJtOiBJbXBy
b3ZlIHJlYWRhYmlsaXR5IG9mIGNoZWNrIGZvciByZWdpc3RlcmVkIGRldmljZXMiKQ0KPiAqIGRy
b3AgKCJ4ZW4vYXJtOiBNb3ZlIGlzX3Byb3RlY3RlZCBmbGFnIHRvIHN0cnVjdCBkZXZpY2UiKQ0K
PiAqIGFkZCAoInhlbi9hcm06IGRvbid0IHBhc3MgaW9tbXUgcHJvcGVydGllcyB0byBod2RvbSBm
b3IgaW9tbXUtbWFwIikNCj4gKiBhZGQgKCJ4ZW4vYXJtOiBGaXggbWFwcGluZyBmb3IgUENJIGJy
aWRnZSBtbWlvIHJlZ2lvbiIpDQo+ICogcmV2ZXJ0ICgieGVuL2FybTogQWRkIGNtZGxpbmUgYm9v
dCBvcHRpb24gInBjaS1wYXNzdGhyb3VnaCA9IDxib29sZWFuPiIiKQ0KPiAqIGFkZCAoInhlbi9h
cm06IE1hcCBJVFMgZG9vcmJlbGwgcmVnaXN0ZXIgdG8gSU9NTVUgcGFnZSB0YWJsZXMuIikNCj4g
KiBmaXggdGVzdCBjYXNlICMxIHdpdGggUENJIGRldmljZSBpbiBkb20wDQo+IA0KPiB2My0+djQ6
DQo+ICogc3BsaXQgYSBjaGFuZ2UgZnJvbSAoInhlbi9hcm06IE1vdmUgaXNfcHJvdGVjdGVkIGZs
YWcgdG8gc3RydWN0IGRldmljZSIpIGludG8NCj4gICAgYSBuZXcgc2VwYXJhdGUgcGF0Y2gNCj4g
KiBzZWUgaW5kaXZpZHVhbCBwYXRjaGVzIGZvciBmdXJ0aGVyIGRldGFpbHMNCj4gDQo+IHYyLT52
MzoNCj4gKiBkcm9wICJwY2kvYXJtOiBVc2UgaW9tbXVfYWRkX2R0X3BjaV9kZXZpY2UoKSINCj4g
KiBkcm9wICJSRkM6IHBjaS9hcm06IGRvbid0IGRvIGlvbW11IGNhbGwgZm9yIHBoYW50b20gZnVu
Y3Rpb25zIg0KPiAqIG1vdmUgaW52b2NhdGlvbiBvZiBzaWRlYmFuZCBJRCBtYXBwaW5nIGZ1bmN0
aW9uIHRvIGFkZF9kZXZpY2UoKQ0KPiAgICBwbGF0Zm9ybV9vcHMvaW9tbXVfb3BzIGhvb2sNCj4g
DQo+IHYxLT52MjoNCj4gKiBwaGFudG9tIGRldmljZSBoYW5kbGluZw0KPiAqIHNodWZmbGUgYXJv
dW5kIGlvbW11X2FkZF9kdF9wY2lfZGV2aWNlKCkNCj4gDQo+IE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvICgxKToNCj4gICAgeGVuL2FybTogc21tdXYyOiBBZGQgUENJIGRldmljZXMgc3VwcG9ydCBm
b3IgU01NVXYyDQo+IA0KPiBPbGVrc2FuZHIgVHlzaGNoZW5rbyAoMik6DQo+ICAgIGlvbW11L2Fy
bTogQWRkIGlvbW11X2R0X3hsYXRlKCkNCj4gICAgaW9tbXUvYXJtOiBJbnRyb2R1Y2UgaW9tbXVf
YWRkX2R0X3BjaV9zaWRlYmFuZF9pZHMgQVBJDQo+IA0KPiBSYWh1bCBTaW5naCAoMyk6DQo+ICAg
IHhlbi9hcm06IHNtbXV2MzogQWRkIFBDSSBkZXZpY2VzIHN1cHBvcnQgZm9yIFNNTVV2Mw0KPiAg
ICB4ZW4vYXJtOiBGaXggbWFwcGluZyBmb3IgUENJIGJyaWRnZSBtbWlvIHJlZ2lvbg0KPiAgICB4
ZW4vYXJtOiBNYXAgSVRTIGRvb3JiZWxsIHJlZ2lzdGVyIHRvIElPTU1VIHBhZ2UgdGFibGVzDQo+
IA0KPiBTdGV3YXJ0IEhpbGRlYnJhbmQgKDMpOg0KPiAgICB4ZW4vYXJtOiBkb24ndCBwYXNzIGlv
bW11IHByb3BlcnRpZXMgdG8gaHdkb20gZm9yIGlvbW11LW1hcA0KPiAgICBpb21tdS9hcm06IGlv
bW11X2FkZF9kdF9wY2lfc2lkZWJhbmRfaWRzIHBoYW50b20gaGFuZGxpbmcNCj4gICAgeGVuL2Fy
bTogZW5hYmxlIGRvbTAgdG8gdXNlIFBDSSBkZXZpY2VzIHdpdGggcGNpLXBhc3N0aHJvdWdoPW5v
DQo+IA0KPiAgIHhlbi9hcmNoL2FybS9kZXZpY2UuYyAgICAgICAgICAgICAgICAgfCAgIDIgKy0N
Cj4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgICAgICAgICAgIHwgICAyICsNCj4gICB4
ZW4vYXJjaC9hcm0vcGNpL3BjaS5jICAgICAgICAgICAgICAgIHwgICAzICstDQo+ICAgeGVuL2Fy
Y2gvYXJtL3ZnaWMtdjMtaXRzLmMgICAgICAgICAgICB8ICAxNSArKw0KPiAgIHhlbi9jb21tb24v
ZGV2aWNlX3RyZWUuYyAgICAgICAgICAgICAgfCAgOTEgKysrKysrKysrKysrDQo+ICAgeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYyB8IDEzMSArKysrKysrKysrKysrKystLQ0K
PiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMgICAgfCAxOTkgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0NCj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJl
ZS5jIHwgIDk3ICsrKysrKysrKystLS0NCj4gICB4ZW4vZHJpdmVycy9wY2kvcGh5c2Rldi5jICAg
ICAgICAgICAgIHwgICA2IC0NCj4gICB4ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaCAgICAg
ICAgIHwgIDIzICsrKw0KPiAgIHhlbi9pbmNsdWRlL3hlbi9pb21tdS5oICAgICAgICAgICAgICAg
fCAgMjYgKysrLQ0KPiAgIDExIGZpbGVzIGNoYW5nZWQsIDUyOCBpbnNlcnRpb25zKCspLCA2NyBk
ZWxldGlvbnMoLSkNCj4gDQo+IA0KPiBiYXNlLWNvbW1pdDogYmVkZTFjN2UzYjc5MGI2M2YxZmYz
ZWEzZWU0ZTQ3NmIwMTJmZGYyYw0KDQpIaSBTdGV3YXJ0LA0KSSBub3RpY2VkIHRoZXJlIHdhcyBu
byBhY3Rpdml0eSBmb3IgdGhpcyBzZXJpZXMgZm9yIHNvbWUgdGltZS4gQXJlIHlvdSANCnN0aWxs
IHdvcmtpbmcgb24gdGhpcyBvciB3b3VsZCBpdCBiZSBva2F5IGlmIEkgdGFrZSB0aGlzIG92ZXIg
YW5kIHN0YXJ0IA0KcHJlcGFyaW5nIHRoZSBWNz8NCg0KLS0gDQpNeWt5dGE=

