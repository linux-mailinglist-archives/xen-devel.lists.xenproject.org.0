Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCAaBN1jqGlauQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 17:54:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBD1204ADA
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 17:54:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245802.1545177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxpU0-0007Jc-Ls; Wed, 04 Mar 2026 16:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245802.1545177; Wed, 04 Mar 2026 16:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxpU0-0007Hm-Ik; Wed, 04 Mar 2026 16:54:00 +0000
Received: by outflank-mailman (input) for mailman id 1245802;
 Wed, 04 Mar 2026 16:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY7Q=BE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vxpTy-0007H9-Fx
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 16:53:58 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbb0e46c-17ea-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 17:53:57 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA3PR03MB8476.namprd03.prod.outlook.com (2603:10b6:208:546::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 16:53:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 16:53:53 +0000
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
X-Inumbo-ID: bbb0e46c-17ea-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdVBYAyJdRj31I0gjIBPhXd5LrJ8rVyrm3Ysj+KEE4bUCeRMMQsxlj2Ekp2rPEIKa0dP5OhsbHXyY4ctj3eKOHUrTj7SWUkkyJ9W0C2at0MpBy6OEzpZEhloZtEpwETHJ7fpQsjN1pbeyAmBpd7RWBjQ3IvXXmZwHIHYFQWodBSnjot7PSjyj12Cc4g+MpGqHciBTBijKz//UreDyn1nh3G/nQidve2SFdtDbXtkliRRie31EuCpTYCI+RY56xpj4byCb1pkW+klDBmoxUEW0XAGeypVMmvdqmD4i4LIyY5SLbNIhrI+y95n1YAnUoW9WYCX/UTQmYssAHP/DHH17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MN/AJP09JF9qcdDot8V4nIdKNZMqeXmKBDo6YqcnPAg=;
 b=KSFQCF2QbrC7efb/DH1kFj+9UjooyGwD7SGXQEAdRJfFYpCbxzSf8rkbCmXtVJkYSYi/yyVEnK37m+pgLsUjwMpHrY6X/1o7hZAlygQxxaxsaRwwLZhwGxzQdZZrFQf0J9W5FG0GqB1XA7nxsDzfNAXVvKQDJj1ed5+ErgVKd9ceaTTrZImcAUBBeQrwZ9J7E+5SYyyZQqkjf0tj/CR2FGuCU5mZrnj4wIYDexpsC/H0mhxIeyU109cLUf0S3a3wmopILvAiGjKp8qDAdo8eOxn2xTPi8BpsfKlCq5Rt+G7mSXgVTynzHLStlkdK97IzFm5thHMt3w3eh/8Ls1yhfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MN/AJP09JF9qcdDot8V4nIdKNZMqeXmKBDo6YqcnPAg=;
 b=WPc2Zb+9a7cKlyqp4Jhb/Uikym3OsE4/M2rihJr6NQqFDN5UbAbBYPK13qSbcLQ3PVgTjcmmy9UG6pJ7xX4qZ2FqFDGBTowp7UufkAb+FkZi2OlRc8c7pbkDizXbEVMfveEk3/usf1Cp17Y2WBys07nihVlNqYOE+B3NqhGxim4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Mar 2026 17:53:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v5 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
Message-ID: <aahjn-NXjmC2A-_v@macbook.local>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
 <9f1fcbfc-e7b6-4ef3-8f58-c88f9667d606@suse.com>
 <aahKkV2csf28Y0YC@macbook.local>
 <7d7b75b7-80c4-4c23-8678-b33f4c90132c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d7b75b7-80c4-4c23-8678-b33f4c90132c@suse.com>
X-ClientProxiedBy: MA3P292CA0035.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA3PR03MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: b09f8084-0e64-4739-83eb-08de7a0e9e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	wgRpl+wdmujDYp24ilGJbqJrD4NhOzrlY3k75rIhJgB+4ipBsjBt8fFiHud+nXlwlEFt0X1+pKdRIq7QPU7i8LMz+10UzUhvWE/8sAQBF+b/FfPYjwoZtkgsOHs34KWl9OdeqsyWeLwPW2PSq3SoDUXWaoBfJfCSt6Zj0/fO25FEq/QSfmm7mJhnEcIcoNoM1DCLRWEeQ4mkBveLDosKtmGrbOBQ/kpNOea4W5RXIrd67MqTXuIxZiF49mVB6jtoKRstZOnL3d2VXWPoXXvtiNEBUyNi6Ibwt5HQeHa0EkoaEWE6BlJOA98+dtGNkshu4687oJOWj3heKOh6rKvlUgE/CBlJzr+liP6w3mhIlknqyAMqD/ELbsMNyO9tWGrtIWEbbEBszWG8hVCzul4TGWgRxLAlx3w8NCR9/LVkLzz5A0frI+OquE5vVbexAAg6PyOxqu9RvOVVTS5eI/ixZqhiRHwNPpqFla5pi3CNQrpfCka0gTBZ8vl8biJPHTP5lusybmPbDqZn9Cwcpj0eYE5QHHvEC4Wj5rff3Rs20uGWXSYQBprqLhTgOkMgx29Eey+bMvgxRYsb6oEpn40RT1hWeYhXACkz9KWp95ltdDrCzUpSc1ixyogkCun4ZJ9gJ1vWAXcJXug4FD93sRUEkezhO6aZYQFf+sKAyDyLjrIx9pimxHbX8DChseKw7shL7EfWqg9XburcGLEjW/a4+l7kE85dEVES6lON2Lw7MYY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVZDUCtzd3VOS3duaW01MXdaaTBHVEpnQXpvSFpkY0hyU2lEUCsza01SSkZ3?=
 =?utf-8?B?eDF1bmJuR2FkQXlCbTFBRTJhRncwQ3RHNlpCdGtIUHFkSkUzektTK2plV3po?=
 =?utf-8?B?cW9DM1cxQ1B4VzA4SEwvQm03eHBBUkFuK1I1VnlzTnFUcFFqRlJmYTczcUFn?=
 =?utf-8?B?TDJvYk0wbUZSQnM5MVJzZUpNQjhzdDZzMmQ5dEd0YjRHcjBLLzZBV2FTNTFn?=
 =?utf-8?B?czdPYkpCRThiTlhSYXRjZk1ReTVhbEZwOExvUm90UGpPMnljNG5oM3pVWmZJ?=
 =?utf-8?B?UXlmYWd3ZzJENGJ1RXQ2ZUlJWXVIT2trWkVZbERPV1ZaNWVhYWM1STdrTDBK?=
 =?utf-8?B?YlYyWnFaTHFaaVl4V2tGUEtxanArdXZNRWwvR0EyK3QzM0tWbHk1YVNYWmlF?=
 =?utf-8?B?SElJQkVqTHZrREJwOVR5QkdGZUZHVEQyS3pwbHpzenBqVXJHWVRRTHdaSk5J?=
 =?utf-8?B?WjRIOXZ6RnY2bFd5dkhzSW9lTjN0K0xuYmxWMVZScDNDWWljZWRtOW4rZ0x3?=
 =?utf-8?B?RlVUczh6Ym4za0Y0Uk4rU0VNSmcvNlYwZHE3MDRUUWNjbzhpMG56akh5YWZV?=
 =?utf-8?B?MnpKd25wWjhZQjdScEN4ckQ1bTZsWFRLLzh3Q0ZTVFVkd1dEdjUvRWE0VlNR?=
 =?utf-8?B?N214RE14bXN6a1Z3Z3VpWVVPeS9ZQWV1SFl3ZkEvMjM2WjdyL3FtbWRwTVE0?=
 =?utf-8?B?ZlVxaDdsR2FZclRjQkNiOThQdm55TW5GaFdUMkswL2hESUJZcG1IeVBrOGkv?=
 =?utf-8?B?K09Sd21tZDZON1FHVFBXejNRYjFZM2lLUjAvbUl1MHhCbW5FWWV1Tk1NVTdy?=
 =?utf-8?B?MjFDRVpoYW9wRXJwK1MrS3NYN1hVeG8yQ2NnMStPS1ZzSlJlalN2TXhFcWxv?=
 =?utf-8?B?ZUEyYllKanIvK20zMjNNL1Y5RnNHYnlUWkFNQlpFZ2x5M1l6RXhSOTZ6dlZO?=
 =?utf-8?B?MlBFc0ZLUE9WR2hQZzlib3h0bnVVbkhZOVZUN3l3eXppbUFOby9SMlRxRWFt?=
 =?utf-8?B?Y0xKNlA0RUlHaEZweVVaVnhwc2FXSzZNbXZkdUdWcGdlbzhZQUxaSDY2NE1t?=
 =?utf-8?B?a1crc2hjNVVkaXBKeFBWb3hKQzgzM0QwbmtJR3E0SUk5SVdrQ0FQSEFpRGZm?=
 =?utf-8?B?Z2tKVG5HTUg1VWcveDVrSGlVWWxPb0FuRnBLc29wV1VjWDNzTnBTZGNXSGY5?=
 =?utf-8?B?S1dTWHZXdlNGcGJBOEdrRkx6dDRMRFhZMEdNOVRxWXlIT01lb3NNbERPL3Bn?=
 =?utf-8?B?dHpaQ3FBRG1TbnRmc2lGRmdPekNOVEsrZXNNakZIc1Z0eCtlZGtUSmN1RmVC?=
 =?utf-8?B?NlJENlIxWEhtYTNiN0QrLy8yMzNpbjJrRm4zTDlnS3JzNzlGelFQQTB4di85?=
 =?utf-8?B?MUczajI3UHdNYkRHM09DeXpTSSs1dSthM1ZPWnBBMGJNc1NNcHV1aDBpTE5o?=
 =?utf-8?B?cHZIK0F2SjRjMTFsMW14Nm9CN3dXS0dGU0lMZHNPUGdyVm9SS2dVY092N295?=
 =?utf-8?B?LzJmbVFac2xUWGt2SEZMYVBKOWJVWVJDMWkxMFhVelFOd1MrR0NZUFFWc2tW?=
 =?utf-8?B?em9Db2gyQjIrWUpOeXQyOFdIanRlQ3JZSHV1ZW1pK2NrMEFwdjgzVXJHNGxa?=
 =?utf-8?B?cTNrT1dQcGNhWjdvbHdrVVNiWEdhSEdwSUY4ZE81aVdJZmRGMzduTGpGdlJM?=
 =?utf-8?B?aXlnRW4vSlh1c2xOYkdXWm1MYStBamhFMDVzemlUTzJoQzBQc0ZyOGFUaGdK?=
 =?utf-8?B?MTJodVhLUEFJZlVGbFd4SnJvcklPN3hmN1JITmZwOVRiejVGTnpkRzIrYk9y?=
 =?utf-8?B?YTJwODVsUW00OEF2VHl4MWhyVDltT0NYVVB1RWpFTXg1QzBSam92Skx5Qmd3?=
 =?utf-8?B?VC83RjVYWGhzZlQ4b3J4dHA4YmZ5TmttR2Y0eUJGTG85b1loUjZlUDFqQzJp?=
 =?utf-8?B?eFBqVlJ4cUNUb2ZTV0s5bXFJeDhhT21HdWllY2xqREhEN2lMUGQ1OCsxMkJO?=
 =?utf-8?B?d0FHT1hYekxSOVNsYjZ5S3ZBNjdpaSs1L3NxM1lZWFhiU3VERm9HVk0weXYx?=
 =?utf-8?B?MkJDbW8zYk04RDhGYnljbDNaUjVDZ0pvdnAvSWkzUm9BOHhGMlp6UlJjNzJU?=
 =?utf-8?B?YmpRWVg0ZFVqelpLK2R6eGh5ODgxWkkyTUFTZXRsVkk2Q1JaRHMzaS9aRSs1?=
 =?utf-8?B?M0ZWSVVTZ3BPK1RDbzcyeHIyVjF4S3BpeXZ0VVZtTTIzOG9HRUJ0alJEUi9Y?=
 =?utf-8?B?RzAyNXJIRjVLcHU5TkF5T3h5TFdOeWFIZ3FzVno3Q29FQUcrTStnTEdhTVZF?=
 =?utf-8?B?SXhKNW1NL1Fib1hZOE1Rdzl6dnRuU3Y4akh4R3E1OHRXV2lLOHBQQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09f8084-0e64-4739-83eb-08de7a0e9e37
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:53:53.7582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WaU6RvYQAxe/ymTzso8hUAGTGWo9j3lnrR8HVAWGZyoW9vn1QSB6gJYc/UZGxmbQ2Qj/1yLjjFkjTdWETzlGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8476
X-Rspamd-Queue-Id: 9CBD1204ADA
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
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 04:39:00PM +0100, Jan Beulich wrote:
> On 04.03.2026 16:06, Roger Pau Monné wrote:
> > On Wed, Feb 25, 2026 at 12:44:44PM +0100, Jan Beulich wrote:
> >> When Dom0 informs us about MMCFG usability, this may change whether
> >> extended capabilities are available (accessible) for devices. Zap what
> >> might be on record, and re-initialize things.
> >>
> >> No synchronization is added for the case where devices may already be in
> >> use. That'll need sorting when (a) DomU support was added and (b) DomU-s
> >> may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).
> >>
> >> vpci_cleanup_capabilities() also shouldn't have used
> >> pci_find_ext_capability(), as already when the function was introduced
> >> extended config space may not have been (properly) accessible anymore,
> >> no matter whether it was during init. Extended capability cleanup hooks
> >> need to cope with being called when the respective capability doesn't
> >> exist (and hence the corresponding ->init() hook was never called).
> >>
> >> Fixes: 70e6dace747e ("vpci: Use cleanup to free capability resource during deassign")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> vpci_reinit_ext_capabilities()'es return value is checked only to log an
> >> error; it doesn't feel quite right to fail the hypercall because of this.
> >> Roger brought up the idea of de-assigning the device in such a case, but
> >> if a driver doesn't use extended capabilities the device would likely
> >> continue to work fine, for Dom0 this probably wouldn't be quite right
> >> anyway, and it's also unclear whether calling deassign_device() could be
> >> done from this context. Something like what pci_check_disable_device()
> >> does may be an option, if we really think we need to "break" the device.
> > 
> > We may want to add a note there, stating that we have considered all
> > possible options, and hiding the capability and hoping the owner
> > domain would continue to work as expected seems the less bad of all of
> > them?
> 
> I'll see what I can do.
> 
> >> The use of is_hardware_domain() in vpci_cleanup_capabilities() was
> >> uncommented and hence is left so. Shouldn't there be a DomU-related TODO
> >> or FIXME?
> > 
> > Hm, yes, possibly.  I think limiting extended space availability to
> > the hardware domain only has been done "just" because we have no
> > extended capabilities to expose to domUs so far, and I don't think we
> > even setup the extended capability list in the domU case.
> 
> Considering how many things there are to be done for DomU support, I
> think it would help if every place where e.g. is_hardware_domain() is
> used only as surrogate would be properly annotated. Or perhaps properly
> named predicates could be introduced right away, so one can actually go
> hunt for all of them. Then again is_hardware_domain() is also something
> one can go hunt for.

I would mind having more concrete predicates, even if right now they
are some kind of dummy checks.  However it might be difficult to
formulate those know without having the full picture of what domU
support requires.

> >> @@ -349,22 +352,23 @@ int vpci_init_capabilities(struct pci_de
> >>      return 0;
> >>  }
> >>  
> >> -void vpci_cleanup_capabilities(struct pci_dev *pdev)
> >> +void vpci_cleanup_capabilities(struct pci_dev *pdev, bool ext_only)
> >>  {
> > 
> > You could short-circuit the function here, ie:
> > 
> > if ( ext_only && !is_hardware_domain(pdev->domain) )
> >     return;
> > 
> > But I'm not sure that would simplify the code of the function much?
> > Likewise for vpci_init_capabilities().
> 
> Such a short-circuit would need replacing / dropping once DomU support is
> added. I was hoping the chosen arrangement would make for a little less
> churn at that time. I'll listen to your advice, though, just that the
> question gives the impression you're not quite sure either.

Yeah, I wasn't fully sure.  IT would be nice if we could add those
short circuits now, and then once domU support is in place we just
remove teh shortcuts and it works for domU also.  But I fear more
changes will be needed anyway, at which point the short-circuit is
not that attractive to use.

> >> +
> >> +    vpci_cleanup_capabilities(pdev, true);
> >> +
> >> +    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
> >> +                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
> >> +        ASSERT_UNREACHABLE();
> > 
> > Ideally this would better be done the other way around.  We first
> > remove the handlers, and the cleanup the capabilities.  Just to ensure
> > no stray handler could end up having cached references to data that's
> > been freed by vpci_cleanup_capabilities().
> 
> And maybe not just that: For the hwdom case cleanup_rebar() adds new handlers,
> which we'd wrongly purge again right away. (Because we pass "false" for "hide",
> this isn't an active issue right now.)
> 
> > And we should take the write_lock(&pdev->domain->pci_lock).
> 
> Now this is a request that I'm struggling with some. I can see that callers
> of vpci_{init,cleanup}_capabilities() assert that the lock is being held, yet
> it's not quite clear to me why that's needed. Shouldn't vPCI internals all
> synchronize on the vPCI lock of the domain?

Right, the callers of the handlers already hold the locks, and the
removal of the handlers should also hold the locks.  The point of
taking the d->pci_lock is to avoid the device from being removed
while there are vPCI accesses against it being done.  The vPCI lock is
fine for vPCI internals, but functions that deal with addition or
removal of devices need the d->pci_lock to avoid races with possibly
freeing pdev->vpci while in use.

I think you are right, and for the usage here (that doesn't add or
remove pdev->vpci itself), the internal vPCI lock should be enough.

Thanks, Roger.

