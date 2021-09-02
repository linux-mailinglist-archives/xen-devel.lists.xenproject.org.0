Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7633FE93F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176952.322032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgFZ-0000a5-PN; Thu, 02 Sep 2021 06:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176952.322032; Thu, 02 Sep 2021 06:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgFZ-0000YG-M6; Thu, 02 Sep 2021 06:31:01 +0000
Received: by outflank-mailman (input) for mailman id 176952;
 Thu, 02 Sep 2021 06:31:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLgFY-0000YA-Fr
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:31:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55adbe10-0bb7-11ec-ae40-12813bfff9fa;
 Thu, 02 Sep 2021 06:30:59 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-om1gsGNxM8KXJl3CXTu7yw-1; Thu, 02 Sep 2021 08:30:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 06:30:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 06:30:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR07CA0025.eurprd07.prod.outlook.com (2603:10a6:208:ac::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.16 via Frontend Transport; Thu, 2 Sep 2021 06:30:55 +0000
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
X-Inumbo-ID: 55adbe10-0bb7-11ec-ae40-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630564258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHsd+b8WBTxsiYSoThy12w4xRZWH/jbrxlJXllqH2rw=;
	b=G05TDj1ZSgpnH/o0ZbW1MbIEzbmGigctWqJPv8ne5cmgLYMolicnmDBJ9LVIuRixYlkxZa
	E9bTxC/0BujPsIcWS2npw4HBPg0yCNkVQVISriYcIq4W5GLRKf9KjsDbB8zLTHWK+Bh/ai
	qpR2HAuAg76FwMUYXU2yqFJBWcpHReM=
X-MC-Unique: om1gsGNxM8KXJl3CXTu7yw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1IuVKr6MBQlKnf9DNzaw8sZttvukCHtaG6Uzk6vDFvQJ2vyBCiiUCkpBljERlLo29TpzrcPlL4XusU5cmLetH/DtRQ48rYO6mgGhvKpLfP29qfNUXsfIPFzMeqmimFxG7CV9u3eeWsZkSLuu8efFY2qbrBvMijBGb097er8U77MGbCVojaow0ttJvEFvrb4tBneAzB1EbwhX9u91UMJ3VyapFY1qGefNynZLFH/WkFnRJAhTzOWeWROQ3mxyxQkk0hrYUtZPAwM1QRVg5mB7sQS1guEuO2b5rO06r/dOpMjHSoxlz6lFzNgqa8GMZACHka9WL8xvZpq1Qi8cZ6mUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6yovaqJcbacXnyqAkIzRPSSq5Hm0cSAJGlG1VSsXglM=;
 b=ISI/b1bm9BmDvdmzNmGaLNnG1uDe5E2QP6swui8siJcOqjKv1Mcrmh8OUquM3CB7XnuQ8PFc4480lOqqyXw3x6NQ8/Cy63h9ErpjopAmKOcr8lx+93DX+WzcI2dGMq+xSWkY3wq+n4rYO5SYOPeNALPDMxK83ctWfbCx9oNWc/t8pbHIFLpazIUJ/44OrJY7DdbxOTPaI2gDEMq9r8Dx9U+N/eHLbX0UEk7hmuEmMen/3IDJhyhmh0qQSeZnhRv0iLQ+JfVryRrTEvbXA1LPi/BeyKvoDrswITyVczr5N1L4arCMhr0/Doq1tySiprSWsbWhCnb7GrkxIG4L61a3cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 0/4] x86/PVH: Dom0 building adjustments
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <a2b8421d-e608-2abe-b78c-924ab0bf529b@suse.com>
 <YS+GmC7IjxoODTu+@Air-de-Roger>
 <17c5ce48-11e6-ac97-fa67-294cbb8b79b7@suse.com>
 <YS+mj/mxSJCIso6r@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e37d6ef-b96f-cf09-277d-403abd9eecbb@suse.com>
Date: Thu, 2 Sep 2021 08:30:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YS+mj/mxSJCIso6r@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8dac602-16aa-48d1-26ab-08d96ddb3817
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244595748E0D55FA8499219FB3CE9@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wBXNTn+KClSpf+pJ9VV4QRaKujiY9BasFYv84VSLNLxrcxHqOc+SpfCzVe+1EphoGaxr/9imm8CSJ7lcnW9xYDmEggZLiJV7MwqWfEj0acaqgjc/NcJlzm4LTsrf/XQaP3AGl99gAJ1TwST3Ii7DTJhQdjAReJlx6Y3b851AQQo2gD1J9ywlLNVvIFtq6QydVQnjCs/qibJ00pVYw0RUdgLKOO6Ib3helfdgw3mBZdOV2iV66I6bgDoCogmSWWXF2sSCWFrlTdSPVTMdyPRd0o2YIga66xSBybaSg/oGI+/3lt0OfIxX+7TyiGwDs26kR7Wqmt6z0cx7BtBco58iBIkiTh6R1cxxwmhjB0m/Wgg/O4kOAXNDA2zfeR74dJKa3snHszdKbK0+R7AdS+AtzA90Raw6lYhdfIEtCXJkUYklbE/3e1q7c8WYSHP3wRckhoRb6GyxNVETN1EV47qIUYE8pMrA8sON3f9rq0y6PkscC7GigtngIBPW8m64i540CG0/z83927Ew3RNcfT3czxSKQMyV/ex7caUAuLA/i5k3Nn2HgfziNZ6SetGzgFBKJx93Z7zUbvEHimDFM+ojvP0bBXTAyTGC5qEXwXLSJfFh3PDMbu1wnEHytiw/a2MR5ZFIvfH+GsJvwdnVmjDVPyaJ1apMLBZlKKNnWCFqgmSWodUBqNUjDvUFx1z002WyfL7ZOaVXAQM8hgA5YuQ1eUiXaYzbdymunxBhtbYkNHw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(376002)(136003)(366004)(396003)(38100700002)(66476007)(66946007)(316002)(8936002)(31696002)(36756003)(6916009)(66556008)(8676002)(5660300002)(54906003)(16576012)(31686004)(478600001)(86362001)(2906002)(53546011)(26005)(186003)(6486002)(4326008)(956004)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y7guap8YjqQXZsDHt7FzG+pd3pJB/bIkHLb+R0Hrh7f86rg+03WVwicywtWM?=
 =?us-ascii?Q?VYcXFTidtsZHuTVCVv6MrQt/MyxvZhjkK4aNuzbQiSJSGkI4003z6cuNjcji?=
 =?us-ascii?Q?N+nxHMW6wUxmrNsIxodlR7ysK1p1On2hrH2gCK3Mlizjwjwin+f8I2c69fIS?=
 =?us-ascii?Q?D6gt/SkWy7O1gGtQb++FaC6YcjjKSPwYXDGIJir1R+QqJvbpyWXHTxs91pkm?=
 =?us-ascii?Q?CCqinxKRzfoqOq99DjOJNhwi2SFgV8YcRqCk+n6p6/caT2DWYHalNza7+xrN?=
 =?us-ascii?Q?aD/5huqEqSjiaA5VN9pcNZQXI4PzSmqdOQEeginUiwMeXO33Fy1wkdR2ZLpU?=
 =?us-ascii?Q?TlKY05NzMIWvyA1Hf5rxzxGmDQsWtpefAQZ6LtvGGO65hp3tZ+kWs5BbBhuk?=
 =?us-ascii?Q?DFt60DaM54qvijVoPECquPsdQch3CWDw2w6Vhh30KHAZDrKuHL+e/ti9o82I?=
 =?us-ascii?Q?a6UDGWh8xQcMU8hd7WL2XRec4/Hizt7b9VvJJPTm1QCgaIi8cMY7wfb0OKFw?=
 =?us-ascii?Q?IQKahR/ylRu9v7NP2gzUeQEmMHSwrdAQGR7Wf/ewLBS50POrJ3NEl7OVa4qr?=
 =?us-ascii?Q?vga6QP6ReQBGLFmaiDRzmhAoZfHSelfArUlpIB7bYaaFKEqXejT3F2VmANtt?=
 =?us-ascii?Q?zXWMb6Js9vYNhASMI2EuhMnG1NcpcWP8SJWq7HeNhunddgi9mWrwpfyiZPcd?=
 =?us-ascii?Q?m6Xwx88bhsIDghZPSmEx9KJN8bFuYaqBlHwOiWXlyFvNzb/ZAslB1SGNoKxk?=
 =?us-ascii?Q?ZYfVsfZNZoMU376MMGyJdc/tK4CzY17UV88nwm0aBZDi5vtnr1LEjpX3XK7t?=
 =?us-ascii?Q?cC5DhFdVwScl2rMeY0KgJDOK4baeYe7Bt0Cg6ye48mj8DMRcYPfhotKOqMvc?=
 =?us-ascii?Q?GLoKzNP/Zd0DU5M1Q14t43kPEWN6D8D5C7pKhgAKQCHCu/HltyvxHzRI1m4t?=
 =?us-ascii?Q?j60gXEcs+DkqaKMmx6mbdF9LF6J6P4Xh2uM6Acf2smr5eKrNbNql4lunhDEr?=
 =?us-ascii?Q?LJuRqQBkQisDw1H83Bcc5DK0exUsYY1qPV0XFmQaz+cahoLtik3tmJKsbg0m?=
 =?us-ascii?Q?xfP8g5EkNQyE+VNtoyL9QoiMkgJISbB5YQe5nmiGrcz87EOFjNgKVvmvQlv2?=
 =?us-ascii?Q?o0h3+ZZL41Wt3p6LoCToTqw32MRNALdBxAioDStnJ8p35gdqeG4S/SFzP/n6?=
 =?us-ascii?Q?acSZFQ0+TZkx4hHYJDAUgXVsdxad8aloEf7Ls7vm4hRpPhTxgrTRUhhcySHh?=
 =?us-ascii?Q?N2ktEwz/DI1dioOMk6+FKIZP+ZhrwlK/jj+Fy+ekjX442jRWyfPZnBI+mrYE?=
 =?us-ascii?Q?ciXtS3ltCqH1Bwz8hsKjLwZ7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8dac602-16aa-48d1-26ab-08d96ddb3817
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:30:55.7351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +SVbiIU2qnU9407pjy+3OtFTPIRZSO9Hbbf9tuCpzJ1MD/+lWvgJMG6uazJdtA5WcxX3w7ShMtfFjLxtjYxKEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 01.09.2021 18:13, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 01, 2021 at 04:19:40PM +0200, Jan Beulich wrote:
>> On 01.09.2021 15:56, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Aug 31, 2021 at 10:53:59AM +0200, Jan Beulich wrote:
>>>> On 30.08.2021 15:01, Jan Beulich wrote:
>>>>> The code building PVH Dom0 made use of sequences of P2M changes
>>>>> which are disallowed as of XSA-378. First of all population of the
>>>>> first Mb of memory needs to be redone. Then, largely as a
>>>>> workaround, checking introduced by XSA-378 needs to be slightly
>>>>> relaxed.
>>>>>
>>>>> Note that with these adjustments I get Dom0 to start booting on my
>>>>> development system, but the Dom0 kernel then gets stuck. Since it
>>>>> was the first time for me to try PVH Dom0 in this context (see
>>>>> below for why I was hesitant), I cannot tell yet whether this is
>>>>> due further fallout from the XSA, or some further unrelated
>>>>> problem.
>>>
>>> Iff you have some time could you check without the XSA applied? I have
>>> to admit I haven't been testing staging, so it's possible some
>>> breakage as slipped in (however osstest seemed fine with it).
>>
>> Well, I'd rather try to use the time to find the actual issue. From
>> osstest being fine I'm kind of inferring this might be machine
>> specific, or this might be due to yet some other of the overly many
>> patches I'm carrying. So if I can't infer anything from the stack
>> once I can actually dump that, I may indeed need to bisect my pile,
>> which would then also include the XSA-378 patches (as I didn't have
>> time to re-base so far).
>>
>>>>> Dom0's BSP is in VPF_blocked state while all APs are
>>>>> still in VPF_down. The 'd' debug key, unhelpfully, doesn't produce
>>>>> any output, so it's non-trivial to check whether (like PV likes to
>>>>> do) Dom0 has panic()ed without leaving any (visible) output.
>>>
>>> Not sure it would help much, but maybe you can post the Xen+Linux
>>> output?
>>
>> There's no Linux output yet by that point (and either
>> "earlyprintk=3Dxen" doesn't work in PVH mode, or it's even too early
>> for that). All Xen has to say is
>>
>> (XEN) Dom0 callback via changed to Direct Vector 0xf3
>> (XEN) vmx.c:3265:d0v0 RDMSR 0x0000064e unimplemented
>> (XEN) vmx.c:3265:d0v0 RDMSR 0x00000034 unimplemented
>=20
> Weird, I don't see why earlyprintk=3Dxen shouldn't work in PVH mode,
> unless it's not properly wired up. Certainly needs checking and
> fixing, or else we won't be able to make much progress I think.

Right - I'm intending to check this, including whether at least
xen_raw_console_write() would work.

>>>> Correction: I did mean '0' here, producing merely
>>>>
>>>> (XEN) '0' pressed -> dumping Dom0's registers
>>>> (XEN) *** Dumping Dom0 vcpu#0 state: ***
>>>> (XEN) *** Dumping Dom0 vcpu#1 state: ***
>>>> (XEN) *** Dumping Dom0 vcpu#2 state: ***
>>>> (XEN) *** Dumping Dom0 vcpu#3 state: ***
>>>>
>>>> 'd' output supports the "system is idle" that was also visible from
>>>> 'q' output.
>>>
>>> Can you dump the state of the VMCS and see where the IP points to in
>>> Linux?
>>
>> Both that and the register dumping I have meanwhile working tell
>> me that it's the HLT in default_idle(). IOW Dom0 gives the impression
>> of also being idle, at the first glance. The stack pointer, however,
>> is farther away from the stack top than I would have expected, so it
>> may still have entered default_idle() for other reasons.
>>
>> The VMCS also told me that the last VM entry was to deliver an
>> interrupt at vector 0xf3 (i.e. the "callback" one).
>=20
> That's all quite weird. Did dom0 setup the vCPU timer?

Ah - I had meant to check active timers, but then forgot. Otoh I
thought I could observe vCPU0 waking up from HLT, as RIP in the
registers dumped has been pointing either at it or right past it.
Now that I write this I'm wondering though whether that's an
artifact rather than reflection of something that's really
happening, in particular because of this

(XEN) RSP =3D 0xffffffff81c03eb8 (0xffffffff81c03eb8)  RIP =3D 0xffffffff81=
4be422 (0xffffffff814be423)

in the VMCS dump.

> What version of Linux are you using?

5.13.2; didn't get around to switching to 5.14 yet, but I also don't
expect this to make a difference.

> It seems to get stuck very early (or either fail to output anything
> while booting), which seems unlikely to be related to your specific
> hardware.

Well, it can't be extremely early - I see the ACPI IRQ getting set
up (from "iommu=3Ddebug" output mentioning GSI 9), and I see PCI
device BARs being played with (from debug messages I had added to
vPCI to monitor what P2M adjustments are being requested). As said
on another sub-thread, I get all the way through start_kernel()
and rest_init(), just that apparently some of the steps don't do
what they're supposed to do.

I'm meanwhile wondering whether I'm using a badly configured
kernel, i.e. whether there are any Kconfig settings which I ought
to enable, but which aren't "select"-ed nor have proper
"depends on". What I did is simply take my XEN_PV=3Dy config,
replacing that by XEN_PVH=3Dy. I did observe that this let XEN_DOM0
go off, but according to my checking (at the time) nothing this
crucial should have been affected by that.

Jan


