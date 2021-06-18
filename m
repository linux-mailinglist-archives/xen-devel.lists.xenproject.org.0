Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B4E3ACB45
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 14:44:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144587.266105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDrE-0001Ta-AK; Fri, 18 Jun 2021 12:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144587.266105; Fri, 18 Jun 2021 12:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDrE-0001QT-5k; Fri, 18 Jun 2021 12:44:24 +0000
Received: by outflank-mailman (input) for mailman id 144587;
 Fri, 18 Jun 2021 12:44:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luDrC-0001QN-Qr
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 12:44:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8727e7cd-0264-4c37-96c7-4d095758c3b0;
 Fri, 18 Jun 2021 12:44:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-jRA-za6aNlyfxcmLDSiKvw-1; Fri, 18 Jun 2021 14:44:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 12:44:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 12:44:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0055.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Fri, 18 Jun 2021 12:44:15 +0000
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
X-Inumbo-ID: 8727e7cd-0264-4c37-96c7-4d095758c3b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624020261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/mW6XaXlrz46hEoXTQUSSJn/47iAlwcv40H2df6zDo=;
	b=HXpvoocEjKNovYH1V9rhjFzEdNBCI4lmYbqUQN1bska35DZVjNUtUYsvVpz3EDpDc7KvQh
	n9k4iTtrpGdglGmi8scebCv72F9rMClCeXqrW1tJtDkEwAJbIdf4vlBvggSQsxwT8vmC5O
	AAwHD368UC5kASaGHD3sjVmm5qHEjVU=
X-MC-Unique: jRA-za6aNlyfxcmLDSiKvw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vmop0yTHjavv63E6Fh810qWNRblOAjNGGwx+moMow2Y6pJLkFa+Dv3B0ML8tAb+jfG2xdDJpMP43JIPQZ/3stqxSSjw9Md+uGwDJ9Qq4Ij6TGk/Wyh8YHSNiSug51vDQTa6wLyO/DKKvvlhEoi1v6YdVvU7jY4LWffY9Bp6xi4bu1DIm6JnrfCg3RpZbW1TCeNR8Jz6KsMbGYT2qUon2Oc31+5alwRWpmXNRFVp6Ib1TYYuWBwXiwmjDnY96AXn3GiMW/Kd3Eq6Z9A7VrgyPpK7D4Zag8MzQyLR6mLS8CuUNBdgVC5wzUUhLg2x6zE6n+paFzHzj0jvd/pgaCaLH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASupVSc59AbXSKKOvmTCbTLNYCTi1P5RmZ+rCbaMqOg=;
 b=CgsEvwBbVSjdZfCnm58OX9sOM+KREHTReixCbol3/e7c1AHw9TMOUqMNyVC9t86yeyR+9E3A6ntro6P4RkMrJKH2E/gEZ5Wed1sk98RP8lNANzACts+JfApNZMBMz7ki4bYA6pbMEp8SSEGU4zWBQq0A7K9/lzeubQ0qflXlgConPhOPqSesX9vxMSXr066yztueumlIFPrDTOpjA2xtqqID9EQmcHI+4ru5zi9cSSHjC9kFBFRg9o0daxcRMZz3SSYB2kfDanLmMaKVTzB2e6BZ8Kh9yNr1mlCA59UnOmBbDaJSn8BOw94Dj9eomYM5Us1iIL8q45xGy6Vd9Y1/4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 5/6] xsm: expanding function related macros in dummy.h
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-6-dpsmith@apertussolutions.com>
 <42e3d58a-edf3-1da9-af6e-c2400f25365c@citrix.com>
 <60894a2d-0977-18e7-75d3-726695dd06eb@suse.com>
Message-ID: <e6d0eb00-b2ad-15ae-e9cb-65716779d960@suse.com>
Date: Fri, 18 Jun 2021 14:44:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <60894a2d-0977-18e7-75d3-726695dd06eb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0055.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1cbd86c-74da-48c1-a6d9-08d93256c8da
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2702468EDB56B4BA46FAEC99B30D9@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JqZP1xa/x4FJ1GNgt5MF4HZV+q0yYsxm6+U122+Du4+5hblFi52f9vu9bVpuxIj1SkPgL9C5Y804bkgUPbyVDm65n8V4Jkrj51nsW/N7S+q+unG5YPPLKw0+c/wL7SZymQG3jxyfOeJA+TS8X5i3dUfAH3Xe9DTj6LclIM9bs2BHdS4z2KAhdFyDWSiB7cXoE9nbjtp+fSk3i2NFTf/a7uzhJDV+X8hTDEmzq3/t9Vje+ROa2Oc6HiXj/VR68Hy0Fy431ylOmmApPONkkpoqa/ocnVYys1PvyGjuIEZxg09MZ1jEuJ7Xt1xYVy/w2xwaR/9lMm+2OAoeg2kXz7DbC3PB8MJE/fRX/LT96FNJM7DZuPTk1OPYlM78obqvfdD/FdXaw9yW35JixSDoE9zjHugELlqlI40UYSrilb60EAeDNJ3pOFzSEDQ510cSZr9RC1upaSe7A/QZkGs6zMjYI6KYky36DyXtqk+gh9wa2fgPhd5/oT/B1RTKJWFmRHHURo8GqzpCqdFVKzB0LS/hizcPJVkv9LV382HAqx+CyCLvMO3I+V7vGH7wnqfGKtwUcMeyVgslIP81Cfcx/0AOwDyVMAYmja9OV8WZFacwqYuviZibXyQ9UQPS/oNoemlBCUdLohhfBT3as9cJLm6kFf3NIeDSSvZUTYn7Gafe3pOuhkTFv+HCMrXIwJd3NDnC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(39850400004)(376002)(396003)(346002)(2616005)(956004)(7416002)(6486002)(83380400001)(66556008)(316002)(26005)(186003)(66476007)(54906003)(66946007)(16576012)(4326008)(2906002)(8936002)(8676002)(31686004)(86362001)(31696002)(16526019)(53546011)(5660300002)(38100700002)(36756003)(478600001)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tLwBuLQ/2a1GIrLh1ASDqA8Lbr463YwXh8dx5tMvR/4ZetNxOGREuFu6tIOc?=
 =?us-ascii?Q?iAU8nl+qRbE8FiRvJ5WShJ86G3zoC5xyrxO05BNvDWOTVnXSI1Hlfko9g8uQ?=
 =?us-ascii?Q?S5Unah1RmyB5qs5HT0MUmfsSnLRGJ4yIX/B1xHEdwcZivn4L2ertG0FZH03H?=
 =?us-ascii?Q?8iXyv58d3ZLnuWaVlMcReZMG+fNqCPXB9Hz74Z3K74iWbggMBV233pr/vaNp?=
 =?us-ascii?Q?/Zi3UnxuGxjvt/YbWzgHzoo8gfHU9yvoBBeKcX3d4V62IZySpgq4VuHQm+Xx?=
 =?us-ascii?Q?ONjyWhOY4JpvKtQOZdtnQbBk0XmXJSLC9/RfA5zcukFRWgWA2UXyO5EXnurL?=
 =?us-ascii?Q?e12GICZ8MDAz89pg2Orii0Gu64Yl11Lbge49SvGQF2JhvXhSpZT0RYxIk8s+?=
 =?us-ascii?Q?06UDK6qheC0aJOuP9pELebo6YriA9P49zZcV+IFt2tDosmRiEVzXIMDYRKmW?=
 =?us-ascii?Q?vgHtULBB2oEjUCsLlUYhBxebfLpxtMWkkscQkZm4RFtupXnBkEsGRkg0kr8X?=
 =?us-ascii?Q?ZgwFSapevC8qj0Mu0B3rs5ObxfNzSwideeJwYHM6YrKH7kh/i9LhS1yNM8sv?=
 =?us-ascii?Q?bUxcRUbNe8fnxwo3/KS4tbIcAuYSqV5TFY9TLU/m8WnMhN6rZ+E0/cE8qk3R?=
 =?us-ascii?Q?0Vb5RqyyFnGqWx8nq2cvU6UNSaa1m26VGpdo8cTWxn2sb8r3HHNdYfjUq4Zg?=
 =?us-ascii?Q?NLGf3lAzQyHMUwFCmUd8D2swCNP4x5vZJxgloldteia+4aK0AooiCAYPkbyK?=
 =?us-ascii?Q?2fZDQUaMu7buXpsGgi2Yk4KfhXRzO5OT35mLuC91Jf3m4LYc3iIGIAQHJz3T?=
 =?us-ascii?Q?uceJSVcqIAfMCNxujJ1WjMvgReqIXNsEYnFGfL1yBKaJrpuIOcdBntyGQ0G1?=
 =?us-ascii?Q?aRRlUnMFqtb1U6BXNIhWFX2lEk9qvp31QoHiBZIOeMrhV3KMIoa5SkuhQPg9?=
 =?us-ascii?Q?p5ZoAU0rxgpgfWhTiYDnb1HGkJG1GXfbrgjxlKxIpE06K8tgQWRGWntt7J17?=
 =?us-ascii?Q?piesdcvr+nts2Si1/YzpXrUsfTVzIDho3owaDXg+mFfSjwDRXDAxsypWWLfJ?=
 =?us-ascii?Q?7gwrTv7vx0RvCD9Sh3g23Q8uMp9ds1TyKNGzj/VTkVMYqfEKTXiwiAqs4XfB?=
 =?us-ascii?Q?GD9TlhBEDGXdcT598YmdqzPFMTJ1SFUFioCPsodqmiMNnylKUS0sF3tDaMLm?=
 =?us-ascii?Q?s6xvLdQX+xe3pm3vwvoQndPVm7PcmooX5uyqq5o9jh1mGQrd1oJqlV07ifft?=
 =?us-ascii?Q?S5pw+pcAiJdziQMl6NhB25Bt0Fm+iLzMVLYQjXKL78Mo4jRV2DQbVb3M6ezk?=
 =?us-ascii?Q?2PRIEdLOqgIIlIwmoXDs17RM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cbd86c-74da-48c1-a6d9-08d93256c8da
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 12:44:16.9863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxBzO3qdzIeZ2K0Ma92yDStMwU/xRksmFConaHTtI4fT430mijUBONpeYpY/u5rxqWk5VMaldlvHdgjMp96cgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 18.06.2021 14:40, Jan Beulich wrote:
> On 18.06.2021 14:03, Andrew Cooper wrote:
>> On 18/06/2021 00:39, Daniel P. Smith wrote:
>>> diff --git a/xen/xsm/dummy.h b/xen/xsm/dummy.h
>>> index 7e2bb09dac..0f8ea163af 100644
>>> --- a/xen/xsm/dummy.h
>>> +++ b/xen/xsm/dummy.h
>>> @@ -9,7 +9,7 @@
>>>   *
>>>   *
>>>   *  Each XSM hook implementing an access check should have its first p=
arameter
>>> - *  preceded by XSM_DEFAULT_ARG (or use XSM_DEFAULT_VOID if it has no
>>> + *  preceded by (or use XSM_DEFAULT_VOID if it has no
>>>   *  arguments). The first non-declaration statement shold be XSM_ASSER=
T_ACTION
>>>   *  with the expected type of the hook, which will either define or ch=
eck the
>>>   *  value of action.
>>> @@ -47,14 +47,12 @@ void __xsm_action_mismatch_detected(void);
>>>   * xsm_default_t argument available, so the value from the assertion i=
s used to
>>>   * initialize the variable.
>>>   */
>>> -#define XSM_INLINE __maybe_unused
>>
>> Nothing in a header file should ever need __maybe_unused.=C2=A0 Now that=
 the
>> !XSM case has been untangled, I think this can be dropped, rather than
>> expanded inline.
>>
>>> -
>>> -#define XSM_DEFAULT_ARG /* */
>>>  #define XSM_DEFAULT_VOID void
>>
>> XSM_DEFAULT_VOID needs to disappear too.=C2=A0 I can't see what it is ev=
en
>> doing before the cleanup, because if it is missing, you'll fail the
>> compile for using K&R style functions.
>=20
> You need to look at the state before patch 3 to see its purpose. Patch 3
> removed the other variant, and hence the need for this one as well, but
> I think it is reasonable to not clean up everything in one go (unless
> it would mean touching exactly the same code a 2nd time later on).

Albeit, having looked at the patch itself, I agree it should be dropped
here together with XSM_DEFAULT_ARG, of which it is (was) a companion.
But again, all provided there is agreement to remove the top level XSM
option, which I personally don't think is a good idea.

Jan


