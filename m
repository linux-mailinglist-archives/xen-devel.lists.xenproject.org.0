Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFi0DcMjimnqHgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 19:13:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0361136D0
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 19:13:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225963.1532570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpVk3-0006Mx-7D; Mon, 09 Feb 2026 18:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225963.1532570; Mon, 09 Feb 2026 18:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpVk3-0006L7-3i; Mon, 09 Feb 2026 18:12:11 +0000
Received: by outflank-mailman (input) for mailman id 1225963;
 Mon, 09 Feb 2026 18:12:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dId=AN=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vpVk1-0006L0-7Q
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 18:12:09 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d77f6b7f-05e2-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 19:12:07 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5405.namprd03.prod.outlook.com (2603:10b6:a03:286::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 18:12:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 18:12:02 +0000
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
X-Inumbo-ID: d77f6b7f-05e2-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQg5vbAIWy9Ta1SoU+xCT8onvT5JV4Wkujpw2FrHkAlVwRLvZFY+dHkEP02iZHoa9FbBFMfOJUHWOoWEoXdPXoc9PD+aONELk2rlU84semjdb1/2/7Y7u+O5GDCmjv+ZAdhz6UG0cmecNULuR3XYN6iCuoP5XluGK82ZUCcYG3Gy56RrenQ+biBZbPB4F+Lh9qXcFN0ngey4EcGHp4lbQrFGQaF8InBBi6YPg0GrTO3uqF2QaD8HXGUMdvfS0EdJ76uI5CYxRIno5oxi5z4wh0EuQAZdBcbuYy7gNuoFd0Y3DwMJD0Dtdb23Ihu4bbcubEISPLqPIiLsD1RzVNsKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29IhPBoDLG9pzMm2IF5Xg1IaTWeDQSx/ANhxSFXIjX4=;
 b=fiQwA1zY6fUqafl5hAngk0JPSY7uRLjIpUGkQjxroV32MFwl1BJwVQ4CDwPIh9aWvUp4ScagcFxI592ekEc/LevHMNdl6eP1TY2Ahv9JTdlAuCyhFW148O5xzJ4abv8ooL60/rPjaoUnxkKttLZ+kB6Y+tFqye82QEUHFZcDjZPOC/6K3KOwwFKsZSnRDZHWdA3VHRQApQgL7NZm5T+PgW+tcMWLWJs3n0IKbf+2dFYjVwwiitijDHhMIdzuOUyxuP8xq+Wr1XYTQe69uUnTHUMJr4Vb9Pqw7OEzx2WQEEl7FyzL2gITDAlB94MbuCsTMkiWqDtxUyXDe8XfoKwgkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29IhPBoDLG9pzMm2IF5Xg1IaTWeDQSx/ANhxSFXIjX4=;
 b=foCFUIABm7u17bOtAo1yIht7Mrdv3uFnDyAkTXlyprrGo6ML86Iad/+lO+L772rJ9R6HF+x8t334mBTFOD8WGhV88sAISwCcHg3dyQ29fabYsb1YBSbRHL9uhWCmaBSkQTcE4ZzPs8uB+QoV+HETvQqjtbTyEHRk4LE987KNyl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e492809b-214e-43b4-953c-ff21b3780429@citrix.com>
Date: Mon, 9 Feb 2026 18:11:59 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 0/3] Virtual NMI
To: abdelkareem.abdelsaamad@citrix.com, xen-devel@lists.xenproject.org
References: <cover.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <cover.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5405:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae9e7cf-d6c6-41c6-2abd-08de6806b9a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFE2RnJ2UHE0U1NBMzhudkhETE5PS1JYWTVmRGQvMEQwRDBMUXBFRVZlYkpj?=
 =?utf-8?B?TkJOS3Irc01RYnlkdnJ5bSs3ZnhKSXc2MmdDYUJIQjFGNkt1MkxYejBWcFdu?=
 =?utf-8?B?c3hKeFNFeDZ5UGRoZmdMVkJ0dGlUWitsVWJoZmh5ODdKMUU2VmUxSnlRNytj?=
 =?utf-8?B?MHJseWlhdXlyMFJ1eFRRemdsOHhrVzU1WTM4cEJpYkpDMVlaQkI0b0h6TVA2?=
 =?utf-8?B?blpUaE9WcTV1U2JYZXZVS3I2MEJkWDhZMlAxY25uTnZJUVlzZGgyVVpySytV?=
 =?utf-8?B?TksvbThZa0E3N0xvdXRrb0ZwckZtUkp4aFBqMjJkSnF1U0hqUUpxV3A2cDE2?=
 =?utf-8?B?bHdhWHVaTFJqaGRPZGp6REphSFRpK21Fa1dZdUx1UXhJczZNVTYwMlNMZmZa?=
 =?utf-8?B?dzNITEJnQW9lNGRFV2U5c2o3elF2V09BeExFR1Y1b0VwRXFNWjBtckh6ZXAz?=
 =?utf-8?B?R3VrT2FtdStoOEZxZDYvbVRYTkRIVkMrbXJmcTRaWkJpUHdPN2twY1FsQkRa?=
 =?utf-8?B?VWVLbFdpOEQrY3dGdWo1TTJyYXV3RzFhR1ZCbFdOM3RiTGx4NGRLeDJlMTQy?=
 =?utf-8?B?VXpVWEtoSXpqZStvRFdYTXZsUi82ayt2VHBwUHFmOGFiaWpqMmw0UGNEMmtm?=
 =?utf-8?B?MlN0cTYwL3V5V0I0R2tFL0xtZC83UHFqcEQyT1hreEZyZWR2cU1HSjJBY2t0?=
 =?utf-8?B?R1p1Tmg5UnR2ZFE2Q2UxcEpEc0VMQW55K1lid3dGUURLN28rS1kxUmtpWVZJ?=
 =?utf-8?B?aW40VXBsSHk3dXFGdGc1K3pWeXRSdWxlTDcvRy9VU2JINkRVcVRtRTJkcnRT?=
 =?utf-8?B?clFLenlBZ1ZoL2hZdXRGT0NYYnN0Nm9Ud09GVTc2YnRrY3cyVEFPVS95dHM2?=
 =?utf-8?B?dzJSaWhhU0QvRkp4Ny94SENWcVZTaERxdTNxbXJXSXY5cXA3Skx3VkpZRVll?=
 =?utf-8?B?dXRxbmM2TEo2VHVWcGFHSUo5MSs2T1NDb2poOGtlRURsMkxnTG1IV3BiS3Iz?=
 =?utf-8?B?K1VyNmZZT1RTMndDM0JEWUFrcmlRclVCcktSY2NwUUJDSjhFVWxTMVJ5bkxH?=
 =?utf-8?B?aUZoeEpMc1NNRVViNU5aalVEdFMzd2p3RW9nOVJkMnZmT203ZEVjclBiZFgv?=
 =?utf-8?B?WDdsMEN2SXN4T1JxZ2NIYzdSTzFQbGM5bzI0UFVuMUJ6Uk4ySnlCcUJYSTVs?=
 =?utf-8?B?OVVqbVBCV3VybDV0NXR6WGxlakRKK2dUMFl2RjZoRVhrSTNmKzFVR3FYSVlI?=
 =?utf-8?B?ZEx4Z2QwWEdXTUhvRm12eVhqNG16SllsN0JRWEprQmw0Z0w0ZEZBKzI1djZQ?=
 =?utf-8?B?SHdLT3ZHek80WEdGd3BjRXkzUC9oalRQVTJEQnRWaTNoUWZURVhBaWdDcWlX?=
 =?utf-8?B?QkhXYjh5eDJSdFFvV1F6cVJiUDZXL3U3UkgzUC9tcmxsK3pBTWFRbGg0elVq?=
 =?utf-8?B?Rk5sVDdaWjJnVGlpeFZ4a0pzK1pMaFJncHQ1ZDY1ZDJDbVJaUW0yeTlJWVFC?=
 =?utf-8?B?dnJOQ2JjUjRVUGYwckRZTSt4aXZleDRCWmZ5MW5vQ1lRTHRJb2xPNjRlM3NF?=
 =?utf-8?B?Z2EyMGhsS0ZkaUJVMHpvU2NFanc2RHlnYUl1akdYby9Lc0o4SHd4TytPWWhK?=
 =?utf-8?B?QWJPT2RPMjlNWWhFSElLSFNJeEhVS0dRYmNVRmhtUEtoZkRlUVdDUFFSUStR?=
 =?utf-8?B?Ty9CMWlKNVllNm1HMkt0a1p6cm9EU2lFeFpWWnB0MlM0ejkzZXZBNXNlcXV4?=
 =?utf-8?B?Z21YelJNb21DaFNyV0txbWdQY2wvcEx5ZU1weHJlQm9FelR2S0MvM1BuRm5T?=
 =?utf-8?B?WlpsUVY4OXRzaWZGRyt4UFFTRE9LMWxGc3F6R0ZHNEVqTU80eTNtaUZzZDYx?=
 =?utf-8?B?cUFtRUlKc2ZlNXVUWUhEV2Rhc3UwcXVtNVVleUdFZDhtUWZ4UDZORXRFT0dQ?=
 =?utf-8?B?YVRpSmxqbm54dDBlMjdNR0ZzbWtTelhIaEVQaUxVdDdrU3dDR3FCSDVqck9i?=
 =?utf-8?B?UjFISFBPNmt1YzE3em5keTgyMjNPOHVlcndwOEtiTU1UQTRzWmF5TjE1VnRk?=
 =?utf-8?B?ZjdVNXErWTAwOVNwQWQwRDEreTU0MzFJTDg2WURrcTIrWGhxZnQxOHllbnZJ?=
 =?utf-8?Q?wvoE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlkrYTBvQ3dFbjRYQ0Y5aXQvUVNOaTM0MnY4NnJ2MjNOMUEyekNML0hKZDZk?=
 =?utf-8?B?dm5pKzlJcHVLNE1MYkpaWWhrT0J3amYwTmtXc3NyRDEwWHV3VDA2RjI3V2Ry?=
 =?utf-8?B?Skxpd0dmOUsyemVRQy9ua3BuZ3lqR0JXQUtYTFlXRTVjbEcvOG5QOFVCYlZw?=
 =?utf-8?B?Q3JBd2o3NmZtK2pKMW9SMWZpSUtFQWlJSURTbmQ2RzdtOTJjWHRsWU9TUFRV?=
 =?utf-8?B?OXk0VEZITENreG5sbGUwUXR1MXVYZ2JrYmc5Ym1XUU9pN3IzYzFWR1NaRzlC?=
 =?utf-8?B?WnlReXAzZ052azRDb1pVWDVmT3JsZWJVRTFZeDBqbDFNUDZMbUhUcEc2Q0lJ?=
 =?utf-8?B?L2RSUktzQWN6MEo5TGIyREJ5VnlTNHlUTm5zZEhSMDF5VGd0RkFNR2N4cmd5?=
 =?utf-8?B?cUp2dWdwN0dsblZ6cWlUOGZjQ29qczdTcndBVnc0VmovYWtJNmkwaTZEbXpa?=
 =?utf-8?B?S2psNlNJeWtuUks1MW1qVmxibXdBYkhZTHEzR0Q3TjZsbkVCMnVKM051U0NG?=
 =?utf-8?B?eWIyQllZZEY0alJRZkxFeGNzQ243NjlFZFhNZ2ZUYVFhVm5HWlE1OVBhQnJO?=
 =?utf-8?B?NFB4QXRBczVFOUcvWG5jNnFmV29jbG16UTdVUFZUWnZDUzg0VGRHS0VJT3BL?=
 =?utf-8?B?ZmtpaUhRK2ovTmE2OEVPNCtkQWlDWjZqbkFoem9mNWRaMUU4R244MzZtVmFk?=
 =?utf-8?B?aW5ocjRvTElXTDlwMUJFMWdHYkZJN1RRZzVhTmNwR1hPeHRWVmJ3Nm9WbC9Z?=
 =?utf-8?B?YmU0ZzRhWHFpK1ViRVdienFNQjRpS0FEZlRVK0xGdldJcFR0VU1yeGNuWmh6?=
 =?utf-8?B?clV2bW5LSlUzSTRQVnRPNU5OaUxGTDJoWDZjSUpnYTEzQ0lUYXp4RlZ1U3Zy?=
 =?utf-8?B?ZmFkNmJXczViRTFtUHVuWktEWk5JWW1ucVN0d3NaR25Ld2ZFdFJTc0hiNU5s?=
 =?utf-8?B?eUJLRm9MY1RPNHArcHNHZ1dlZlpRUGpzOG9lNThiRzdJQ1lIVFhQNUp1OVRq?=
 =?utf-8?B?K3JRRXM3dExKMzhkTmdVQ0RRLzdIM0FuOGZ3TVF4eTlRZU5HYnpvYmhGditX?=
 =?utf-8?B?M3pzQlBJaFpRRFcrNTdFdzc2VHlHVkE3REFWOWhVd25ZN2o5VmpIM1FTV3g3?=
 =?utf-8?B?Uzhxa2J0RnBqQmh2WDRzdzJIZVdXYW16Q0hJWmJoRllncGVuVnFKSUIzZHZt?=
 =?utf-8?B?NzU2UUc2dHd0R2xiSUFvS000c3NHaHR4dXFwYi9SNVN0S2dtMzNNb1RRUTRn?=
 =?utf-8?B?aUZMWEI1OW5kVXR6alVVbit4ejc0Y2FNWmtDTWNkNnRSY0oxcUZFUlpaNFRG?=
 =?utf-8?B?Mis3Q0dmamk5WEU0MjhwNmZGUzdTUmtJOWo5ejkzUTA0Z1dzQmFWcUJ3SlpV?=
 =?utf-8?B?RTcyakVXM3dJbnJtbndBYkRvdHBqVkl6QXphRlFqUWdVK3V0MVFxUVJlNGt5?=
 =?utf-8?B?Z1FINVJJb1pGMktROW92UEhDQ292dEdXUS81RDZhWjZleHdmaWEydS9LSXlB?=
 =?utf-8?B?QVpNREhnTk5Ba2NGVWNvcEVUTkJqSHM0VGRmZWtOUk1lV0VzSU1KQnRodzdX?=
 =?utf-8?B?WUlxM04rekFoVFYxYnMyRTN5L1BQV1liUi9OeUgrYUxpVTVlem9zcG1uRmVM?=
 =?utf-8?B?RUtWTlR4bUs2ZHd0eW9MbTBHY2oxOVNWdTV3eURiRlFXMjdYSG1uS2h3aGhE?=
 =?utf-8?B?M1NGeEdJci9tOTRCNWZ4ek9qYnYzMmVJL2NMQlBXaW9Lck81N3pxTlJCVDFa?=
 =?utf-8?B?aTRENElTblR5dnE3M2xpVENwb0FoalN0R2Y0RUVzMkdzRGdIOWdTZXBIOWJo?=
 =?utf-8?B?Z3ByQUVtK2hCKzhsa1lFUnRPT0loZ3U1TnA0MXZJZ2J1MCttblFOa3pPa01y?=
 =?utf-8?B?OVhjWU51OGNSNVFNcjg0WldrTldMRWlvOXNKS1F6WE16RWtleHl0UXBtdEsw?=
 =?utf-8?B?RTh2TDBNaXhaYzEyQndydElPakVRQjdCTEM1ZkhUSWZ3TFBaTDdHZUFadTN3?=
 =?utf-8?B?ODJRdFkyRkpkazFFWXFJRFBOYnl6T2RMVXRwTzc1eVJlK0NNTm92ZDFnNjRa?=
 =?utf-8?B?TWJBM2U2aW81enB4dXhrNEs3Y2VjaHpueTgwYXoxbUwxSGVZMUdWVythQ2Fw?=
 =?utf-8?B?MWpVaGxvc2lqM0g0MEU0Kzg3K202QmVobG95d1B6M2lWbXBsUmJNcitFTjE0?=
 =?utf-8?B?WWhIa3FLNkRIRGNES0p0SkEweUZ6UjduVndNVmtvQmRuVklBMkZZU1RDMDJz?=
 =?utf-8?B?UU5IUk5POXBQanlMRmwxTE00UkRGSVRVNlNacm9mTXBCMSs0amFNeEo3Mmla?=
 =?utf-8?B?Yk04NTg0SlZjd1UwZEQvblNnMVM0T0I4UHRicE5rZU1VWjNwRjMydz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae9e7cf-d6c6-41c6-2abd-08de6806b9a8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:12:02.8695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uea398+L3Rp4o6wSyupVVZCaHCt4OSf/gH6bhxy8sBUXQL0sLuP8/hszIkSjUNA/yZktb/v7T8OzQMeuo9XRTawSDR4X9k9BI3o+yxNEJ68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5405
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8F0361136D0
X-Rspamd-Action: no action

On 06/02/2026 3:53 pm, Abdelkareem@tibco.com wrote:
> Abdelkareem Abdelsaamad (3):
>   svm/vnmi: introduce the vnmi bit support in the cpuid feature set
>   svm/vnmi: add the definitions for the svm vnmi management bits in the
>     VMCB
>   svm/vnmi: Add support for the SVM Virtual NMI
>
>  xen/arch/x86/hvm/hvm.c             | 29 +++++++++++++++++++++--------
>  xen/arch/x86/hvm/svm/intr.c        | 16 ++++++++++++++--
>  xen/arch/x86/hvm/svm/svm.c         | 25 ++++++++++++++++++++++++-
>  xen/arch/x86/hvm/svm/vmcb.c        |  3 +++
>  xen/arch/x86/hvm/svm/vmcb.h        | 12 ++++++++----
>  xen/arch/x86/include/asm/hvm/hvm.h | 12 +++++++++++-
>  xen/arch/x86/include/asm/hvm/svm.h |  2 ++
>  7 files changed, 83 insertions(+), 16 deletions(-)

Patches 1 and 2 want merging.  They're both enumerations and
configuration bits, although the very first hunk of patch 1 (the P())
wants delaying until the final patch; we shouldn't print out the
capability until it's being used.

The patch subjects want to be:

    x86/svm: Enumerations for virtual NMI
and
    x86/svm: Use virtual NMI when available


Everything here is local to SVM.  Notably there should be no edits to
hvm.c or hvm.h.  By introducing hvm_intblk_vnmi, you break NMI injection
in other cases.  vNMI is just a hardware-optimised way of handling the
hvm_intblk_nmi_iret case.



svm_inject_nmi() wants to gain a check to see whether vNMI is enabled,
and in the case that it is, simply set vnmi_pending.  You have this
partially, but it needs to be dependent on the VMCB vNMI setting, not
some global idea of enablement.

svm_get_interrupt_shadow() needs a similar adjustment to read
vnmi_blocked rather than unconditionally depending on INTERCEPT_IRET.

In construct_vmcb(), you need to check cpu_has_svm_vnmi.  I think this
change is simple enough to be enabled unconditionally.  (We'll need to
change this in due course, but that's going to take other infrastructure
which we don't have yet.)

I think that's everything that needs altering.


A couple of other minor notes:

In the vintr_t union, use an anonymous 3 bit field (literally "u64 :3;",
which is valid syntax) instead of renumbering the rsvd$N fields.  That
will shrink the diff.

Xen's style has spaces inside the outermost brackets for control
structures, and {'s on new lines.  For the functions you're modifying,
just copy the surrounding style.

~Andrew

