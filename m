Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E1DAAC088
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 11:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976981.1364076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCF2R-0001nO-4z; Tue, 06 May 2025 09:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976981.1364076; Tue, 06 May 2025 09:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCF2R-0001kN-20; Tue, 06 May 2025 09:56:35 +0000
Received: by outflank-mailman (input) for mailman id 976981;
 Tue, 06 May 2025 09:56:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sc8A=XW=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uCF2P-0001kH-Pu
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 09:56:33 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2009::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62182267-2a60-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 11:56:31 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB5733.namprd12.prod.outlook.com (2603:10b6:510:1e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 09:56:23 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 09:56:23 +0000
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
X-Inumbo-ID: 62182267-2a60-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgcvY07ZggBUfXt6J9M9eiRrh6oEKdEmxfWcyxfGW4DThIPHXZCSH6nawrHYma1GbJKXfzLT0/j52x0c9IuFFs8R+GuIfy04XHvd7LkaXrlTLA5T4z8XnG3hWO/EgdksIXPjBAPcBJOh445BWIQSgA6KchehWENCYoq6FRfycZ67VL0nA0J0l8tc2p0dTsFQ6UidYhoprmnT6/SQQusLGOsX46FetWpEZ64RNecuqgM8pMHExYCCZa/O/CB05ODHskRwSYDWbdMPP45oFYhMgykvo3TWvHiq1OQ+h72JaYFZvfxVH2nGWmb5wRd+/FJU2tgsl0yP6kvwAUBqjvKKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Fi5YFBTDWu0nQZVLY0j6+CDbFegIRkOkjS6nhye0l4=;
 b=m++KuVn9Khlf+XKGrap4hfMohQQPcOyRJM8o46cM6Szy+lUhK7SyWrTeSTnXbaU6As9k2WTXKRKMtARydSnZdyMkh/KJhRu4i2NfMsfZnLxS92HQtPaDx5dfRzUOW/o03Jmb+aeNoMgKwig85GCkszGReEN/Py5rSNPzw2x2X3nsVBxPkXYSBSxhrpTuWEMQJzag5k5FnK6MGovWZ2hJotHXPVTL9jfXWOYIJkJJt0SJae1T/GqJ6krSB6FtNPJlRSq8LCaThWqcV0b5gotd+zlf9lsPzhsNDvxOV0TblBE7aPW+obRD0Wcuz/4lJCQzBsGbEevXI4U3vTJM8I0/3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Fi5YFBTDWu0nQZVLY0j6+CDbFegIRkOkjS6nhye0l4=;
 b=M90EnsYtFjJGfGJcPgnB7yOBJLe4Rt7cP596dGsikd0Q/HZBnWEmAfsrI4D3aAUuQEHkbNRpn5MSfHKQ2XNehc9Hnc4g292FF4uoVqPrftmIJWW9/HhoieTTohcX6Q6/x80enj+YhlBaFyropF1jvqBVdvDpKZur3hJLuupvI/0=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 03/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Topic: [PATCH v4 03/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Index: AQHbrRCmWPNHyarMuUaK4nZ2TXIaALO5UliAgAwsfxA=
Date: Tue, 6 May 2025 09:56:22 +0000
Message-ID:
 <DM4PR12MB8451D953F012FF8FA90C5832E1892@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-4-Penny.Zheng@amd.com>
 <2e1de23f-cc79-4d37-8667-0afd07736db3@suse.com>
In-Reply-To: <2e1de23f-cc79-4d37-8667-0afd07736db3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=c756dc54-ffb3-4a2e-9c0a-fd4cc4d57b01;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-06T09:56:14Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB5733:EE_
x-ms-office365-filtering-correlation-id: 4d8edbba-4d3b-42f8-39bd-08dd8c844226
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?blRmWitEYzlwVjVnYVFqcndYdHY4YkI0SFhscmlNQ0JKdWtycXZMakZVRmd0?=
 =?utf-8?B?R0tucURxdFZkTkk4ZEJFdHc5dnZLSlljMnJvTitpQVN3d016eWVRK2NqbVhX?=
 =?utf-8?B?Y0dCOE5KbzYzcnRHV0p6YXoweitCekVXWXlyU3JMc2Z3UGVIYUFWSWVqdWZD?=
 =?utf-8?B?OFNaYlY0NVZ6WkFRRU11NEQ3WDFFdS81aWNZSTNJNVZib3ZtR1d1NTVhdFpr?=
 =?utf-8?B?RjlMaTVnSjRNWE56MURCam1BdmdiQXRPNmtiWnEvcUMwbThUUmdqUTkvN01I?=
 =?utf-8?B?SlVaQm1VU01ZcE1zd3hBMkk0UTBUME56NWc1MTBJM0VwaVI3UXJHM3hxY3Y0?=
 =?utf-8?B?K2x5WXJVNTRYanl5ZDN2ZE9PWmY3czRyT0hqd1k3cFIxNFkyTlFmVWw2aWVv?=
 =?utf-8?B?T1gyU3RUWUdhUHRBOXkxZWd0SGJFTjB3TEJNL0lneGhST3ZyN2Z6aXdlUTJt?=
 =?utf-8?B?Mk9hU0sweG1JZ3dtb3NoSTNVUHRMeFFLUTlZRzJRWENLUkYyZnE5QWNaYWZP?=
 =?utf-8?B?OXZxRXB4S2dXNEdUSEVnN1RaMmRyWm91bUd3RjdhZlNhQTlydkg2UVNZcGRM?=
 =?utf-8?B?LzNDeEpick9HRzdiNmlDNzZVRnVQWDFGd1lWczV0TW05THliUWY4WjFCR01I?=
 =?utf-8?B?aTNNQVJFaG8xcTZ3c09Yc3BSK3F6b04rTzZLRjV6MEZIWW5BdXk0dGZCUzNH?=
 =?utf-8?B?NEZZT09qYXExNDVWQnFyeS85VHNHYWVaRHcwZGdZRUhxZlJjNVF0dWIxNmFN?=
 =?utf-8?B?RjZZY1AwS05wd0w4dCtIU2ZzZFJCVmUzeDdQck9LVGFuTHMzVTRIZGpOdDFS?=
 =?utf-8?B?NzlhQmpiS1QzUDlaNlBGVGhSTjhoSjhON2xQYityZ1c3UGRpZ2xYSUljaHhx?=
 =?utf-8?B?bTdPbXZHSno2MVl1dGhZTVVhTEtoVHFZeEdkcS9uTEY4WFkvS1VFUFo1cmt2?=
 =?utf-8?B?SVVFa2UrcjRxalNQTnU2czE2M0pMaFBUaFdRTVNDVFB4V2dOaWIzUkVmZEpo?=
 =?utf-8?B?d1hZYTU0L3F5S25kTmI0bnZ4UVltYmgrMHNtWW44eFdnakZ5S1hzSlYrRlph?=
 =?utf-8?B?bU8wMUdWTSt4RnBad1FZNXk5MGJGTHZRZUl0cmVCc3hIR0lQTmNsMSs3M1Ba?=
 =?utf-8?B?cWNLbktFUlJqaVNjcmphQXZiMUkyMjNLSlg4ZlBMT0M0TUtSUEU3dCtobmlm?=
 =?utf-8?B?T3FrcHBYK2NKSFpNS1l1bEdhODdEeFExUWh6QkI2SzV2dk81SzBpcTJJNmhu?=
 =?utf-8?B?U25UL2VDb0NDb3lROHB4YkxIM3N6UkpWNzRSUldmZFV2QmRtSjNQWHZQY1Fp?=
 =?utf-8?B?Q3hseXlQU3pQWXp0bXlYSGFXSHpwdVdMMTNabThGaGpLTWdnY3pKeCtQd2JT?=
 =?utf-8?B?aHljSGR5RzVVTVIvTVZEdkFOYlR5SEpnc1ZYZmJraWZrYXBOT0dwZDg1Mm9w?=
 =?utf-8?B?MkJ4SVpCQ0ppWEE4WmpHZS9jT1FoUEN4cVdHSjYrQ0pFZTN0YzBPKzcrdWMw?=
 =?utf-8?B?ZnRvVWRIbm9mc0FpeGtBOWppcHhveEFMY2FqNGhHKzdxdU9CckV3VkVPcktO?=
 =?utf-8?B?WmlYT1FpNjRWeWxlRGFhSDZ4cG01YTVDUk51eitvZWxzT2VabDgyRVU1cnpU?=
 =?utf-8?B?aGNVL0JiYzE0RzQ0UlVodTRYMmFDb1YwZ1RqMmhYVFZpdVlTZ1YrTE15MHYz?=
 =?utf-8?B?azN2ck5NeW82NFo5ekpmTThlcTFTbWNWK05DS05ON04wTnN0WVBWTmZWNC81?=
 =?utf-8?B?QnQxUmxJK2hoNzl5MEptVGRQcC9wZ09pQ0lFN0FzT2hvZ05CSTRGWG9IVzJz?=
 =?utf-8?B?V0JGQmw4N0VERU1mUk9MQXBVRlh6c0Z5RThacW51RGdMbmtuSnpEcHBzdE9p?=
 =?utf-8?B?Zit1aHpxcGVuN09iYXRwWU90bk1sZmhvbElmVDY2dHdjOVBENFdFdmVQZ2tY?=
 =?utf-8?B?UzdoekYwRGZURzNBdWJnQjBtcXIzYzJ1c0QzRnhPMVRhY0NHeVNlSnpxUk1R?=
 =?utf-8?Q?9hYvj+UDJclv42E/rRxWc7Nrkiv6QM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUY1SENBck9qZjc5WlVPVDJJREQ2bVgyZzZCVC9DditLL1pML0pwV0pKSkVr?=
 =?utf-8?B?MitQdlV3NGpHRGlCTXBiUWEzT2NwQXdqUUxCMGNsUFZaRkMyTEdITE4xcXRU?=
 =?utf-8?B?ZlpDeHBnam9jb0lHU0sxS0llMHlBc0xoRlNJUXZ1SHY3d3pnQmFWVWFWT0tK?=
 =?utf-8?B?SHd2UktxMWFZN0ovWW5PRndsbEhkUU9LNDVHeGJrTlNnZGl3MUhLYW1uSU9P?=
 =?utf-8?B?ZE1ST1dYTnRnOEMzYXhJeG5HdGQrOE85TW5iTDNzTldPaWtROXoyN1NIRkdi?=
 =?utf-8?B?Ui9MK1E4bkJKWmtpYVQ0THgxYWh5dGZKV1RFSVVoSDY3NjVmVWs0Smdza093?=
 =?utf-8?B?MGdNcUpvalQ0WUcvaHZBeUxnNEtvOFlLVG96THJ4alVUMXBMWkZITm5QSWpF?=
 =?utf-8?B?SExxNUd0SlpTZ0Z5VE83U0VJekhJT2c3NTZIcy9GanJya0laNTRTdllKaFEx?=
 =?utf-8?B?WjVvRWNEOXZvTXBLbXJiaTg5L3pFRVE3ZEhWNk13Tjl5elJ3MGFoSWF3dG1l?=
 =?utf-8?B?UE1MdTd1UkFGbzdUWWxRR0ROcjFEejlqMkhuVzBwMW5jMDUzQmFPaDc0b2pT?=
 =?utf-8?B?MzVybDdpSHFHQkw1N0dLT0t2SWV3N1hxaHBXRFFzcUREYmhNZzczN2NmMGV4?=
 =?utf-8?B?d2hrZWxwbmRPNXZmQldic0Y2NHFTVXEwNHZrUWt4VEVFSkdlR3lrdVc5VWpH?=
 =?utf-8?B?dUxRdGUwS2tSTjhuaHA2UmFSS1J6bjhVR093ekRaVnRSUmRvSnd0bTZTL1BM?=
 =?utf-8?B?bkdJejNScGlPTlJncXhzS011ZzJsTlNWWEQvaFByUGZFMUJzU3hhM2MxMkZ5?=
 =?utf-8?B?WHJMQTRDMWNFS3NYQlpFZE93Z3ZGODJSTitzWSt5bGZTOW5kRGJCeU1CMjI3?=
 =?utf-8?B?WDhoaTFyRzVOM2pUZTlaazNyRkgyejY0VFNlWFhjYzUvSWtUa3B4RGxHd29F?=
 =?utf-8?B?cU1IWnZ2Nno5b2xuM1lsOEtZODZMWjFaZWNMN0YrSTNaUmtaQklINkdUODhh?=
 =?utf-8?B?VFgyQXIzUDVZckZtaWtpUDdTUC94R21mZ2VGVVN1dVJzUGZycXFROWtjeml5?=
 =?utf-8?B?UW1mWWlpOWdleWhxUUZ4WG5uK2xPc3UweldILzVVQkFEL2dEL21KcDhFOHpt?=
 =?utf-8?B?ZVJLcENxK1dsL2lIOWxobkpmdDg0Y2dLVGVNaGxDbkFlQlk3MC9Fa0NtRmVG?=
 =?utf-8?B?eHJ1ZUVjdmlNTk9TUXVEd0ZMWjJjNFRLV3ZqcmRPNEtrSTJRbWR2Z1Z3c0p1?=
 =?utf-8?B?MzhLT0ZEbWkwQ0N0ODRlMjJ1cEovMEVCYTRHQktnUEpsRjM0U1NXWFZYalJ3?=
 =?utf-8?B?OGFnbmdhQ0JTUk9CS3l4SjVMVnN2dEVqNUtISlhYci9vTXVONXViRGNQV245?=
 =?utf-8?B?Vm5jdTJyUDhUUE9TbDRmL2xQRU5JcGlOYzBqbzl0QmRXamlmSlRsdW5SSUhn?=
 =?utf-8?B?dzd2UDEwZDN1NDh2Y0hNTzlncmpBRzJTaXd4b0ZNUTNzNmFIck81SU00T0RT?=
 =?utf-8?B?NW1FK1hCNjBUYkF0NkhoZWhlVVorSUV0VTNEVDdKNHhpWVdLR3FDVWVhamIx?=
 =?utf-8?B?ZENDNm13RDIyT0tETUtGS09UVVRHSXJvRFE2VEtESTJUclcxOEdHOWlLUXRx?=
 =?utf-8?B?VFBzb295SVZtZVJiN2JUeHpzNUpCMjduS3hDOHk0Zm0xcklQbU5nbG54d1hQ?=
 =?utf-8?B?Tm5sVUdtclE2VGVHb2F2TTdiLzRSd0VRcUcycUEzbmJia0RXa0JTbkxBb2JB?=
 =?utf-8?B?YlNDcEUzbjhMK0RONzV6YTVIZzk5aGdYSFpLT1Mwd2tWTm9MWHNoTHR4M2Zz?=
 =?utf-8?B?MVZSSnRaYnBQVHRpYVhacjh0OFhGRUJYWms2YmZuWFpLZjB1cTR5Z0lvYksv?=
 =?utf-8?B?MTcxSnNJc3hQckRtL05iSGtFU0tMeVlad0dCZGJUYnN6Y2JxSGNPTXdLVkxW?=
 =?utf-8?B?Qmg1aFA0Um5tdi81bkZ3L29ISGdLRTVJdlB5b3FCRVVXNGpjK0JtcGFPaHJz?=
 =?utf-8?B?Zm9WWnpRMTlRdUdHcEQyVHk1T3Q2SVZXeGZVdm4zQUVYaHdBRmNnWlNSdGU1?=
 =?utf-8?B?SnZDaVh1Mnl2WVcxcklyWUN3UjJJRVhTaGNzV0hBNTRzYVMrNFNoL0FvNnV2?=
 =?utf-8?Q?MhIQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8edbba-4d3b-42f8-39bd-08dd8c844226
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 09:56:22.9465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LnqBwga0v8pYuAVsutFk8SNFzOdSRyZb8f/g9JZj3qnmrsFBbYHeWD5iq50T4N9shuNW1zBLaufP1Vjrq87haA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5733

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIEFwcmlsIDI4
LCAyMDI1IDExOjU3IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47DQo+IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNo
PjsgT3J6ZWwsIE1pY2hhbA0KPiA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgMDMvMTVdIHhlbi94ODY6IGludHJvZHVjZSBuZXcgc3ViLWh5cGVyY2FsbCB0byBw
cm9wYWdhdGUNCj4gQ1BQQyBkYXRhDQo+DQo+IE9uIDE0LjA0LjIwMjUgMDk6NDAsIFBlbm55IFpo
ZW5nIHdyb3RlOg0KPiA+IEBAIC00NTksNiArNDY0LDI2IEBAIHN0cnVjdCB4ZW5fcHJvY2Vzc29y
X3BlcmZvcm1hbmNlIHsgIHR5cGVkZWYNCj4gPiBzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9wZXJmb3Jt
YW5jZSB4ZW5fcHJvY2Vzc29yX3BlcmZvcm1hbmNlX3Q7DQo+ID4gREVGSU5FX1hFTl9HVUVTVF9I
QU5ETEUoeGVuX3Byb2Nlc3Nvcl9wZXJmb3JtYW5jZV90KTsNCj4gPg0KPiA+ICtzdHJ1Y3QgeGVu
X3Byb2Nlc3Nvcl9jcHBjIHsNCj4gPiArICAgIHVpbnQ4X3QgZmxhZ3M7IC8qIGZsYWcgZm9yIENQ
UEMgc3ViIGluZm8gdHlwZSAqLw0KPiA+ICsgICAgLyoNCj4gPiArICAgICAqIFN1YnNldCBfQ1BD
IGZpZWxkcyB1c2VmdWwgZm9yIENQUEMtY29tcGF0aWJsZSBjcHVmcmVxDQo+ID4gKyAgICAgKiBk
cml2ZXIncyBpbml0aWFsaXphdGlvbg0KPiA+ICsgICAgICovDQo+ID4gKyAgICBzdHJ1Y3Qgew0K
PiA+ICsgICAgICAgIHVpbnQzMl90IGhpZ2hlc3RfcGVyZjsNCj4gPiArICAgICAgICB1aW50MzJf
dCBub21pbmFsX3BlcmY7DQo+ID4gKyAgICAgICAgdWludDMyX3QgbG93ZXN0X25vbmxpbmVhcl9w
ZXJmOw0KPiA+ICsgICAgICAgIHVpbnQzMl90IGxvd2VzdF9wZXJmOw0KPiA+ICsgICAgICAgIHVp
bnQzMl90IGxvd2VzdF9taHo7DQo+ID4gKyAgICAgICAgdWludDMyX3Qgbm9taW5hbF9taHo7DQo+
ID4gKyAgICB9IGNwYzsNCj4gPiArICAgIHN0cnVjdCB4ZW5fcHNkX3BhY2thZ2UgZG9tYWluX2lu
Zm87IC8qIF9QU0QgKi8NCj4NCj4gVGhpcyBiZWluZyBhIG1lbWJlciBvZiB0aGUgbmV3IHR5cGUs
IC4uLg0KPg0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hsYXQubHN0DQo+ID4gKysrIGIveGVuL2lu
Y2x1ZGUveGxhdC5sc3QNCj4gPiBAQCAtMTY4LDYgKzE2OCw3IEBADQo+ID4gICEgIHByb2Nlc3Nv
cl9wZXJmb3JtYW5jZSAgICAgICAgICAgcGxhdGZvcm0uaA0KPiA+ICAhICBwcm9jZXNzb3JfcG93
ZXIgICAgICAgICAgICAgICAgIHBsYXRmb3JtLmgNCj4gPiAgPyAgcHJvY2Vzc29yX3B4ICAgICAg
ICAgICAgICAgICAgICBwbGF0Zm9ybS5oDQo+ID4gKz8gIHByb2Nlc3Nvcl9jcHBjICAgICAgICAg
ICAgICAgICAgcGxhdGZvcm0uaA0KPg0KPiAuLi4gaG93IGNhbiBpdCBiZSA/IGhlcmUgd2hlbiBp
dCdzIC4uLg0KPg0KPiA+ICAhICBwc2RfcGFja2FnZSAgICAgICAgICAgICAgICAgICAgIHBsYXRm
b3JtLmgNCj4NCj4gLi4uICEgaGVyZT8gQW5kIHdpdGggaXQgYmVpbmcgPywgeW91J3JlIGxhY2tp
bmcgYSBwbGFjZSB3aGVyZSB5b3UgaW52b2tlIHRoZSByZXN1bHRpbmcNCj4gY2hlY2tpbmcgbWFj
cm8gKHdoaWNoIEkgYXNzdW1lIHdvdWxkIGNhdXNlIGEgYnVpbGQgZmFpbHVyZSkuDQo+DQo+IEFs
c28gd2hlbiBsYXlpbmcgb3V0IHN0cnVjdCB4ZW5fcHJvY2Vzc29yX2NwcGMsIHBsZWFzZSBhdm9p
ZCB1bm5lY2Vzc2FyeSBnYXBzDQo+IG9yIHRhaWwgcGFkZGluZyAtIGl0IGxvb2tzIGxpa2UgInNo
YXJlZF90eXBlIiB3b3VsZCBiZXR0ZXIgbW92ZSB1cC4gSSB0aGluayBpdCB3b3VsZA0KPiBhbHNv
IGJlIGEgZ29vZCBpZGVhIHRvIG1ha2UgcGFkZGluZyBmaWVsZHMgZXhwbGljaXQsIGFuZCBjaGVj
ayB0aGVtIHRvIGJlIHplcm8uDQo+IFRoaXMgd2F5IHRoZXkgY2FuIGJlIGFzc2lnbmVkIG1lYW5p
bmcgbGF0ZXIgKGlmIG5lZWQNCj4gYmUpIHdpdGhvdXQgYnJlYWtpbmcgYmFja3dhcmRzIGNvbXBh
dGliaWxpdHkuDQo+DQoNClVuZGVyc3Rvb2QsIEknbGwgcmUtY29uc3RydWN0IGludG8gaW5jcmVh
c2luZyBvcmRlciBhbmQgYWRkIGV4cGxpY2l0IHBhZGRpbmc6DQpgYGANCnN0cnVjdCB4ZW5fcHJv
Y2Vzc29yX2NwcGMgew0KICAgIHVpbnQ4X3QgZmxhZ3M7IC8qIGZsYWcgZm9yIENQUEMgc3ViIGlu
Zm8gdHlwZSAqLw0KICAgIHVpbnQ4X3QgcGFkWzNdOyAvKiBwYWRkaW5nIGFuZCBtdXN0IGJlIHpl
cm8gKi8NCiAgICAvKg0KICAgICAqIFN1YnNldCBfQ1BDIGZpZWxkcyB1c2VmdWwgZm9yIENQUEMt
Y29tcGF0aWJsZSBjcHVmcmVxDQogICAgICogZHJpdmVyJ3MgaW5pdGlhbGl6YXRpb24NCiAgICAg
Ki8NCiAgICBzdHJ1Y3Qgew0KICAgICAgICB1aW50MzJfdCBoaWdoZXN0X3BlcmY7DQogICAgICAg
IHVpbnQzMl90IG5vbWluYWxfcGVyZjsNCiAgICAgICAgdWludDMyX3QgbG93ZXN0X25vbmxpbmVh
cl9wZXJmOw0KICAgICAgICB1aW50MzJfdCBsb3dlc3RfcGVyZjsNCiAgICAgICAgdWludDMyX3Qg
bG93ZXN0X21oejsNCiAgICAgICAgdWludDMyX3Qgbm9taW5hbF9taHo7DQogICAgfSBjcGM7DQog
ICAgLyogQ29vcmRpbmF0aW9uIHR5cGUgb2YgdGhpcyBwcm9jZXNzb3IgKi8NCiAgICB1aW50MzJf
dCBzaGFyZWRfdHlwZTsNCiAgICBzdHJ1Y3QgeGVuX3BzZF9wYWNrYWdlIGRvbWFpbl9pbmZvOyAv
KiBfUFNEICovDQp9Ow0KYGBgDQo+IEphbg0K

