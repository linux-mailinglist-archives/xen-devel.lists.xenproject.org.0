Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8259C3EEE0C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 16:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167883.306504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFzhh-0000jD-Au; Tue, 17 Aug 2021 14:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167883.306504; Tue, 17 Aug 2021 14:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFzhh-0000ge-6y; Tue, 17 Aug 2021 14:04:33 +0000
Received: by outflank-mailman (input) for mailman id 167883;
 Tue, 17 Aug 2021 14:04:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFzhf-0000gY-Ge
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 14:04:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a0f5018-ff64-11eb-a4c4-12813bfff9fa;
 Tue, 17 Aug 2021 14:04:30 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-zECGcvC6MWOAGW4M-Ota3Q-1; Tue, 17 Aug 2021 16:04:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (20.178.127.208) by
 VI1PR04MB4445.eurprd04.prod.outlook.com (20.177.55.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17; Tue, 17 Aug 2021 14:04:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 14:04:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0116.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Tue, 17 Aug 2021 14:04:25 +0000
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
X-Inumbo-ID: 0a0f5018-ff64-11eb-a4c4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629209069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yhael/OCrYG0Gk00HT+3gpAznXK7ggPHqOxr57vSVjc=;
	b=YJynMip88E4oPd7/mRjJnxflQ30hp+GC/6HMYKo/g+I1EonDjkP5NXj6wBS671vuOU7P33
	97jt15xuaN7tE7qU/g5MPCECyX3Ah22mTWhjdQz3zeWIqPr+nGIcGZNkCjOe/K3sp2fQ8k
	9JuW9YqKN8EVmytTpRw2c1z9HNhebRY=
X-MC-Unique: zECGcvC6MWOAGW4M-Ota3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyTxzxy2VHiEIXXjsUG51aPlPx6Sn6fF1PAengoaspvn4RXO3uDnwEJoadc+1zN6KQu8PdUtShnahT307tBylJVu4IO4CM2Yh3Y6iTWtCDVlq7IcsRCU347sSFGK9LlNi6V501bVgOAz/GTEpSKnQqmmRCL0oAg5oBEN8H8RTWP4n6TNnTSi8LhZJTo18Y4Gbx041+HOeNGBH5cDqATDvupQMF9AV9o0CTmK5XVPAO4C9Dd3CoEn6DSWJwDT8e2uCYdGTs2MkOczbA5k25u2SL2AagGbjftzmFsN/Nmcik0d2+8MeqRhj0nV6Ap79UPfq4m3TEnM0xlEpXdlyvfUVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFGm9Cm1AQf93NwDWQlg7aQsRTTMVjCX3fKQG+arNYI=;
 b=Eovl8rYdmtoNcjl0595NcKSwsoskLhi7/mSEGdPjhefyzjZKkb1GElrFcJ8OAjWCGqLY1ntddcl945Zp+Ze15f9eU3IMj7+cF2QObPnBFmA0HyHVPFlua9reJi9xVq2tmT4Uh3VnDvAXCPzzJkK3P3+u8CNkHO3l19I0jrQD7LMLnAH+Jk837z7uTBcXaKR5YdyMo00g3HKLsB93yALZrDmAnwzK4lRPnKFeYkFxo2sbMJEBogbOBQvdNjBgazM2CRFxa5WCOWut1npJ8j9wC2Pg8Aa7sdRo6uYACS2pkFZBH38bxkCYkTA0C9diLSjC3sVTHFtLSFnEClaGWwyLHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: S3 resume issue in xstate_init
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <YRsQArpQcpLB/Q5h@mail-itl> <YRuXNmpT+03aPo+p@mail-itl>
 <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com> <YRuhFWLrplRRV6t+@mail-itl>
 <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
 <78eb61ad-45ba-51f0-a5ba-624408d60cc8@citrix.com>
 <a704d6c5-c818-e47b-32b6-f57b2d9670f5@citrix.com>
 <96fe5a22-d1d2-1e74-313a-c5377e9899d1@suse.com>
 <b631b56d-6048-c900-a47c-f87df9dc1a5a@citrix.com> <YRu+SuX1N09pbCRp@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b9f0dd99-2aa8-0ccb-7424-b34ee33b836d@suse.com>
Date: Tue, 17 Aug 2021 16:04:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YRu+SuX1N09pbCRp@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba34e54c-2cb9-4309-8676-08d96187ec31
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4445F234AD79865A51119E9EB3FE9@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/rcJ5QhJUsns+TCQDtRrcvhg8s/81zELqskSX5kj8M5bbR23c90/52fMARcal08CPU7WQDNOqGwmnvEr2XIgQZuKUDgUCUiaidexhhMtafMEbiXoTPMCjobVIUJGj49y8LVkUkBEHyQl6afiWtOThVasUWdaJyCgTkAzgQSt6eY2YySAo8kWGAD5Ac/JFF3CAO0TFMaebwIGGaeIxgaO7RlDEG2gKFsAQNSMDLla0oJWUI2TvZTIhxe0wktAYwsT80FONy1JMEV5ER8Vg7f4krUfRLw0GMVL8ALX4lIjFAJ4eBrrFESLw7MJNL5CUdegRpbh43yh+r/qRfLO2NbIB4A5Ps6Agql9dp73/e5+OEAN32+2Y3eITBl81mKxveBaOfABnPJQHDycF/skT92bgK86ZwDceMSm8LXqAuLytmn6rLSVI4BA1G0CfKNVkIieWfI2cWBsqG4RJan8ZNXqhB2gna3WRmmiA3VwoUqbjkCI9EVQWNzQFPKu3dnaNd2HLczcNrexnJH2xrnnIzYaUpN3J1LBXADW6nK8YNgdkRFrVldC2krr2Wc92T+TW7LMtWryc38qvRvPvfZ3Gi4wfhvvGXOq9FCzHYfLwaQk6LJoIpAqV5LYEPfwuxSS3KmW4Ua76CWq67C1pZAfu4Z24IRQVNf9dxgH65K6GvhM2Ekjv7+FRve4XdYskSZcLxvVecNanUPUsEQxJJR0AZ0ejwMIZrZcKzob2EAu1IsmOQY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(31696002)(16576012)(36756003)(316002)(54906003)(8676002)(86362001)(38100700002)(26005)(31686004)(186003)(5660300002)(53546011)(83380400001)(508600001)(4326008)(66574015)(2906002)(956004)(6916009)(66556008)(66476007)(66946007)(2616005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rJ/4Itmz2EDelFR9h1peXc7VwRuH7vs14RzxIJWavVAR3K0Xwh/nOu9SA5qK?=
 =?us-ascii?Q?JnajfbZvKIT+Umm7w8eP9G5pFooCzmWt1yk6CuC/zJDT6HiAnveV9irEwfsE?=
 =?us-ascii?Q?xfDwgbGn/czixICZ9SzLhbU+pEPglvWa8OFzzu4MlcUUNPDTLp64rPtv+TTE?=
 =?us-ascii?Q?yqU+D2olBCZMUDnLfDEMV///0UZdOCHmRNd2i4nPiDvD3boUX6yq2hs5GUMG?=
 =?us-ascii?Q?tt+pJYrZLYv9IrFpJjlDr+EkEbvjpDbth8IMP2klv9gW8hlvoBe+0MTJ9T72?=
 =?us-ascii?Q?lTZ9lmCzTO38G17XK/bSqjYGy2cCYj3miv4F4ph554V2G1G8auQ3d4KJ1GRl?=
 =?us-ascii?Q?ccdtCelfsgBg58QHrRbVWV8NU7wzQFiHnM60fjVdHN0x/KBZiAGep+ZN6TCy?=
 =?us-ascii?Q?MJoiLpoqJ5JMoES10WjWLus2KrZPRTKjgZOlOHeoIH8yIpthw0UsUe04F/+V?=
 =?us-ascii?Q?hod+KB2ux8QocmizKAOepKET+pcg32RSQYEZ8E41zjqLI0pN7uiB2oxxlnk/?=
 =?us-ascii?Q?X1eQKVRKYCs/qKEmBJe/MNYQd8F9keNNrN59VU3ZsG95X8/NoyntecEUiY3E?=
 =?us-ascii?Q?Me3FqupWnyzEL4NmGL1BbsFFMmOTQcEG2IBQjxJz+DstZ12MhTv5KWuNni1f?=
 =?us-ascii?Q?sSVwDkuO02eIRbaTLWPGgLr0ujfGLUD/eyivYSRv08PhDEh9MxK33HVl8ikx?=
 =?us-ascii?Q?VkdO4XbuahlCwVy5yGQoeOOALFWX+Oq33aDPBiiUDdsZZk7zeFm+qNEQFsbq?=
 =?us-ascii?Q?qp7dlCKTwoLdwcaTgmBT3YezyvEKXvMckY8jQiakN6ytyLcOHhgHu2SNolwP?=
 =?us-ascii?Q?Uq9GLHj3yi8U2+RX/2bcUc3AFX7AIOrdRRlHBJUaG7tU7SLiLKVvx99HqHQC?=
 =?us-ascii?Q?y64fXb0WlqvTKpJfjqAO06RZjkp2ccUwFCk11D4us88Ncvv/jJDm9lzMJ1Nu?=
 =?us-ascii?Q?4LTNFONsb2wo7Yemq6PKtaa9qQeWSel0XdYcvnZ6iEVz4wgTSDQDkqD7IfED?=
 =?us-ascii?Q?r03ZOqpwQzBne/Hby3LoR3xRsl7wQ8tvLMzvYoAb/qVyGdW+NpcKNg2TmoTC?=
 =?us-ascii?Q?lF++AQS9Qc+mmQciKMR6CgiIJeu0QIvKH2lm1GYUIEwOkvKMgydlpoxALFbx?=
 =?us-ascii?Q?BvSeiQ1wNFpH0B54fAc7cjrRs83sDvJ6GNZvyqWgBal5dORR2FNaLjvrpSdH?=
 =?us-ascii?Q?7KOCVUmRYtn2sZ32b4dpFib016gN2Bb/zUx/K6RrGiPaardJWDkwIWvS4NI0?=
 =?us-ascii?Q?nib1+U2TzkM1ZuC/85xpEN8MWgOdUQhZyXczW4HPOmw3gosq/+DjX+bWVB66?=
 =?us-ascii?Q?dkRYiqM5ZAlPdut6a0EU2WNx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba34e54c-2cb9-4309-8676-08d96187ec31
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 14:04:26.1573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAuJpRt64Iazyc74y/QOYczDo8CqpYgloyui7bqfzZHk+eqWusD3ocs+OJm0sJe1Tm1VRuV+EimtbdsrkC8O2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

On 17.08.2021 15:48, Marek Marczykowski-G=C3=B3recki wrote:
> On Tue, Aug 17, 2021 at 02:29:20PM +0100, Andrew Cooper wrote:
>> On 17/08/2021 14:21, Jan Beulich wrote:
>>> On 17.08.2021 15:06, Andrew Cooper wrote:
>>>> Perhaps we want the cpu_down() logic to explicitly invalidate their
>>>> lazily cached values?
>>> I'd rather do this on the cpu_up() path (no point clobbering what may
>>> get further clobbered, and then perhaps not to a value of our liking),
>>> yet then we can really avoid doing this from a notifier and instead do
>>> it early enough in xstate_init() (taking care of XSS at the same time).
>=20
> Funny you mention notifiers. Apparently cpufreq driver does use it to
> initialize things. And fails to do so:
>=20
> (XEN) Finishing wakeup from ACPI S3 state.
> (XEN) CPU0: xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
> (XEN) Enabling non-boot CPUs  ...
> (XEN) CPU1: xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
> (XEN) ----[ Xen-4.16-unstable  x86_64  debug=3Dy  Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d04024ad2b>] vcpu_runstate_get+0x153/0x244
> (XEN) RFLAGS: 0000000000010246   CONTEXT: hypervisor
> (XEN) rax: 0000000000000000   rbx: ffff830049667c50   rcx: 00000000000000=
01
> (XEN) rdx: 000000321d74d000   rsi: ffff830049667c50   rdi: ffff83025dcc00=
00
> (XEN) rbp: ffff830049667c40   rsp: ffff830049667c10   r8:  ffff83020511a8=
20
> (XEN) r9:  ffff82d04057ef78   r10: 0180000000000000   r11: 80000000000000=
00
> (XEN) r12: ffff83025dcc0000   r13: ffff830205118c60   r14: 00000000000000=
01
> (XEN) r15: 0000000000000010   cr0: 000000008005003b   cr4: 00000000003526=
e0
> (XEN) cr3: 0000000049656000   cr2: 0000000000000028
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000000=
00
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d04024ad2b> (vcpu_runstate_get+0x153/0x244):
> (XEN)  48 8b 14 ca 48 8b 04 02 <4c> 8b 70 28 e9 01 ff ff ff 4c 8d 3d dd 6=
4 32 00
> (XEN) Xen stack trace from rsp=3Dffff830049667c10:
> (XEN)    0000000000000180 ffff83025dcbd410 ffff83020511bf30 ffff830205118=
c60
> (XEN)    0000000000000001 0000000000000010 ffff830049667c80 ffff82d04024a=
e73
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 ffff830049667cb8 ffff82d040256=
0a9
> (XEN)    ffff830205118320 0000000000000001 ffff83020511bf30 ffff83025dc7a=
6f0
> (XEN)    0000000000000000 ffff830049667d58 ffff82d040254cb1 00000001402e9=
f74
> (XEN)    0000000000000000 ffff830049667d10 ffff82d040224eda 000000000025d=
c81
> (XEN)    000000321d74d000 ffff82d040571278 0000000000000001 ffff830049667=
d28
> (XEN)    ffff82d040228b44 ffff82d0403102cf 0000000000000000 ffff82d040228=
3a4
> (XEN)    ffff82d040459688 ffff82d040459680 ffff82d040459240 0000000000000=
004
> (XEN)    0000000000000000 ffff830049667d68 ffff82d04025510e ffff830049667=
db0
> (XEN)    ffff82d040221ba4 0000000000000000 0000000000000001 0000000000000=
001
> (XEN)    0000000000000000 ffff830049667e00 0000000000000001 ffff82d04058a=
5c0
> (XEN)    ffff830049667dc8 ffff82d040203867 0000000000000001 ffff830049667=
df0
> (XEN)    ffff82d040203c51 ffff82d040459400 0000000000000001 0000000000000=
010
> (XEN)    ffff830049667e20 ffff82d040203e26 ffff830049667ef8 0000000000000=
000
> (XEN)    0000000000000003 0000000000000200 ffff830049667e50 ffff82d040270=
bac
> (XEN)    ffff83020116a640 ffff830258ff6000 0000000000000000 0000000000000=
000
> (XEN)    ffff830049667e70 ffff82d0402056aa ffff830258ff61b8 ffff82d040570=
1b0
> (XEN)    ffff830049667e88 ffff82d04022963c ffff82d0405701a0 ffff830049667=
eb8
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04024ad2b>] R vcpu_runstate_get+0x153/0x244
> (XEN)    [<ffff82d04024ae73>] F get_cpu_idle_time+0x57/0x59
> (XEN)    [<ffff82d0402560a9>] F cpufreq_statistic_init+0x191/0x210
> (XEN)    [<ffff82d040254cb1>] F cpufreq_add_cpu+0x3cc/0x5bb
> (XEN)    [<ffff82d04025510e>] F cpufreq.c#cpu_callback+0x27/0x32
> (XEN)    [<ffff82d040221ba4>] F notifier_call_chain+0x6c/0x96
> (XEN)    [<ffff82d040203867>] F cpu.c#cpu_notifier_call_chain+0x1b/0x36
> (XEN)    [<ffff82d040203c51>] F cpu_up+0xaf/0xc8
> (XEN)    [<ffff82d040203e26>] F enable_nonboot_cpus+0x6b/0x1f8
> (XEN)    [<ffff82d040270bac>] F power.c#enter_state_helper+0x152/0x60a
> (XEN)    [<ffff82d0402056aa>] F domain.c#continue_hypercall_tasklet_handl=
er+0x4c/0xb9
> (XEN)    [<ffff82d04022963c>] F tasklet.c#do_tasklet_work+0x76/0xac
> (XEN)    [<ffff82d040229920>] F do_tasklet+0x58/0x8a
> (XEN)    [<ffff82d0402e6607>] F domain.c#idle_loop+0x74/0xdd
> (XEN)=20
> (XEN) Pagetable walk from 0000000000000028:
> (XEN)  L4[0x000] =3D 000000025dce1063 ffffffffffffffff
> (XEN)  L3[0x000] =3D 000000025dce0063 ffffffffffffffff
> (XEN)  L2[0x000] =3D 000000025dcdf063 ffffffffffffffff
> (XEN)  L1[0x000] =3D 0000000000000000 ffffffffffffffff
> (XEN)=20
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=3D0000]
> (XEN) Faulting linear address: 0000000000000028
> (XEN) ****************************************
>=20
> This is after adding brutal `this_cpu(xcr0) =3D 0` in xstate_init().

And presumably again only with "smt=3D0"? In any event, for us to not mix
things, may I ask that you start a new thread for this further issue?

Jan


