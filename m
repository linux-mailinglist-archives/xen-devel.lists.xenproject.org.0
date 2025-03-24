Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5BCA6D404
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 07:12:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925064.1327941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twb25-0005V1-QW; Mon, 24 Mar 2025 06:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925064.1327941; Mon, 24 Mar 2025 06:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twb25-0005Sa-JX; Mon, 24 Mar 2025 06:11:33 +0000
Received: by outflank-mailman (input) for mailman id 925064;
 Mon, 24 Mar 2025 06:11:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zPYW=WL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1twb24-0005SU-Be
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 06:11:32 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20620.outbound.protection.outlook.com
 [2a01:111:f403:200a::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d275faa3-0876-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 07:11:29 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SJ2PR12MB8033.namprd12.prod.outlook.com (2603:10b6:a03:4c7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 06:11:24 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 06:11:23 +0000
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
X-Inumbo-ID: d275faa3-0876-11f0-9ea2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xa521I5NK1N0qYqXCwv9FhExxCn2sl75ZOv09qG3L5fAGFTmcC/04cxec5AdNpwjm9qbLeHhGViKt9sweiFAkPzXpKug8pZMTb03EMVwNSY0/AZi9N0on8pHxhCTL3is5E4MqQuHKuizeh83re5KQfhUohZ99mSR8+oS+kx9keff9RMrCTcbVLnJpY7RbAOVJVkSPWdpXfXam4xf3PO8fz+b+/smy4hOEKUkorLSGOy3zAuE0XLShv7MluGX088ZJbcIz2QOBzTgeCCeisYLTF195hSU8sg1kQy5RjHtGaJfjdPJLpdugQf7R0lMY0ta+cTe8U8blGiEhsXX1AizIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoCPXFFy/VixYeu/vSfSXD92+fcsmIVtvt6FZKwoOSA=;
 b=aNvJcvMpNazHBiBiq8dNNe5N5Qtzs/mru1UYQVRRcO3vmFn0rDSupdVOBJZuTmhDpQVnFehwZxHVWcF/c7tblT8lkvVoUYm+Yz/414beN50YMOfbzuCEKgnxlr8gfzgKjh8AIEhIV1/brJx3LJJMKYeweIP/PaGr67M7azXW/cW32nc6KSdI5ad9R26FGo/CiPQ7Kekpn5hbOZomqdI6QZ71bOR1R00UCZobbs00b3dEYc9M5xqHip09wCEyp3ygiNGJGCj/Gp9uR9hLcNOWIOtVQ7F7L1CLXysz+c5WRX74+x0YWTOWV4Eo9QrvlbSBLFVmsO+aCNF3C8SGg25qyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoCPXFFy/VixYeu/vSfSXD92+fcsmIVtvt6FZKwoOSA=;
 b=jCFdTIIeI/10CJMG9thQlVG4T+WRHhmoP0zrxo+sstBlDNrlySR8cbPJnD94gO0mZYPYxmclhJbyUi4zo9H7oRwG3m5CQbXme9dFfns11XQHrm+B4Sx0zZUKuSdhFaaHDTy+smbGQwqUIyDiA6NnplHd7lH8yRbVAjLuvOjn1Pg=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Stabellini, Stefano"
	<stefano.stabellini@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, "Orzel, Michal"
	<Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 19/19] xen/sysctl: wrap around sysctl hypercall
Thread-Topic: [PATCH v1 19/19] xen/sysctl: wrap around sysctl hypercall
Thread-Index: AQHbkwRXyEkrSerVt0iFQGteEr0L77NyYIYAgA9/XQA=
Date: Mon, 24 Mar 2025 06:11:23 +0000
Message-ID:
 <DM4PR12MB84511A7BDC5CA67B4C5CB7D1E1A42@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-20-Penny.Zheng@amd.com>
 <b8e760b1-df5a-414e-862a-34fd66f957c3@suse.com>
In-Reply-To: <b8e760b1-df5a-414e-862a-34fd66f957c3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=e9a7af12-7811-42f3-b2a2-533f3402a854;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-24T06:11:12Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SJ2PR12MB8033:EE_
x-ms-office365-filtering-correlation-id: 21df49d8-84ee-4119-a652-08dd6a9ab44d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dTVhWDNJKzZwbGRVOWRmSCtvdm1iK2RXdEhuN3JLQXA5RXFEa1pwWUEva3hL?=
 =?utf-8?B?WTJhOTdlV1hFa0NpMWRCUzdWc2tZZE81c2grbFhjTGRmaVcvZWlrdC9SOE9G?=
 =?utf-8?B?c2R2SFJUbjBudG54NVE1Wi9samUydGRvb1JXY2xmU3A0V2lJb3ZYZjg0L0Ft?=
 =?utf-8?B?d1hZUFdNVHBIaG1CMm11aXQ3elZEbDR0S014VU9WT0ZaWFdqUG56M2xIRTBr?=
 =?utf-8?B?QUlCeTQ5ZUlYTFlkQkQ4bmFKTlhPWGd3ejV5YXAzQXlKVm0yRVMvdVFDUDJL?=
 =?utf-8?B?ZlNGbHhBQ1RiWHZIU1Q4dld1ZEJMaTgweTM5YWswTHdxRXNkS2lrYTJSRFIz?=
 =?utf-8?B?ZTlhSHNLOVJzVEMrS3pFcG9MaDFzSzNvNFZBK0h5NzVnU2JYYkpLaWdyMXlW?=
 =?utf-8?B?S1FyRkpnV0lJYlpUaU5yMnlwUFBCS1ovWHc3ZnNjdnFXcjhlR2pUTGRvL0xz?=
 =?utf-8?B?d1BtV3NjUUI1Y1FldktVemZwK25vekNLUG5MYjZFVUVlK0Y4U3c0WmlYY3JL?=
 =?utf-8?B?YVU4cFloWXBIN0Y0UzJpdkpkTUxiMlpHaXhFa1huVkpEdlE3ZlpMSmdqcHJ1?=
 =?utf-8?B?U0ptSlV1cEQ4Q3JwRUM0MzhuakJrWEpQR3RVK2pXV2dOY2lHZHl5bEw3STRV?=
 =?utf-8?B?dHNXMFRvNm9FWHpadUtGdVNyY2pOcGl0MUc3L0FNOGRYcXdGU2JZdFU1SzFv?=
 =?utf-8?B?YkpnMXY2dnV3bEtJdEpXYkxyT1hCRXBjcHJwSU5wejBBcmRwVnlXLzBQY0N0?=
 =?utf-8?B?UEJjY0s2Yk5jV0RnNUZRb0syZEdjWGdVMGlnTVBXR25wY3ZlK0dQLzVUZmhW?=
 =?utf-8?B?RTlCeTE4RTRDSmpNQWpwMXdGdm5hSmppajdNZnl5QVdXUk9TN1pOWWZVY1JL?=
 =?utf-8?B?Mkhma3BBR1pxeUVLODN3TmdHWE5GUVhvZkFORzZScGkxa0VDV0dvaVF6c05Y?=
 =?utf-8?B?cGZKZXNjT0NzSnNyNTlNaTl2Mnh0TmN3SjN6ZnR3UTFzdzkyNEdjc3FRRnRJ?=
 =?utf-8?B?WU0rUzczZ0dTYW1KNFNLVVFJMnloWENHRzl4bWg5L3o0WmVwa1ZVTkJZSHZO?=
 =?utf-8?B?TExjNUl1bDQ2Nys1NjdES2hSUEpnVmRmazBYdTZxeUZ3TG5lenZnVTB3cU04?=
 =?utf-8?B?ejU1VWJxS1dXYUdPcUI4aEx0VEVPcFV2ZUZjbGJhQTRjbTNoMDF5N2RHcmY3?=
 =?utf-8?B?TmVZVnNUMEZGZk9HbTk5VWlLWnVJeHc2YnR2eFVGQmRWc0R4K2x1bGdYY25Z?=
 =?utf-8?B?QWRQbVVybC9NTFpheXVlQlJPS0ZsanVncTN0TENOVFgrMHk2emh5QzIxWnJN?=
 =?utf-8?B?Tk9CZWNYN0NhQkx5VmZvbTJxV3J3RXBmNDB5TEpWcWYrSHVVYnE1OG1EMHFj?=
 =?utf-8?B?aTUxTUZ2ZHlxdU4wdU1tN2dnZWpIU00zYms5czh1WGFEOFQ4dU1Bd2wvWWZE?=
 =?utf-8?B?aXJCVnEva3RBdjJTR2FDVUx1ODdtUWlkS2pCejNzeC95ZnJDanJKWnNJd0Fq?=
 =?utf-8?B?dTROdDZCQit0eHFSK09zKzczbE5wYlpMYyt0eHhxZDN2Y0hkTDNhMFE4bElD?=
 =?utf-8?B?ZWV4ZkRXSFNlNnhzbG5DWDZkc2Nqa3lEa1NIM2NFZWFNdDRIeHdTeWs4VHda?=
 =?utf-8?B?eHNJYW9hWk8wbVQwU2o2blgvSU54RFZKNnJzQmhteEhBNWIyMnNsTk56dmk0?=
 =?utf-8?B?dFp4MHBVQkU1R25VaDBsT0dJUmNKWHIwQURueXJPTVgxNDY5cHNOc3hwMUc4?=
 =?utf-8?B?bU00ZTd4ZEIwQVo5VHFXUHpRcGN5Zml0K2FHdXE2YW1wTnZtbU9EUTlZKzEr?=
 =?utf-8?B?U0dOeXVCcll3SkRrSFo3WmVUVW8vRGlNZE16V3dDYjFvS0ZXMTVJWStGTUE4?=
 =?utf-8?B?eitwUnplSEdwM3phbFh3STVmaU1mSjNWT2gwQ3NEQ2RiRTRldlF3R0kyWktF?=
 =?utf-8?Q?ZSTXz4f+eO9sflc7kdAO4QRmuuYpjS8K?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MSthOVNjcHFvRk84b2dGMklYTVpkYkowUEljQUlNRVRPNkVyand6dGhtaGF0?=
 =?utf-8?B?cGN6QkRMV2wwWGRpV3NCeENiZWRISmdWV3BvTm5LQ1I3cThITVcvVVdCRGdn?=
 =?utf-8?B?OVl5aEF5eDJGN0JZMFNBenlQU3djRndRY2dZU3NJSVVQWXJSUnozSFZ6NXdV?=
 =?utf-8?B?WWczYWw5S1VwVW1udTBtc3ZidXlVNk9BQlQ5SHJkcmQ2MWtBRjZqTy9KWkZq?=
 =?utf-8?B?ZE1Hd0lVR1ZZY2cyU2hGZHhPbThKakRBK2t6eUdZcFhUQWdnR011VVFMZWgv?=
 =?utf-8?B?TllIQU44ZnB2eERLcDRuenJVQmtub0dvVVdKRlFzQ3AyT0R1dGwwU0puNnJ0?=
 =?utf-8?B?bER0MVhRbW91dzk5NklHRnRqeVYzMXVzcDUyWFZrTDNiY016MnpHUUxReGoy?=
 =?utf-8?B?Und1SFl1b2l0TW9yRHBwQWo2Q2Jhb2J5b2FFelR2NjZoVGdWRjlnWlA0KzlL?=
 =?utf-8?B?dFI0Y2RUc3lKbk5qZ0hhbkZyU0VIN3M1NHlpSWdGYTRhYzRzWW1UWTZTQzdG?=
 =?utf-8?B?K1M2SjUxNzJRNWpMQ1FKZzVreDY3K3FBYVNJbytDYzY0dmtXN2N4a0tibTYr?=
 =?utf-8?B?SnRDVXcreGZWYWJCWGtTMW1hTUVxenl1V0o3WDJrVDNJc044R3dtdWZscDhV?=
 =?utf-8?B?TEJzcEZ4Sld2VkE3a0lJYkt6N1N3OVVtYW42ZnBFRFExVml5WndqV2V3d0t5?=
 =?utf-8?B?SXdhU0xnZzBZQjRQODVkTmpSemZ3NFhwV3k3dUlvRUlyZUJlTUltYzUrY0Fi?=
 =?utf-8?B?TnYvcWZjbmY0WGFqZC9IMHhORjRFNkdnaW9OakdpRXc5WmxmUUhsc1FUUzIw?=
 =?utf-8?B?ajBjQkQ3cnFwV0NLV25IMjUrUTBSc2NVM3g3ZTYrQm1RNVVTcGRZR0tqUUE1?=
 =?utf-8?B?azU1MFF2QW9kQW5lV25yREhWZW5jUllHcTIyUmJJNVJSdmd5YVFNalpnOUZJ?=
 =?utf-8?B?Y3ViQ2ExZnNmY3ZFemlzbklHSkd6S1JuMWVONFVRMGU5MWMwMFdnRldabjJv?=
 =?utf-8?B?aTlQWXpMaVk4b3FRcG8wS0R5bWRkU3haQjRpQ2tySWwwVHZGY2lTUmhBTzNo?=
 =?utf-8?B?Q1Bmck5WbllIeVRXVHZhTFV5bU9Ka1NpRktIeG52K1hjMlRKb0ltSWliSVFL?=
 =?utf-8?B?ZHAyZXhnSTdFN0dTeGZDSjBYZlMzR0xzb0JhcDgxemE0NzVFQVpKLzUrWjVB?=
 =?utf-8?B?LytmZ0lhMzBuUFpUSTdsRThXdTFVa1RnU3FQNHdHbWh5ZjFmNTBmZytUTGY3?=
 =?utf-8?B?UGhjSlBFM3RER1JTMmZ2ZXBpZ2lYZ0xkRzBzdlRTRjMvNUFMODRSM0RBclow?=
 =?utf-8?B?cGJyVkFNNktWT0dReTRMTE9sOHlWOVFxL3ErYU1aeTZyV2tiRnlzOUhuWDNC?=
 =?utf-8?B?Q1JGMHQ5Ni94RHlMSElRR3VENktPZVB1MXhvMko5bVJCS3EzL3J5clhxMHRo?=
 =?utf-8?B?ZTZ6Wmt0VnpTYk9ySnlPSVhtNkE0T3ByRDFHRnFiNlpaL2srMlJIejVDZURw?=
 =?utf-8?B?NGtFVnZlRDBBQU1zcXN5ajdaOVdhU0pUdENDbmtVbVI4Njd2WS9uaEY0b3or?=
 =?utf-8?B?K01JaVF3K1NMZENHb3h3Rkg4TGR3TWVtVEtuOCsxNmp3Mm5IbkY4MlJGak52?=
 =?utf-8?B?VThmS3lUMER2US9rWWMwVm9qTWl6KzQ5M1l5THVsdFhib09XMlVvRHBOUzVh?=
 =?utf-8?B?K2FqMU9xUDhOVjMwcDkrSjFJM0RvM2tXN2VFd0dRWFdYK0dqOFhyN1M3Qzd1?=
 =?utf-8?B?cjArc2lta1FSamd5bzNxZlE0dzJkT0NkRnpFUGVtVWpjdFo3YnNBT3pyZHBy?=
 =?utf-8?B?WnpIdDhMRmJnRlRCQzBNSkdvUTVYelArNGtibEhRMnJscWRQZU9nYysxekpF?=
 =?utf-8?B?bnR0enZWa2FPRmdZbUQyQ0RCTi9KVXhaVFZiOUNNVzAzdzdTNnJSVEtXQWZN?=
 =?utf-8?B?NG16TGVOWGY1aCttVWo0RXM0c1NkbGE3TGhaVm5RS204cUJCdkUrSXIySS9w?=
 =?utf-8?B?dGEvdnBFdHR1QVRYUktKRnhuUEVvTFpYWlg2K1lpVGpYRjBUS2g3R2h5a3Nm?=
 =?utf-8?B?a1NkTi9sL3lzckxyZ1EvU3QyYXd5THMxcnNtTGN3cXNTaUk3cFQvVTJOcExM?=
 =?utf-8?Q?i5sc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21df49d8-84ee-4119-a652-08dd6a9ab44d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 06:11:23.8509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKHV8DZHmNmORTfLbbfeLz6FnYUY1F7m6O0asabtu9azMo0ePVobnDYxUhP7Qj5tD04KLw84foVSqXlgzbIRYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8033

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDE0
LCAyMDI1IDU6MjcgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4N
Cj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgU3RhYmVsbGluaSwgU3RlZmFu
bw0KPiA8c3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPjsNCj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZh
dGVzLnRlY2g+OyBPcnplbCwgTWljaGFsDQo+IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpDQo+IDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IFNlcmdpeSBLaWJyaWsNCj4gPFNlcmdpeV9LaWJyaWtAZXBhbS5jb20+OyB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAxOS8xOV0geGVuL3N5
c2N0bDogd3JhcCBhcm91bmQgc3lzY3RsIGh5cGVyY2FsbA0KPg0KPiBPbiAxMi4wMy4yMDI1IDA1
OjA2LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vY29tbW9uL01ha2VmaWxlDQo+
ID4gKysrIGIveGVuL2NvbW1vbi9NYWtlZmlsZQ0KPiA+IEBAIC02OSw3ICs2OSw3IEBAIG9iai0k
KENPTkZJR19DT01QQVQpICs9ICQoYWRkcHJlZml4DQo+IGNvbXBhdC8sZG9tYWluLm8NCj4gPiBt
ZW1vcnkubyBtdWx0aWNhbGwubyB4bGF0Lm8gIGlmbmVxICgkKENPTkZJR19QVl9TSElNX0VYQ0xV
U0lWRSkseSkNCj4gPiBvYmoteSArPSBkb21jdGwubyAgb2JqLXkgKz0gbW9uaXRvci5vIC1vYmot
eSArPSBzeXNjdGwubw0KPiA+ICtvYmotJChDT05GSUdfU1lTQ1RMKSArPSBzeXNjdGwubw0KPg0K
PiBUaGlzIHdhbnRzIHRvIG1vdmUgYmFjayB1cCB0aGVuLCBpbnRvIHRoZSBtYWluIChhbHBoYWJl
dGljYWxseSBzb3J0ZWQpIGxpc3Qgb2YNCj4gb2JqZWN0cy4NCj4NCj4gPiAtLS0gYS94ZW4vaW5j
bHVkZS9oeXBlcmNhbGwtZGVmcy5jDQo+ID4gKysrIGIveGVuL2luY2x1ZGUvaHlwZXJjYWxsLWRl
ZnMuYw0KPiA+IEBAIC0xOTUsNyArMTk1LDkgQEAga2V4ZWNfb3AodW5zaWduZWQgbG9uZyBvcCwg
dm9pZCAqdWFyZykNCj4gPiBkbV9vcChkb21pZF90IGRvbWlkLCB1bnNpZ25lZCBpbnQgbnJfYnVm
cywgeGVuX2RtX29wX2J1Zl90ICpidWZzKQ0KPiA+ICNlbmRpZiAgI2lmbmRlZiBDT05GSUdfUFZf
U0hJTV9FWENMVVNJVkUNCj4gPiArI2lmZGVmIENPTkZJR19TWVNDVEwNCj4gPiAgc3lzY3RsKHhl
bl9zeXNjdGxfdCAqdV9zeXNjdGwpDQo+ID4gKyNlbmRpZg0KPiA+ICBkb21jdGwoeGVuX2RvbWN0
bF90ICp1X2RvbWN0bCkNCj4gPiAgcGFnaW5nX2RvbWN0bF9jb250KHhlbl9kb21jdGxfdCAqdV9k
b21jdGwpDQo+ID4gcGxhdGZvcm1fb3AoeGVuX3BsYXRmb3JtX29wX3QgKnVfeGVucGZfb3ApDQo+
ID4gQEAgLTI3NCw3ICsyNzYsOSBAQCBwaHlzZGV2X29wICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbXBhdCAgIGRvICAgICAgIGh2bSAgICAgIGh2bQ0KPiBkb19hcm0NCj4gPiAgaHZtX29wICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkbyAgICAgICBkbyAgICAgICBkbyAgICAgICBkbyAg
ICAgICBkbw0KPiA+ICAjZW5kaWYNCj4gPiAgI2lmbmRlZiBDT05GSUdfUFZfU0hJTV9FWENMVVNJ
VkUNCj4gPiArI2lmZGVmIENPTkZJR19TWVNDVEwNCj4gPiAgc3lzY3RsICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBkbyAgICAgICBkbyAgICAgICBkbyAgICAgICBkbyAgICAgICBkbw0KPiA+
ICsjZW5kaWYNCj4gPiAgZG9tY3RsICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkbyAgICAg
ICBkbyAgICAgICBkbyAgICAgICBkbyAgICAgICBkbw0KPiA+ICAjZW5kaWYNCj4gPiAgI2lmZGVm
IENPTkZJR19LRVhFQw0KPg0KPiBBcyBpbmRpY2F0ZWQgZWFybGllciBvbiwgUFZfU0hJTV9FWENM
VVNJVkUgbGlrZWx5IHdhbnRzIC8gbmVlZHMgc29ydGluZyBhcyBhDQo+IHByZXJlcSBhbnl3YXku
IE90aGVyd2lzZSBJIHRoaW5rIHRoZSBuZXcgI2lmZGVmLXMgYmV0dGVyIHdvdWxkbid0IGVuZCB1
cCBpbnNpZGUgdGhlDQo+IFBWX1NISU1fRVhDTFVTSVZFIG9uZXMuDQo+DQoNCk1heSBJIGFzaywg
aWYgd2UgZHJvcHBlZCB0aGUgZWFybGllciBjb21taXQsIG5vdCByZXBsYWNpbmcgYWxsIHRoZSAh
UFZfU0hJTV9FWENMVVNJVkUgd2l0aCBVTlJFU1RSSUNURUQsDQp3aGF0aGF0IGlzIHRoZSBuZXh0
IHBsYW4gZm9yIGl0ID8NCg0KPiBKYW4NCg==

