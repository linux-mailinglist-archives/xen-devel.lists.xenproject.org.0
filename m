Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBFC53B709
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 12:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341041.566213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwi2W-0005xV-0X; Thu, 02 Jun 2022 10:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341041.566213; Thu, 02 Jun 2022 10:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwi2V-0005uO-To; Thu, 02 Jun 2022 10:26:51 +0000
Received: by outflank-mailman (input) for mailman id 341041;
 Thu, 02 Jun 2022 10:26:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwi2U-0005Iw-1l
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 10:26:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 828af386-e25e-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 12:26:48 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2177.outbound.protection.outlook.com [104.47.51.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-WY9WnJ7fPlqzFUhLbCJAPw-1; Thu, 02 Jun 2022 12:26:47 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2521.eurprd04.prod.outlook.com (2603:10a6:3:7d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 10:26:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 10:26:46 +0000
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
X-Inumbo-ID: 828af386-e25e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654165608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y8ukhmYyNTQg/Apn6MkKOZE6epFoKJZGr2rITtOrpGk=;
	b=McNeaDi0ZPDSpHQcKKccLtFpxgynQKuM0uWaon7tebv9uBcT0HTlFam/VeyDObw6v3XzZk
	xH0nu2lDJmJF0Y3KrCUDY36bA1vhgzkSQ4wUR1qt38r37L55u5Yrh2mBB0Tva/FbqQHrE8
	2NzNHDITeedzGbAoDJo85vNdAQnKHRM=
X-MC-Unique: WY9WnJ7fPlqzFUhLbCJAPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiuLGAM/hgaAqSrT8+7X0U8Y53UD/rSAMBXTtb89bGx1VuZkIXXQKufX6mYTOw7cAudRqqvW4Z9qwCt48Ij1+MPLZGeiPXzPio0+lIe1xMVVgEQc1oqWJYU78oE4G14R5TRX/lexV7Bxu3WomOexADb7Iw2XstWEwNSw8I0FDaJspJcGqzqxv7hkqq/3Yi5hNQsPg7PZPWmisem/b9IO4VHHxA2GziaSHJIJyzU8IYgQPzw/TxseqiRFNQ6U4dhgQERhiite1N7pQaO+KTCvo02P4r/tMOH/So57fODo6YiZmPwyt6pDYEq/v7cbYNHvxoa3aw974VVhe9SEPCHAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8ukhmYyNTQg/Apn6MkKOZE6epFoKJZGr2rITtOrpGk=;
 b=hwh5GxKSLa41f1i+rs7abwC7An/I8pfkrh6M0OJAPzKkLlur5i7PchAz11W8NkOayQrsHvsffYw+iMvCL7vhJDKXOpTta2MISsdiWIGcpJIzBjT5b+MkSfpniQ3WHTpxaKounweIAkKy+IXGcCTe/6+XZ+LQnOVKJe0aE4xop0SHKKRp4t2SZ0TUiYAZt6c2OzGEH8EyLDdNMg3xmxYitVkoq6TSxP+vrb3oAsY9kCLPOuW8dOvUPHFMNnf6cYJfbrLc938Nm+GfsuBy7mQUOLvHE7s8qOVm4HeNceDXSj7P2mLS9D5iNdbo8Rifxq7KzZfwLzahk80n/QJjzaWY4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46c6bf61-5669-0de2-163d-64b9a3ce07a7@suse.com>
Date: Thu, 2 Jun 2022 12:26:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2 1/2] x86/mwait-idle: add 'preferred-cstates' command line
 option
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f8cebd1c-1679-7b67-c43b-8c0cbe8ffa52@suse.com>
In-Reply-To: <f8cebd1c-1679-7b67-c43b-8c0cbe8ffa52@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P251CA0002.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85e09c86-bff9-4760-e046-08da44826519
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2521:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB25216C87802A1F683B7EA3ACB3DE9@HE1PR0401MB2521.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L/yKWv7IWOK8EwHeswpZnTLsiVHf0UaeXCIHCfiD0l0X5oaKdFARhWvwnHsaOhX96MCMxY3dVN53ZjY/MdfIJ0oNIOlA/lWba8f9jeUDAQY+sYaa55MPcfNglBLLzPaplsK5cQ7m0WgHbJncTdjWtJorpbkS969DW4HsTOuPPAm9348cbbBpoKZLRXM89lbs+n7O5E4KgiP75wMGlbQCcPYWub8QoxxqEvrW6u3mWqFgYttLTNbs+E153sAzi/4q7sThiSwlm/PAp6Q98DD5yWPD9w5tAdulBNAdc4oFlvNLyrlbD+K/yk4/NqaVSZyAyby8MT5lKy9utatk8ciErbqTdEvOw2IHXe8xukDUaempLQnfR3DcehnZ+9tEsnK8Jbx20z957HPhJYgJpH99liHjSP3Q+1F8WXTFR82L+z++OyMH1tP4KskWGLQk4ys/Sp8aHVCEtVbMnIHA/jsJ5t1Ob4fWPr3RbAGLx+L8YoLDsMBk9TCrnLVUBGhQmtgVI78VoGI7l6qrMjdqBD3yv+K0uBCqwnYBIFY5uNB1RlUO4bqYr1azVtnY9GwIp3847dctKT2UHrtCobon/ZpTZA5vxOO6NhZSimfz3An97v1BDPvhpLyeTQh3WtPJp75uV4wue2VuDNNoIDBtrbXFmNyuTpILogyrHI55gBNB7zfxKEa0q8pQxowAL3/e1ehL/YG52Z5yaqx1Yry/zuDKrTMPwIphSK5mIb99r1WHIiu7RbzH7qksdruqFf8yKpQA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(66556008)(66476007)(4326008)(8676002)(316002)(66946007)(54906003)(36756003)(6916009)(86362001)(6506007)(31696002)(5660300002)(2906002)(31686004)(83380400001)(38100700002)(6486002)(6512007)(508600001)(186003)(2616005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXdRRzRRSVIrY1RyTXo1OVdtTlNsWjJ0VkdvRE85Mmp0QS8yUjh4c2N6bXg2?=
 =?utf-8?B?VllRK0pzaW1BazVzWFRWUW5ORkhDN1JyeE8xRkJia2ZQeWZFSlRTc2kzZnpF?=
 =?utf-8?B?cmo1SzdaTUxBTUpPUjBxNkhvdklOYnFWYlArV0U4THZEeUJiVkd3SW4xU2VY?=
 =?utf-8?B?UWE3QWkrMEFNTjdCSzdaRTVCYStoRnlMQk5iWU1tUjlKRXl3Rjl0MUlsL3JW?=
 =?utf-8?B?NnYrUFpOZUlBVlVKN0VWdWNKQlJMK3V6VGQ3c1l5ek50TTRlUzVCT0ZKVVVJ?=
 =?utf-8?B?c2tjRzYwMVlXMGFZUlArUUVrZ0tPbSsrRU10ZmRMK2Y4Q0xkTzFwV3BjeHpa?=
 =?utf-8?B?R3E0cTVSMDBVanZRQkEzdmZ3YkxPTE5CSzFuTDRld1I3aXdTZGdRK1VmYmZU?=
 =?utf-8?B?QUw4NThyQ3JBSDVvUWc2RDJKL1hnT1BOMHltYjJ1dnBFd00wbDlNWEVocTNv?=
 =?utf-8?B?NFJHQW5ka08rRU9uQW9oK01ZajIxSFZscUFmS1ZXV1ZvVG1vUmtuUDFhTjRO?=
 =?utf-8?B?N29PR1BhUkFpY3k4dmhmY2tEcGZaZ2VuRFI1ck5ETDhBMU5LY2p4ZW5ML3Vm?=
 =?utf-8?B?MFpjQ2VacEdVQ1NoYndnQWd4d25EWHNIQXI5ZGloLzBIdmE2WVVIQ2pvZ1ph?=
 =?utf-8?B?ZzgvUUk4Q3dBNUx6Nm15aDgzRUV4YWJTNEFrSklTV0ZPUEc2U3JFWnEybGhG?=
 =?utf-8?B?ZzhCM1JDdzgzVzE4WklDa0JSSG51cFMyd1M2cHhOYTVPM2VYVzl4RG9xKzUw?=
 =?utf-8?B?am1pUXorSUZaRHBzR0dmeGYzcDUxRm1sU3FzLzF0eDgwLzRJMndWQ002TlFs?=
 =?utf-8?B?VmxFd01JNnFmUDJQRkZkTTJUdmFTUjNnclVMTG5SMHM5QXdEUlBmcktWL05a?=
 =?utf-8?B?RHVIVzluS21LYzI5UW4vd0ZkSFIzcHplOExHdVpnYWJIWVAyNU5XWkFhclhV?=
 =?utf-8?B?c05UbXBQaHVVZnlFeDJvcFBpbWJFcGFwSVRLcHlDa0w1bktJaExpNkg0d1cx?=
 =?utf-8?B?T1dQZ1BLMGxVdzQwODdONlNhQVpoZnlyY09rakt2TkwxS3NZUmhPVG9rRHQ2?=
 =?utf-8?B?UnFheU45NFF3WmEvNVVBclJtTGVCOW15ejBTR0tGUm0yd2JmT3IxVE5naDFL?=
 =?utf-8?B?ZWUyVTBFaUo0Tnd3OWxUaHMwbE41a3dzR1NWM09SMnM2dCsvZERON3lwUFFz?=
 =?utf-8?B?d3haUzhET29Gdjg1NHpBZVZkRm00d05CNEFvSVR0NnpQazhBUDV5MkdheDU2?=
 =?utf-8?B?T0htSTFienFMdnVwV0JSUmJQdTRkNkIzMmUrNC9hM3ZCVFFPZkc4KzJqc3RW?=
 =?utf-8?B?ZEY1V3hGOGZhMTBNTWxHWkZybnJSdnlCbHNlZGNiRk9oQ0E0dDhWVTJSdC9I?=
 =?utf-8?B?eGNXdno3UFB6azlFRmRxN1YvRmUwcjg1cHFEanorRkN6MjFRdm5Cbm1JNExP?=
 =?utf-8?B?Tk85V0tleWVGUHF2M0t2R2YvbWYxMTlzNkdFMFQ4eTg5S3ArNGI1UW9JZGlU?=
 =?utf-8?B?RlNOaDZaaEJFRTR0UXRYYnVwMVdDUS9ZUHFiQVIyYXczMnJCblQwZjRxR2Zx?=
 =?utf-8?B?WDQwZlpySk1OTDl2dmd0Q0I0MFdTQVJVY2dXYlNLS1RDUnRKMjdIeXdsRjFp?=
 =?utf-8?B?UXBsYjh6NEVwSmV3UTY0aGdtWXJUSzVhWjNmcWNOTUlVNG5SazNNYjV5a294?=
 =?utf-8?B?RnVhaWp3T3AyMmU1M2NYOERRZ3F3T09BYlB5RmJscldqbWl4cjJGM3BEcVd4?=
 =?utf-8?B?OVRUVWJETEdBamxicEpwLzJ1Z2ZUam9kallyd3paZ09ZVThldnVVdUtNVFV0?=
 =?utf-8?B?ODd3WjdPVjVsQlh0R2VGeVRKTVVRYWhxbEFub0pJcTlkcFh2U3ZyZ0dPOElV?=
 =?utf-8?B?alRTb2hCbVZPbFd0cGhhZkhiVElCSzFoTXp5YXVrUisvZmFPdStnYjNrbWh4?=
 =?utf-8?B?WkcxZjZGZ2s2a2wvMGtHZ1UySE9nSHI4MDlFRlg3RnpwcXhnMjBlcDRiZUhu?=
 =?utf-8?B?a2xzYUdmWWE0Nmc1WWRYY2NrN3cxcCtmVEVQMGhBRnREUlJWYS9UVytXZlBy?=
 =?utf-8?B?K29pNVdHM2NvNmlhd1ViR2FadW9JL0xpZi9tQzQxQUtyb0JSSm1EUTBSRzRJ?=
 =?utf-8?B?eGNNWXdURHI2dmRNYTQvWmIvRVRQL0YwSEV4WXF6SkMxUWNJd1dVa2tHTW9I?=
 =?utf-8?B?clpmOWlLNEFBTjEwN2hFMFVxaFQzRm9CNzNYYTMrNlFNZ1QwYndaQ3pkTmRt?=
 =?utf-8?B?RnozTHh3UlFKaWN2QlJuZXA5SmdtbXBmemc0cmJraEdhSFg2Q2JtZytxaVZ4?=
 =?utf-8?B?RnJ1V3VselFMME1wVzRGTG91dlFrbGNRdWZDM3gxSzlPNEpEQVVwQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e09c86-bff9-4760-e046-08da44826519
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 10:26:46.0228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juT4yKrR9yjI73flIbiuQsfgVnCd6srd2I/uv2frnq6PZJmsxcJjgA++jka6Ok4mb96F51QLOfvNgwabZtgY6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2521

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

On Sapphire Rapids Xeon (SPR) the C1 and C1E states are basically mutually
exclusive - only one of them can be enabled. By default, 'intel_idle' driver
enables C1 and disables C1E. However, some users prefer to use C1E instead of
C1, because it saves more energy.

This patch adds a new module parameter ('preferred_cstates') for enabling C1E
and disabling C1. Here is the idea behind it.

1. This option has effect only for "mutually exclusive" C-states like C1 and
   C1E on SPR.
2. It does not have any effect on independent C-states, which do not require
   other C-states to be disabled (most states on most platforms as of today).
3. For mutually exclusive C-states, the 'intel_idle' driver always has a
   reasonable default, such as enabling C1 on SPR by default. On other
   platforms, the default may be different.
4. Users can override the default using the 'preferred_cstates' parameter.
5. The parameter accepts the preferred C-states bit-mask, similarly to the
   existing 'states_off' parameter.
6. This parameter is not limited to C1/C1E, and leaves room for supporting
   other mutually exclusive C-states, if they come in the future.

Today 'intel_idle' can only be compiled-in, which means that on SPR, in order
to disable C1 and enable C1E, users should boot with the following kernel
argument: intel_idle.preferred_cstates=4

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git da0e58c038e6

Enable C1E (if requested) not only on the BSP's socket / package. Alter
command line option to fit our model, and extend it to also accept
string form arguments.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Also accept string form arguments for command line option. Restore
    C1E-control related enum from Linux, despite our somewhat different
    use (and bigger code churn).

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1885,6 +1885,12 @@ paging controls access to usermode addre
 ### ple_window (Intel)
 > `= <integer>`
 
+### preferred-cstates (x86)
+> `= ( <integer> | List of ( C1 | C1E | C2 | ... )`
+
+This is a mask of C-states which are to be used preferably.  This option is
+applicable only on hardware were certain C-states are exclusive of one another.
+
 ### psr (Intel)
 > `= List of ( cmt:<boolean> | rmid_max:<integer> | cat:<boolean> | cos_max:<integer> | cdp:<boolean> )`
 
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -82,10 +82,29 @@ boolean_param("mwait-idle", opt_mwait_id
 
 static unsigned int mwait_substates;
 
+/*
+ * Some platforms come with mutually exclusive C-states, so that if one is
+ * enabled, the other C-states must not be used. Example: C1 and C1E on
+ * Sapphire Rapids platform. This parameter allows for selecting the
+ * preferred C-states among the groups of mutually exclusive C-states - the
+ * selected C-states will be registered, the other C-states from the mutually
+ * exclusive group won't be registered. If the platform has no mutually
+ * exclusive C-states, this parameter has no effect.
+ */
+static unsigned int __ro_after_init preferred_states_mask;
+static char __initdata preferred_states[64];
+string_param("preferred-cstates", preferred_states);
+
 #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
 /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only C1. */
 static unsigned int lapic_timer_reliable_states = (1 << 1);
 
+enum c1e_promotion {
+	C1E_PROMOTION_PRESERVE,
+	C1E_PROMOTION_ENABLE,
+	C1E_PROMOTION_DISABLE
+};
+
 struct idle_cpu {
 	const struct cpuidle_state *state_table;
 
@@ -95,7 +114,7 @@ struct idle_cpu {
 	 */
 	unsigned long auto_demotion_disable_flags;
 	bool byt_auto_demotion_disable_flag;
-	bool disable_promotion_to_c1e;
+	enum c1e_promotion c1e_promotion;
 };
 
 static const struct idle_cpu *icpu;
@@ -924,6 +943,15 @@ static void cf_check byt_auto_demotion_d
 	wrmsrl(MSR_MC6_DEMOTION_POLICY_CONFIG, 0);
 }
 
+static void cf_check c1e_promotion_enable(void *dummy)
+{
+	uint64_t msr_bits;
+
+	rdmsrl(MSR_IA32_POWER_CTL, msr_bits);
+	msr_bits |= 0x2;
+	wrmsrl(MSR_IA32_POWER_CTL, msr_bits);
+}
+
 static void cf_check c1e_promotion_disable(void *dummy)
 {
 	u64 msr_bits;
@@ -936,7 +964,7 @@ static void cf_check c1e_promotion_disab
 static const struct idle_cpu idle_cpu_nehalem = {
 	.state_table = nehalem_cstates,
 	.auto_demotion_disable_flags = NHM_C1_AUTO_DEMOTE | NHM_C3_AUTO_DEMOTE,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_atom = {
@@ -954,64 +982,64 @@ static const struct idle_cpu idle_cpu_li
 
 static const struct idle_cpu idle_cpu_snb = {
 	.state_table = snb_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_byt = {
 	.state_table = byt_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 	.byt_auto_demotion_disable_flag = true,
 };
 
 static const struct idle_cpu idle_cpu_cht = {
 	.state_table = cht_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 	.byt_auto_demotion_disable_flag = true,
 };
 
 static const struct idle_cpu idle_cpu_ivb = {
 	.state_table = ivb_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_ivt = {
 	.state_table = ivt_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_hsw = {
 	.state_table = hsw_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_bdw = {
 	.state_table = bdw_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_skl = {
 	.state_table = skl_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_skx = {
 	.state_table = skx_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_icx = {
        .state_table = icx_cstates,
-       .disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static struct idle_cpu __read_mostly idle_cpu_spr = {
 	.state_table = spr_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_avn = {
 	.state_table = avn_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_knl = {
@@ -1020,17 +1048,17 @@ static const struct idle_cpu idle_cpu_kn
 
 static const struct idle_cpu idle_cpu_bxt = {
 	.state_table = bxt_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_dnv = {
 	.state_table = dnv_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_snr = {
 	.state_table = snr_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 #define ICPU(model, cpu) \
@@ -1241,6 +1269,25 @@ static void __init skx_idle_state_table_
 }
 
 /*
+ * spr_idle_state_table_update - Adjust Sapphire Rapids idle states table.
+ */
+static void __init spr_idle_state_table_update(void)
+{
+	/* Check if user prefers C1E over C1. */
+	if (preferred_states_mask & BIT(2, U)) {
+		if (preferred_states_mask & BIT(1, U))
+			/* Both can't be enabled, stick to the defaults. */
+			return;
+
+		spr_cstates[0].flags |= CPUIDLE_FLAG_DISABLED;
+		spr_cstates[1].flags &= ~CPUIDLE_FLAG_DISABLED;
+
+		/* Request enabling C1E using the "C1E promotion" bit. */
+		idle_cpu_spr.c1e_promotion = C1E_PROMOTION_ENABLE;
+	}
+}
+
+/*
  * mwait_idle_state_table_update()
  *
  * Update the default state_table for this CPU-id
@@ -1261,6 +1308,9 @@ static void __init mwait_idle_state_tabl
 	case INTEL_FAM6_SKYLAKE_X:
 		skx_idle_state_table_update();
 		break;
+	case INTEL_FAM6_SAPPHIRERAPIDS_X:
+		spr_idle_state_table_update();
+		break;
 	}
 }
 
@@ -1268,6 +1318,7 @@ static int __init mwait_idle_probe(void)
 {
 	unsigned int eax, ebx, ecx;
 	const struct x86_cpu_id *id = x86_match_cpu(intel_idle_ids);
+	const char *str;
 
 	if (!id) {
 		pr_debug(PREFIX "does not run on family %d model %d\n",
@@ -1309,6 +1360,39 @@ static int __init mwait_idle_probe(void)
 	pr_debug(PREFIX "lapic_timer_reliable_states %#x\n",
 		 lapic_timer_reliable_states);
 
+	str = preferred_states;
+	if (isdigit(str[0]))
+		preferred_states_mask = simple_strtoul(str, &str, 0);
+	else if (str[0])
+	{
+		const char *ss;
+
+		do {
+			const struct cpuidle_state *state = icpu->state_table;
+			unsigned int bit = 1;
+
+			ss = strchr(str, ',');
+			if (!ss)
+				ss = strchr(str, '\0');
+
+			for (; state->name[0]; ++state) {
+				bit <<= 1;
+				if (!cmdline_strcmp(str, state->name)) {
+					preferred_states_mask |= bit;
+					break;
+				}
+			}
+			if (!state->name[0])
+				break;
+
+			str = ss + 1;
+	    } while (*ss);
+
+	    str -= str == ss + 1;
+	}
+	if (str[0])
+		printk("unrecognized \"preferred-cstates=%s\"\n", str);
+
 	mwait_idle_state_table_update();
 
 	return 0;
@@ -1400,8 +1484,18 @@ static int cf_check mwait_idle_cpu_init(
 	if (icpu->byt_auto_demotion_disable_flag)
 		on_selected_cpus(cpumask_of(cpu), byt_auto_demotion_disable, NULL, 1);
 
-	if (icpu->disable_promotion_to_c1e)
+	switch (icpu->c1e_promotion) {
+	case C1E_PROMOTION_DISABLE:
 		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
+		break;
+
+	case C1E_PROMOTION_ENABLE:
+		on_selected_cpus(cpumask_of(cpu), c1e_promotion_enable, NULL, 1);
+		break;
+
+	case C1E_PROMOTION_PRESERVE:
+		break;
+	}
 
 	return NOTIFY_DONE;
 }


