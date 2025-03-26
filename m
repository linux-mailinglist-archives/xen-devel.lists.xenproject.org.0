Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E870A7142F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 10:54:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927444.1330188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNSu-0003lE-B5; Wed, 26 Mar 2025 09:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927444.1330188; Wed, 26 Mar 2025 09:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNSu-0003ji-7u; Wed, 26 Mar 2025 09:54:28 +0000
Received: by outflank-mailman (input) for mailman id 927444;
 Wed, 26 Mar 2025 09:54:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txNSt-0003jO-7I
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 09:54:27 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2414::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b18ba91-0a28-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 10:54:24 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Wed, 26 Mar 2025 09:54:19 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 09:54:19 +0000
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
X-Inumbo-ID: 4b18ba91-0a28-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQbvyjjHlyNF5EqFizODhL2jr4D9k5I2MuAEL153TnP45belntNoufXE9QZZ+baj9vo2gG0W29UrPznUPnJftj3XWkn6TV5z9S+fQJWffSOt6CVuKQsNhH2Z4Gseqss6lOwF3UM3htavtJcXBmLLIBo03IdD4sgSM803zqYDuoIQqPFCOrR7tc+hNIoHbYPTffmWJPLe+C6H9VVjcoM6HkA1BdjV5JjdIl9DwnNsOeCwG0BqsSEFdUgpgQpPPsJLvUPIoQ0MaS5OVsKTqldre1fWNt6USvD7/BvVZQllDC6/ZFSp+qzpTtrxnKnjPy4lYBL6vOoD0zNv71iegGnOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1USe14N+eQYu2sJmZmGek94D5jZfVO7DX/TLoDzNXdo=;
 b=xDQzsz/Mbc7xGR2p6cYbylIHuG+g+HgdzERbMYaGS9dL1JBV2h9p6N9vnOyY4CTtXJwXGk+LoVVtI7Y4b7uBJniUy3Dnfh0syYRWXgW/zzDd7IJG9ycmstlS6kty36C6w6hv2W+IXExEDkGe0lCOqRVHYOJbOw7JpXqw7ZwjnD+CX9dw7jUigF0baLRT+zfmFs4JfLGUmVOquLC8GYCoGXMEqCBFXVWrRuRkexAz2m2K3qNNw+0G5z+jdA1HQDLFZk9bsxya7pjN5025XzkXVJL1sfekM6DUeotjWXkjEY1Dq5Ncs7orFJipGgBPShuFKhNlQScEIVU8OTP1kH7faQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1USe14N+eQYu2sJmZmGek94D5jZfVO7DX/TLoDzNXdo=;
 b=bn71k20X+a/kQkYtMRtCEXivYAppyiADKJzF3vHw9m7ec5aNHBkemaZsXHYFaes2KqIOsow8oNocDuWW10FS8Vwi0J/MtksTq41sBGn2nel2PGTFLFU9iXXPisnSbtWesngpQYufQ0cONcgoiGfx/UQIlz6fQecRb6EfwcMkeDM=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: RE: [PATCH v3 07/15] xen/cpufreq: fix core frequency calculation for
 AMD Family 1Ah CPUs
Thread-Topic: [PATCH v3 07/15] xen/cpufreq: fix core frequency calculation for
 AMD Family 1Ah CPUs
Thread-Index: AQHbjnNvmMkhQOT4QEqCqJEcRIbe17OCi0SAgAK+gSA=
Date: Wed, 26 Mar 2025 09:54:19 +0000
Message-ID:
 <DM4PR12MB84515BDB3E64C4AEA561B266E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-8-Penny.Zheng@amd.com>
 <0b340303-db4e-4723-b53d-178b2676a36c@suse.com>
In-Reply-To: <0b340303-db4e-4723-b53d-178b2676a36c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=4fa8022c-96d6-4d92-975e-825418f8735a;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-26T09:53:39Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MN0PR12MB6246:EE_
x-ms-office365-filtering-correlation-id: 86fbc9c0-e598-49d6-141e-08dd6c4c2dd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MForL2I0eFJPWGswV0dKekJHUDR5THF0VWxaTUFXeEVsdDF2THJVV1NoWFRo?=
 =?utf-8?B?TmtmWHY1OUxxN3pqbTdRaXpLMGYvSUNoMnU0d2QvaWhEVVpiR2h4aW9CMzRP?=
 =?utf-8?B?SFNCYUhFWlhoVVhWejEyVGsrZ0xWMVVqVzkvenFqWU94ZlFjdkR4M2dYL3Iz?=
 =?utf-8?B?b3J6b1k0QXpKSUF4cXh2U0JZOFk1WitVZlJhYWJxV0wwOWlQYVZ3UUtlSTZw?=
 =?utf-8?B?VnBod0xqMzFrVVZsZFBuaFNWZ1hEczdGSVhnZmFjc09BdFFOWmVtdmZaTG5L?=
 =?utf-8?B?aERFanUrMnkxcHRYODNNZzVCZ1lmTXNYelVYdUpZbzBOMVRFODdncWNxV0E3?=
 =?utf-8?B?RFFXSWF3Qjh6THFTVjdwNDFIQ1dwY1dHbElWVTBCLzJRQitYbEhlZGdJZDVZ?=
 =?utf-8?B?UW1oMEl6cjlaVVdhdUNsREF2RjBQZ1FZWTExek5kb3JwSVQydDl5RFU0Nnpj?=
 =?utf-8?B?cFY0cllGc3FnYkRNb2pHK01FSlN0SHlHSExSN2tJc0lKa0RlUStKcTdrMVRj?=
 =?utf-8?B?MFlDUmFTeFgvQUpZdHNORkQvTzZPQUMrTjhBalU3cXNPSFRxMFNSTTRDeGtS?=
 =?utf-8?B?SXZQOG9TV21pb2JLMGhXRlRkVWNPYmNVYm9MWGVGUXJiNFQ5aTVHRDAyUDNU?=
 =?utf-8?B?VUJkRVZxWm5FQ0thTCtiWlNvV1NlZitrcjNzYmNXR0NKZkR1VENiZWREUG1F?=
 =?utf-8?B?aXRMdGo4eEV4UHRXaWc0WEFBV2VxdWhqeHRKVnMrQWJGaVZGS2VBMmFFbUxL?=
 =?utf-8?B?enNxRVRobWhNd1ZvUGMxcFEyTzBTZkk2UkJRUmE0N0oyLzAxM3JWOTgvOTVo?=
 =?utf-8?B?N29TdkNWWWliSjFMSkI1dDQrWmVNTWVnaVc2Ykc4eHlXdkM1bmFKb2VXdE0v?=
 =?utf-8?B?bUpXMVBPby9XVkMxQk83RFIvdFZSNzRtSnBPU1owK3NMTnRrdmxwMGtqQkE0?=
 =?utf-8?B?VUNxWWJGcFRHRGN6WjcxUVg0WmN4L3FmaVVGYmw5OGZQUlBId0dXaHRJbTRY?=
 =?utf-8?B?MklqTmIyamFRSGNHYVNiaUxrWnRaaU9kOUtlaTVJdzhmM0xmbENLWlE2Z1p1?=
 =?utf-8?B?WUR5d1VGcUxFQXMrbDFqZVQvQm1MbDBhakNvTkZOUFhTbXNWNWRIOFlsSkxP?=
 =?utf-8?B?K1NwekRLdkp0TXZUMldyTEZyVDNiWVNTNnhuT2h0b0p4S0tLKzJtSHJhTFlR?=
 =?utf-8?B?ejZmYmFydEVRTEZlM2FzV1ZYd3FNV3p1Vk9ucG5sUWRSWEkybG5BUjVyZkhL?=
 =?utf-8?B?cXBFQ1VTWkVMa09COEdGU3lHY05QVmJTTkkrK0NSVmlULytYcWd2RzFMNGR2?=
 =?utf-8?B?bHN5WlZ3dnd4a2pKVzg2UmJvS0dJSzcwUkpXTHFndG5uZEFRQWRpalpwUk45?=
 =?utf-8?B?THJ3MCt5OHNvUzMzWDhjNEZlWE9iU3hUcU9kbHR4TnZJVnNFNlZiRVBPTlE3?=
 =?utf-8?B?TEV0V3NlMGZPUEtJMTN3YUF1MkJtRGZPakF6Tm9LZThGdmJlVlRGQk56MUZj?=
 =?utf-8?B?NGdtLytkSnE1MXBSY0Frbm1kaG9aR1pGQmtMQTlzcWg5ZjJyS3pJVHFENkts?=
 =?utf-8?B?enY2ZWdxbmdyU29aRzNxMTBWN3g1YzR4NUhaZWNrbE5wQXdyRXRrUU5EQjlv?=
 =?utf-8?B?MGQxM1F1Vlp4THlSaElQcXBFbURDdm9KNEpaZVhWRklkWWFXMndmWTJpSHdT?=
 =?utf-8?B?Vk1KQS9rblhMSy9tcFRUa294cnhlYVlIeml1bk5xN2dJSzFZNEI5WVBJY1No?=
 =?utf-8?B?OGttRzVYL2FWaGZsRmJFUkM3SFU0RWhJVGFuTjhwQTdBMS9SZzA3SW94eHVV?=
 =?utf-8?B?Z1BCWEsrTXM1bXdwclJMUU9pN2pvT29sVlUyb2p3UFpoNzhLdE9ReUQ5WHg5?=
 =?utf-8?B?MXdlVTlnOWx0a2RkSlB5b1I2LzBiV3dhQ3FibGN1SDFXMjdESFd0S2c1ZnN3?=
 =?utf-8?Q?+mVKI8GMVGiPYFXPkBCedoTuvR++sHve?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVhVeUZNRkk5YWZvcTVNN2dHRVBHTkwvd0gxZkMwbGRxSHk4am1MMjF5NXdH?=
 =?utf-8?B?NVQxL0ZFM1d0RzBFOEMyaURSSDhtUllFQ2R0VmkzdkhOQXk4SU14cHRNMU93?=
 =?utf-8?B?NXJIT3oyYlYydnhEbEEwdWplNHBtK2o0Sll1NFMzK1VESDluaS9KaW1JNHQ0?=
 =?utf-8?B?Z0ptR3NLcmYrb2ZES1NVWGFmVndSVnd0ampoUzVnd0h4SEsrT0ZHdzJsOTBG?=
 =?utf-8?B?OXlHT0c2Ty96eFRSK0FJem9GNENOZ3ViVm9FLzVFM0pENWdxVzEwc2pLRjhi?=
 =?utf-8?B?N2VvdjNEVkNkRnhRbXB6Vjg0VGgyM05ZQm9MZi8wSkVSbnZPRDYycGJEbUR4?=
 =?utf-8?B?UjA3TmNuRHFKMG1XQWZYYmtSSFRxQ2UyT2grV25sMXJqbnFtVS9PN3NBZ21a?=
 =?utf-8?B?Qlk5TFBWSVErYkJBeTFkN3dwRVBqOWxPM0wrOFJMSStETmNFVVNYSERqMytD?=
 =?utf-8?B?UWhRY1Z1cEU0NWFaOE1OVEVhSDNJUk5lSGNiWnNxbE9Uck94U2xGMWNJRnBV?=
 =?utf-8?B?UXB3WWp4MDRHN0Q0N3laRGVZNTdReGJCSWZrUmVGK0V2MFVUcHBPUi9uV09j?=
 =?utf-8?B?Nkt4RlMrRmRqSnlENW1RWUFkUWRYbE1ldDY5UEttSEIyRFo4WUNGNWJtQW1u?=
 =?utf-8?B?dncreDYxTVJOakFPUnJWOC9rblduSDA1RlpybDB1dGwwWVc3eUlCM3d1d05E?=
 =?utf-8?B?QlZSSFZHdFdzWDNRNi9Nd3lBWlh5RzlPaWl0Mno1RStKZ1JNQTdEdzVCcW0r?=
 =?utf-8?B?MVlzREZoRUZ0VmEvSmtNSGdFL0h1d1NmU004UW12YjhTc0NmekhidXRPc1lN?=
 =?utf-8?B?WkdSOVgwWHRPL1o1QmZ3MG9YNDNORXlYM1RzWDF1UHJWNFYrbVRMQ0diTzZr?=
 =?utf-8?B?ektuZDN4QllkRG1JYkoxNnN0cklTMHhVcGRjYzNMbER3bGhmYVQ4MnpIdnlH?=
 =?utf-8?B?TzN1SmUvY0Z1bEVWaFRHUmVYd3A4OFN0aTFpZjBQNFZGcG43ZHEvVGlmVm52?=
 =?utf-8?B?akdHbkpjVUxBUWpPQnZtUEY5Vkk5M0NsdnNUTmI4TGZhZEVMZSt3cnU3REhp?=
 =?utf-8?B?TXhHaDFQaGdpU2xQWmJVTEZxeGZOenhodEdQQzRIV0I0Yk1ITnkwU1F4V2Zs?=
 =?utf-8?B?TW5Od1ZsSzBJMGF3dUc0a0xRb2hBODFMTEFYUytCaUh0Nnp3alRmYjJEUThj?=
 =?utf-8?B?Zjc2eTNscjNNdzM1dE9oUXRpNkpIanV1VmhUZkhKZ3ErcjJVa3Z5MzNMclg5?=
 =?utf-8?B?RVMyTHl2WHFYNVJCQk1HK3lHcWQ0eWNUMXFpT0Y0RmtqRGVlcjZhMFIyTW9E?=
 =?utf-8?B?UXRrYjlWMkQyRFdtdWY4ZXpmRXB2ZTVRVTJTMTlGNVlTbDFMUGdPZm5kVllj?=
 =?utf-8?B?YnJpYTF5SDVlMG1wWXorSXV2alExR0dzNjRHeUR0L21DcHIrRmFuY0tjTE5M?=
 =?utf-8?B?ZjZpNW5VTjl1bDE4Tmp3TVlpVVJyVkdlV1lNTGYxYjVZYkxnZmxkRmcwSlBj?=
 =?utf-8?B?R0dMU21KR0JTa05PL0NydDlrQWRFazZ6UEpIdFdzYndWQmdVQ3NTTGd0QUVG?=
 =?utf-8?B?MEhJRFVEZlQyL0pyL1R2UGJuckpyOGw2MXRENEd6RFp3QStOSEMyVzBETWZ4?=
 =?utf-8?B?M2RTQ2tOMXNtUWpwYTBiNEdxN1o2TGovazB4eHkzVVNIbVJYbG5lL1JBVWVl?=
 =?utf-8?B?Sk9aSGNpZGp1WEZuaWpGQUp3RzdGclczWDdvSEdxRmJ1NDZwNEVuZXVJV3NS?=
 =?utf-8?B?eWhwdXBESkRSOFM0bDlUaVVTc2VZT091SnNwd1BqNnpJaUdURWJhbVE2QnZo?=
 =?utf-8?B?MmFQOGZsYUNZNjJuRUwvTGo5R3JTQk1MWS95TXVrZFM3dHo1Z0VIKytQNkc3?=
 =?utf-8?B?alFxS04veWRDOVBLMG9CNVpjdmxtZ1JjZnRkRm13TkZpS1VoTUp5dm5MRHQ1?=
 =?utf-8?B?UEZzb0pkUlhxTG55ZEpkc0RjcEtqWit5NjlMUjlFVmJZeHZVcHVKSlcrV3hp?=
 =?utf-8?B?R2szRzBjT0tubGZ1aUlUMEs1VVpBQUM0TEk5SmZVRDFOa2NHTFhJU1ZING9Z?=
 =?utf-8?B?M2NKdGYvVHBKQkZjQnk1U0d5TlFJdDZWOGJad292KzRhTFZIbkg1dkduVmNM?=
 =?utf-8?Q?6Eeg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fbc9c0-e598-49d6-141e-08dd6c4c2dd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 09:54:19.8207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0t5m5RXVUtZ9R1z/r8Df1m74OZcLjf/Kc8WHPEgMQ2Qoa75j0LgHtbDwhuXnr5QMErKW+33CVIkCpyRi8lwPbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDI0
LCAyMDI1IDExOjQ4IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IE5pY29sYSBW
ZXRyaW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAwNy8xNV0geGVuL2NwdWZyZXE6IGZpeCBjb3JlIGZyZXF1ZW5jeSBjYWxjdWxhdGlvbiBm
b3IgQU1EDQo+IEZhbWlseSAxQWggQ1BVcw0KPg0KPiBPbiAwNi4wMy4yMDI1IDA5OjM5LCBQZW5u
eSBaaGVuZyB3cm90ZToNCj4gPiBUaGlzIGNvbW1pdCBmaXhlcyBjb3JlIGZyZXF1ZW5jeSBjYWxj
dWxhdGlvbiBmb3IgQU1EIEZhbWlseSAxQWggQ1BVcywNCj4gPiBkdWUgdG8gYSBjaGFuZ2UgaW4g
dGhlIFBTdGF0ZURlZiBNU1IgbGF5b3V0IGluIEFNRCBGYW1pbHkgMUFoKy4NCj4gPiBJbiBBTUQg
RmFtaWx5IDFBaCssIENvcmUgY3VycmVudCBvcGVyYXRpbmcgZnJlcXVlbmN5IGluIE1IeiBpcw0K
PiA+IGNhbGN1bGF0ZWQgYXMNCj4gPiBmb2xsb3dzOg0KPg0KPiBXaHkgMUFoKz8gSW4gdGhlIGNv
ZGUgeW91IGNvcnJlY3RseSBsaW1pdCB0byBqdXN0IDFBaC4NCj4NCj4gPiAtLS0gYS94ZW4vYXJj
aC94ODYvY3B1L2FtZC5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYw0KPiA+IEBA
IC01NzIsMTIgKzU3MiwyNCBAQCBzdGF0aWMgdm9pZCBhbWRfZ2V0X3RvcG9sb2d5KHN0cnVjdCBj
cHVpbmZvX3g4NiAqYykNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDoNCj4gPiBjLT5jcHVfY29yZV9pZCk7ICB9DQo+ID4NCj4g
PiArc3RhdGljIHVpbnQ2NF90IGFtZF9wYXJzZV9mcmVxKGNvbnN0IHN0cnVjdCBjcHVpbmZvX3g4
NiAqYywgdWludDY0X3QNCj4gPiArdmFsdWUpIHsNCj4gPiArICAgQVNTRVJUKGMtPng4NiA8PSAw
eDFBKTsNCj4gPiArDQo+ID4gKyAgIGlmIChjLT54ODYgPCAweDE3KQ0KPiA+ICsgICAgICAgICAg
IHJldHVybiAoKCh2YWx1ZSAmIDB4M2YpICsgMHgxMCkgKiAxMDApID4+ICgodmFsdWUgPj4gNikg
JiA3KTsNCj4gPiArICAgZWxzZSBpZiAoYy0+eDg2IDw9IDB4MTkpDQo+ID4gKyAgICAgICAgICAg
cmV0dXJuICgodmFsdWUgJiAweGZmKSAqIDI1ICogOCkgLyAoKHZhbHVlID4+IDgpICYgMHgzZik7
DQo+ID4gKyAgIGVsc2UNCj4gPiArICAgICAgICAgICByZXR1cm4gKHZhbHVlICYgMHhmZmYpICog
NTsNCj4gPiArfQ0KPg0KPiBDb3VsZCBJIHRhbGsgeW91IGludG8gb21pdHRpbmcgdGhlIHVubmVj
ZXNzYXJ5ICJlbHNlIiBpbiBjYXNlcyBsaWtlIHRoaXMgb25lPw0KPiAoVGhpcyBtYXkgYWxzbyBt
YWtlIHNlbnNlIHRvIGV4cHJlc3MgYXMgc3dpdGNoKCkuKQ0KPg0KDQpTb3JyeSwgYmFkIGhhYml0
Li4uIHdpbGwgY2hhbmdlIGl0IHRvIHN3aXRjaA0KDQo+ID4gQEAgLTY1OCwxOSArNjcwLDIwIEBA
IHZvaWQgYW1kX2xvZ19mcmVxKGNvbnN0IHN0cnVjdCBjcHVpbmZvX3g4NiAqYykNCj4gPiAgICAg
aWYgKCEobG8gPj4gNjMpKQ0KPiA+ICAgICAgICAgICAgIHJldHVybjsNCj4gPg0KPiA+IC0jZGVm
aW5lIEZSRVEodikgKGMtPng4NiA8IDB4MTcgPyAoKCgodikgJiAweDNmKSArIDB4MTApICogMTAw
KSA+PiAoKCh2KSA+PiA2KSAmDQo+IDcpIFwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA6ICgoKHYpICYgMHhmZikgKiAyNSAqIDgpIC8gKCgodikgPj4gOCkgJiAweDNmKSkN
Cj4gPiAgICAgaWYgKGlkeCAmJiBpZHggPCBoICYmDQo+ID4gICAgICAgICAhcmRtc3Jfc2FmZSgw
eEMwMDEwMDY0ICsgaWR4LCB2YWwpICYmICh2YWwgPj4gNjMpICYmDQo+ID4gICAgICAgICAhcmRt
c3Jfc2FmZSgweEMwMDEwMDY0LCBoaSkgJiYgKGhpID4+IDYzKSkNCj4gPiAgICAgICAgICAgICBw
cmludGsoIkNQVSV1OiAlbHUgKCVsdSAuLi4gJWx1KSBNSHpcbiIsDQo+ID4gLSAgICAgICAgICAg
ICAgICAgIHNtcF9wcm9jZXNzb3JfaWQoKSwgRlJFUSh2YWwpLCBGUkVRKGxvKSwgRlJFUShoaSkp
Ow0KPiA+ICsgICAgICAgICAgICAgICAgICBzbXBfcHJvY2Vzc29yX2lkKCksDQo+ID4gKyAgICAg
ICAgICAgICAgICAgIGFtZF9wYXJzZV9mcmVxKGMsIHZhbCksDQo+ID4gKyAgICAgICAgICAgICAg
ICAgIGFtZF9wYXJzZV9mcmVxKGMsIGxvKSwgYW1kX3BhcnNlX2ZyZXEoYywgaGkpKTsNCj4NCj4g
SSBmZWFyIE1pc3JhIHdvbid0IGxpa2UgbXVsdGlwbGUgZnVuY3Rpb24gY2FsbHMgdG8gZXZhbHVh
dGUgdGhlIHBhcmFtZXRlcnMgdG8gcGFzcyB0bw0KPiBhbm90aGVyIGZ1bmN0aW9uLiBJaXJjIHNt
cF9wcm9jZXNzX2lkKCkgaGFzIHNwZWNpYWwgZXhjZXB0aW9uLCBzbyB0aGF0J3Mgb2theSBoZXJl
Lg0KPiBUaGlzIG1heSBiZSBwb3NzaWJsZSB0byBhbGxldmlhdGUgYnkgbWFya2luZyB0aGUgbmV3
IGhlbHBlciBwdXJlIG9yIGV2ZW4gY29uc3QNCj4gKHNlZSBnY2MgZG9jIGFzIHRvIGNhdmVhdHMg
d2l0aCBwYXNzaW5nIHBvaW50ZXJzIHRvIGNvbnN0IGZ1bmN0aW9ucykuIENjLWluZyBOaWNvbGEN
Cj4gZm9yIHBvc3NpYmxlIGNsYXJpZmljYXRpb24gb3IgY29ycmVjdGlvbi4NCj4NCg0KTWF5YmUg
d2Ugc2hhbGwgZGVjbGFyZSB0aGUgZnVuY3Rpb24gX19wdXJlLiBIYXZpbmcgY2hlY2tlZCB0aGUg
Z2NjIGRvYywNCmBgDQphIGZ1bmN0aW9uIHRoYXQgaGFzIHBvaW50ZXIgYXJndW1lbnRzIG11c3Qg
bm90IGJlIGRlY2xhcmVkIGNvbnN0DQpgYA0KT3RoZXJ3aXNlIHdlIHN0b3JlIHRoZSAiYy0+eDg2
IiB2YWx1ZSB0byBhdm9pZCB1c2luZyB0aGUgcG9pbnRlcg0KDQo+IEphbg0K

