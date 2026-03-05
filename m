Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHAfA+tKqWn+3wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 10:20:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A9B20E3E8
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 10:20:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246327.1545530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy4s0-0006H7-SF; Thu, 05 Mar 2026 09:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246327.1545530; Thu, 05 Mar 2026 09:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy4s0-0006FR-PU; Thu, 05 Mar 2026 09:19:48 +0000
Received: by outflank-mailman (input) for mailman id 1246327;
 Thu, 05 Mar 2026 09:19:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NtvN=BF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vy4rz-0006FL-At
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 09:19:47 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 723c745d-1874-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 10:19:44 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB4951.namprd03.prod.outlook.com (2603:10b6:a03:1ef::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 09:19:41 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 09:19:41 +0000
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
X-Inumbo-ID: 723c745d-1874-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDRXGtPnAvTe0dmgmvvL+M34WbJzW9eAZaLRs0ZkfvX55W5b1N3gHxE6B/x6ZDdb2SOFoeqqsjyu/AuUvKYG3xlq2Kkdw0Jho/nfEcfOUPw8t2s3HxexCdewDfx79UHG73Cb89xXTM3Yo7IUeYBU8qQZ1fh5vrnYsl3QtvjwB8Ew3LNLGZS8hc1O2AznhDchlER6t69y0bkgYxURL8X0gQg1npJpdQXFB3El4eSrUM9omXQRNq8hbjN5148X4+tk2kOpxCYPlb8I83B89X/ULiMUlevrlPPVBfaAZOanWzCjkoTGIBKo1b9EktHvImupKlwBsAvQLvP3BBYidFWdFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hf9J4F468TSJFlAphny8iLQP1YTtiuyQKklzuuP/sIs=;
 b=LliZ/Ay6qcqi9jbn3dBR1hJ/i7X62VIFFEEIoKNeRS0t5i0lYfvhKQzOpJDI0FWSKaFuRDhsIgM0/tW9+l4mgHvoKzFdmV8lzFedtZycY7+UHXFOUbRG4xS+cEeMjee9KipMdcsVygzXwdcUICtS1a4FNFomcioxzBDOu2iQ1kv28RvRSBKYZAi+j6Vo9SjMkB9QnFpokGFpNG37raVWsMLnCCgwqD20es2L1rQM4EwnstpaFU//MV092KbrvhEFa42GeFcoJC0XxvqNm3W4FG5vNJtpyws3le0CH0Kla9Dv1YHXaQCIiv13veRyLHS0xBBhnZiXWBOAibooydrgNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hf9J4F468TSJFlAphny8iLQP1YTtiuyQKklzuuP/sIs=;
 b=azhk2Ll3CFnf7eDyUHeNSeMXdLRSd8J1UKNJgg3qQzzF04dpb07kNJOkq20sxQK6NgGZfr7FYrPwtWgkiaNXnr8k7QhgVaMpJNfKxQJq1/O24WLJmphqXelcDrrxpqvqJ8W0u3jcNQ1sNFVxomJA7t/3dh4Osr4PiVG8zDk2R9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Mar 2026 10:19:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v5 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
Message-ID: <aalKqq0ioTcU9Mdh@macbook.local>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
 <9f1fcbfc-e7b6-4ef3-8f58-c88f9667d606@suse.com>
 <aahKkV2csf28Y0YC@macbook.local>
 <7d7b75b7-80c4-4c23-8678-b33f4c90132c@suse.com>
 <aahjn-NXjmC2A-_v@macbook.local>
 <5a16e95b-25a5-477d-8445-4843d2fba576@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a16e95b-25a5-477d-8445-4843d2fba576@suse.com>
X-ClientProxiedBy: BLAPR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:208:32a::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d159ba5-78c4-4d40-c3c7-08de7a9854d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	7j2iVmoR2l9BQeeVhG3/OYhHfyBz8KSIOuCRNk4LnX0lOBqXJKX3F12T+wsYkbuNcyMthdPGPQT6KMc6Dil5tdA6ct4J1oWTy/5AOAVsG1Oq2x8zNBbSYTUqAFxb6px0Y7w7BuLiuKT31PrX4vtF2jUYJL0dRxdw1D+LRyWR/UuU2xG993Ekq3vuH/eyQr/46RC/YpYHyaOUyMzDJZKlNH1rKD51nm7eJ4mL4aZ0hveCzoDP9uhY39SBRNDpz/mzAhn9fBlLp5xkDSk7oK3m967POXv/u+7zVzRU6Ez5bP1ZFPU1a9QNpK8/vDPuEAEUR8fsnVuk6RnAqxzbQz1jVdWEQp7hzX8sg4vG457I7ikcotOp6LM1Ul+toyFKZm9TMealW5K+TvFgusJK04pHBmM+mpBmgXnOZyG1cKLpteoiym3/h0p7l91FOqvpxCRp72Oz9k8kKtxlHJPsCET5t8wLVHaW7cLOwy9EuBFXWGSynBQQteuMKug/FTKvxCwaxaoqVuaK54BBhB5qPCH76TWNx5Et08dNOvSp3NuIAQ9IAUtki6eqrLQmeXmVeOzFg0SMwpHjIt6q2bSYyLEmDrsrzuTAa6em+WbTh5ZBNhZIRonGpoafV1PbDDrOZ6PABYzUxPrM8evR76YrIlq9rUtzir7wU2TcHoSaD4ciBQKOxq+kmVwFp12Kwvx3kTDZBq8Fbmq+0VWpBKcZTXvQffRvE7vDD5mlSlvOa08QDE8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Lyt2ZWNzWVk0YzlsR2VMK2VIajZQVnFGQm1MZk14NlFCbTdROXptVTI3L01M?=
 =?utf-8?B?VXFDWFJNSDg3MW1wMXdCTFkrRXZaeTYxc3lTcnlxd0crdS9jUjNqK1dUNzln?=
 =?utf-8?B?TWlnTFRoZmFnbHBGTkJyeDAvTTUyVUQ0WmlDaE5XcVQ5bWpBZVRDUnFQdVJ3?=
 =?utf-8?B?MVFrNzRhUEtOcFhVVjNwZHlZbDB1MG5aS3JGeTBHWElEdUVSQ09aVmJqUWV5?=
 =?utf-8?B?UzJzTFoxcHJGenVldWtmd2hpbjdJVWhHUXBwaXVsQVozS05LUkZkeGJYT1ox?=
 =?utf-8?B?NDRNNUVTdGxrVW1Fakx2SFp5Z3BhLzJtTmZkb0RVcmhwNGVTN25sU2ZvLy9y?=
 =?utf-8?B?MjlSRjJEaHBqd2s1ZlRrcXJpakl1ZjJSallTOUpiTXBWUFh4YWwzS3pHTGQ0?=
 =?utf-8?B?azBRQ2ZGeWR4Y1R6QWFUdzliWm5Oa083YzR4TFNLaWlOVExXdzg5TzZocUhs?=
 =?utf-8?B?NjY4c3dYREIxRnVxRVl6cUQ2cUNvMTdKRlAwTFNWNmVQUEV4Y1lLdHFuSEwz?=
 =?utf-8?B?TURaRFdXTjJ6Wi9kVDFLMGpFMXFwaEVLR0gyVjIyREVub080enFQMlJkQUl4?=
 =?utf-8?B?ZzBrWjR6Q1VoWkZINUhxdzZkMitZbUVqMGViOStoblU2N3ZGMytBd0lnNnM3?=
 =?utf-8?B?bGlSamFMN2t6b3c3bjZKQ3BFTEhTcm9UM2NaMmowdzB3N0dvMG9NOHNjMFBn?=
 =?utf-8?B?R0U2SkQ3NE8zUG9lZHg3bmZGQUJrUE4yZ29YR2V1aFZJZDNSdnVjQkxidjJu?=
 =?utf-8?B?Vi9jaitQRXFnV0NSdmNtaEpRem1qbldrVEhseVZqTkJWV2pCL1VtNUhXZVF6?=
 =?utf-8?B?QTFRdHdsTHFpOWtIeUdkM2w3aFhkZTBueEgweStFazc3Mnl1OTJxY3pkYVJ1?=
 =?utf-8?B?MnhxYWZOTmdPQnNkWmt3cmdjcUtLL1N2SS9jT3RzT3RvZEpiTVQ5aDZNYUQx?=
 =?utf-8?B?dFpMVmdvVERRVndVaHZwdTFpcExybU5qNFF2VGZCbUhKSTFlaGpEbEp5L1J6?=
 =?utf-8?B?aU1WMWNXKzhoaTNVZ25aMmszQzhQOGNEa1VYRG9mUmhsRFNiSzRaUGYrV1hT?=
 =?utf-8?B?Q2lmNjVLR0RaQlBxYzFGdFh4Mk5vaTBMaG9LSHFiM3gvWnY1SWRaanRDaG5Q?=
 =?utf-8?B?d1dDZm9DR05wY2FJSGFybXRjdjFYeDZWTkhTWkh2SDBkb0NKZHdNN253MlRP?=
 =?utf-8?B?V2c1OENhQTV4ZW4vbThoQllXMGVvdVpDZS83cEswdlNUZE1EZW90YVlaUTEr?=
 =?utf-8?B?RVhsWnl5TG9OOFk0QUh5Nkp0Mkl0VEZRMFVjelhmRE53VGU4UmN1L2l6encw?=
 =?utf-8?B?YUZueFp3VFhWRmp3M1VyU3pTVzhja295d3F5cEhZZk5TWVdia0JzcVV4enlJ?=
 =?utf-8?B?NUx0aFV0MGNzTS80UnlKSlhXMW90N0ZQZXY3YW1McXcrdmxoaW9PbzloaU1Z?=
 =?utf-8?B?OTFLTFVtKzNETFAxek9UWmhYTnl6SS9JcVR6NGhVZEJ0OElNTzBwdkE2dUUw?=
 =?utf-8?B?VnNQTE1ZTEwwYjdGcDdRREhqRlVpaEtyK256MlE1RnMrNGphTENLMTFmOExL?=
 =?utf-8?B?RVZMcm9IT2FzUElxUG9BZkxMa21lcXQycUFyMXBhR0QxRWZER05SOWhVb2RP?=
 =?utf-8?B?TFBGTHZiUi9Sa1FraVVmMlh4aG1kOVNqTU1weGNacW5SSWpsVUhmTHpscm1r?=
 =?utf-8?B?OUxWVkx5cDExN3V4cHZvZjBlbzdwS3B1SWRuV1NCektCdFFXNUkzS2x5Q29E?=
 =?utf-8?B?TkNCVXllZjdrWE9FblpzMkx6RC9SK3JTS1J3ajdLSzgyMGp1ZUN3SWJkc3RK?=
 =?utf-8?B?YWhUcmMzNmFKMFg5SFV0UXBNdUw1bGFlajdzcjZ3Y1hLMm9FUGp3Y3hFazNR?=
 =?utf-8?B?VTZNaFJHRExNVkFqK25uWktJMzZSbmpnMzgyZlpOZVZSeExvN0loVUpUb1N1?=
 =?utf-8?B?YVJpTUczWnRBUDZTbDhsWUowT0E4SHkwVUJqbW9DSmRsV1lycko2QWkxWk8y?=
 =?utf-8?B?NzNvclFTdk9wOEk4eHJaZlR0S0dvU0tBY3JWYk1LdndtbkdTS1pZSzd5cDRz?=
 =?utf-8?B?a094Q1dyc2dUVmdFUzUzNXJlUUs0TC8vVjJxVzZackpOeC9FRXNVUmtQVm9F?=
 =?utf-8?B?cUI5eU45NzJWWnJIK1VGSityOW5qYWo3blUvOG9PVFAyUDVUUXFGV0xDU1Bp?=
 =?utf-8?B?Y0MxMkl1bEc4cmxlRGNwY3R2czZuczNWcGtPOWRkMG1aVm5YZ3E0ZzBTSVc3?=
 =?utf-8?B?eUYwZjE2UGNicWFvRnU1M2ZJZnZ3TVBHR2xUdWFvOFpWbm5hTjJtYzBYeGps?=
 =?utf-8?B?cmVNNDNNSHBvOWVqZXN5TnZnR0JmdFpmQXlzVWVxOVR5QkFhME55UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d159ba5-78c4-4d40-c3c7-08de7a9854d0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 09:19:41.1963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiRViKe+eMvfaaQo3mYuXHAafQXpxgTwyMZgHzkrLf4Gcy9L4X8W6Y9IRBHW+jvaWS21ehWKZ+nyw+8nrtK5rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4951
X-Rspamd-Queue-Id: 93A9B20E3E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 09:40:32AM +0100, Jan Beulich wrote:
> On 04.03.2026 17:53, Roger Pau Monné wrote:
> > On Wed, Mar 04, 2026 at 04:39:00PM +0100, Jan Beulich wrote:
> >> On 04.03.2026 16:06, Roger Pau Monné wrote:
> >>> On Wed, Feb 25, 2026 at 12:44:44PM +0100, Jan Beulich wrote:
> >>>> @@ -349,22 +352,23 @@ int vpci_init_capabilities(struct pci_de
> >>>>      return 0;
> >>>>  }
> >>>>  
> >>>> -void vpci_cleanup_capabilities(struct pci_dev *pdev)
> >>>> +void vpci_cleanup_capabilities(struct pci_dev *pdev, bool ext_only)
> >>>>  {
> >>>
> >>> You could short-circuit the function here, ie:
> >>>
> >>> if ( ext_only && !is_hardware_domain(pdev->domain) )
> >>>     return;
> >>>
> >>> But I'm not sure that would simplify the code of the function much?
> >>> Likewise for vpci_init_capabilities().
> >>
> >> Such a short-circuit would need replacing / dropping once DomU support is
> >> added. I was hoping the chosen arrangement would make for a little less
> >> churn at that time. I'll listen to your advice, though, just that the
> >> question gives the impression you're not quite sure either.
> > 
> > Yeah, I wasn't fully sure.  IT would be nice if we could add those
> > short circuits now, and then once domU support is in place we just
> > remove teh shortcuts and it works for domU also.  But I fear more
> > changes will be needed anyway, at which point the short-circuit is
> > not that attractive to use.
> 
> As per your other request (calling ->cleanup() even for DomU-s) the use of
> is_hardware_domain() would go away anyway, and the function would be ready
> for use for DomU-s as well.

OK, so that one is (possibly) sorted then.

> >>>> +
> >>>> +    vpci_cleanup_capabilities(pdev, true);
> >>>> +
> >>>> +    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
> >>>> +                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
> >>>> +        ASSERT_UNREACHABLE();
> >>>
> >>> Ideally this would better be done the other way around.  We first
> >>> remove the handlers, and the cleanup the capabilities.  Just to ensure
> >>> no stray handler could end up having cached references to data that's
> >>> been freed by vpci_cleanup_capabilities().
> >>
> >> And maybe not just that: For the hwdom case cleanup_rebar() adds new handlers,
> >> which we'd wrongly purge again right away. (Because we pass "false" for "hide",
> >> this isn't an active issue right now.)
> >>
> >>> And we should take the write_lock(&pdev->domain->pci_lock).
> >>
> >> Now this is a request that I'm struggling with some. I can see that callers
> >> of vpci_{init,cleanup}_capabilities() assert that the lock is being held, yet
> >> it's not quite clear to me why that's needed. Shouldn't vPCI internals all
> >> synchronize on the vPCI lock of the domain?
> > 
> > Right, the callers of the handlers already hold the locks, and the
> > removal of the handlers should also hold the locks.  The point of
> > taking the d->pci_lock is to avoid the device from being removed
> > while there are vPCI accesses against it being done.  The vPCI lock is
> > fine for vPCI internals, but functions that deal with addition or
> > removal of devices need the d->pci_lock to avoid races with possibly
> > freeing pdev->vpci while in use.
> > 
> > I think you are right, and for the usage here (that doesn't add or
> > remove pdev->vpci itself), the internal vPCI lock should be enough.
> 
> Well, we could take two positions: Either we say that as we're being called
> from a context where the PCI device is being operated on anyway, we can
> assume it can't go away. Then no further locking would be needed here. Or
> we want to explicitly guard against that, in which case (seeing that
> nothing is added / removed), d->pci_lock may want read-locking?

In this context the caller is already holding the pcidevs lock, so
there's no risk of the device being de-assigned.

My reasoning for taking the d->pci_lock in write mode was to prevent
any concurrent access to vPCI while the changes to the emulated config
space is taken place, but you are right that the vPCI lock if used
properly should prevent races.

Thanks, Roger.

