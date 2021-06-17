Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AD03AB318
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 13:57:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143904.265029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltqdR-00057E-So; Thu, 17 Jun 2021 11:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143904.265029; Thu, 17 Jun 2021 11:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltqdR-000551-PY; Thu, 17 Jun 2021 11:56:37 +0000
Received: by outflank-mailman (input) for mailman id 143904;
 Thu, 17 Jun 2021 11:56:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k/hY=LL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltqdQ-00054v-Uc
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 11:56:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2a2138e-51af-41c6-80a7-3a8d838620ac;
 Thu, 17 Jun 2021 11:56:35 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-XEI3itAjM0aPmSpGkxDi-g-1; Thu, 17 Jun 2021 13:56:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 17 Jun
 2021 11:56:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 11:56:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0071.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 11:56:31 +0000
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
X-Inumbo-ID: c2a2138e-51af-41c6-80a7-3a8d838620ac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623930994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=um14gXO2sX6Dt04QMAVSzkqQaCjkiZkC0fzkNiCbe70=;
	b=SVlVAeXdoCvNbxKWVa7JeYF9sQjDGJP4JTaFDfmvQY8nxKGCadTC4iT3wxnweAyFrY8ah4
	etNyIEPQXMz/wkFpCFeI3u5J2Bka3T+u2VZNi7kgiy/2e1Q6OcBN5Cvf4zYHZYN/2jozHV
	eLAK8+sEBlWEYmemVSP9ikqS4cwYgs4=
X-MC-Unique: XEI3itAjM0aPmSpGkxDi-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DG+5xt692pjn7BjBlLqPZ6SILRmN1nGDJGjPdVKre7OMNwhCWfZaUj7OOHnJzX28RQqKse2mSH9Qp/GNJy8sbuHw/uJgZOL9qt/tGkK83vwMRyDjC44zPA1tF0mdlbM43fA/thmgoVBl33S7HR46OEnNW42drMQ1vA7VzdIlbZWud02H6DpcTuVttyLAo4s/W2UTA7Zjpy63kay9n5LKGBvLt+1efun+Qz9eAPPH4e7fnQW238anLsgTg8lMhmv4f5enZE8U7De1sRezVS2BiQRttd7WLN2elZ/iEOiwbXuu2d3CDAsdmRpomp9Oa0mCarG4kFuc/+2aAHJvb/91jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aaQA8KNCkXZiPBW7WjoCJ0rMpVDOJvdPF2AbAm77Cs=;
 b=Nr0dhYkvkrbYVDUussRWX12WcvYJGriIoKgHqEZLE0YlObFrMF8uNd7/5jYKs+iBh4zB4ucCN7rfFo2D3pi+m0HTKbbxVy96x72YjxT688BvNJrlhx5ViUqGEHxbj2OQO+Js5eZet3wB4T2pLUeXDf66DeQCb6v1wk0KeCkY5GqIszu5yX8k5Ns03tsr8q8+ipVlqHy8kKP/s9wPiztdHSipC7C3x7Q9E7wWMpuqNrO2ATsd+/O5gD0tPrnnx98skmxDHW11MGInDnFIVv0c7wAHT+nsfX+2e1jdEzyl18ns4267UueCgbE0jhaveqvTmiCVq4jWpUpEWwrrEBM39w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions -
 FAIL
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, "committers@xenproject.org"
 <committers@xenproject.org>
References: <osstest-161917-mainreport@xen.org>
 <7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com>
 <b57c2120-2f86-caa7-56ec-e215a7ad0529@suse.com>
 <637ff3c7-afeb-aae4-0f1d-5ae168e01e01@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <99833b7b-f626-fac5-d426-109afd4ffa38@suse.com>
Date: Thu, 17 Jun 2021 13:56:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <637ff3c7-afeb-aae4-0f1d-5ae168e01e01@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR10CA0071.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 812f0bba-8563-4143-011b-08d93186f2c1
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039A8449BFF32FD57C61717B30E9@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zInSRfW64XmbVARMWd3gv+s9AVai2aSfTqBAgu4LRv0eJ7+OtKwYyGL3ebAye5tiLwz/TXesXxXW3EuV8igZFSV9T3N3X6wnz5IMG+/OT57OS4eOVXKfJJ1XXdP6TQnOgAIjict3adBCC2ufxjpR22/CwwThYjaIn8dK2uF/h8Cp96AEiSZZTK4tKPj8kXZ4gqs39cky4UUhpi6ovT+b7F2Wi3OsB7ywTCCbxPUVqF0e+KwkeXrsqDpXCZxl60EI8spCBnAd+xmGVx1Kch2gK8HAU7I6d9NVuSup7QDkQGZCMaMSuIinq7npZtWJ4TpbdtpQo6/7lAOugDFv3oX7+NNacTsrTsKCKnRAa8E2uNva74uVP0n1oWGTR+A9dyo5CCLGb3lJcaC6OOJCWDFgmcP1xWZE77iUq3s6VoPEoEio3Bfwxzn7c/G6V44cCCbIlLfa/g9IuPO4xVZuIs5+r/r6iLU9BYTw6yztvhS8icjXnnXkk2WR3Rf9LmLGzhg1fpy0U/ZbwKnYifWQIso/iNymDCWRPxowNe47fWFi3iBEgH7g4/0HIm3s/lr5/vjC6UvEUCtUuq7b+K3U8zhPSyv7YV2Cu1M4yKQgIQXqzKzs2leSOp6A9oEjPinqgcBznG+6Zb9gJnRcR6R+Rx4P89Gg6yblWYXOZiyBkgPOvUR019eDrMzy0YmiqMbm9laIhcYeP9c5wcYaLY9/vGAxL/jL5xKOgpS7tvxyBCjn36zfvdykbFZXMwJuNOO5Up3bL9n1sHXSCb78g1a3h6WC8bpTWmhOVYQtDum+byr643O7beJas1ONUT+GMvh5ZfJ4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(366004)(136003)(39850400004)(2906002)(38100700002)(86362001)(36756003)(316002)(966005)(31686004)(6916009)(26005)(8936002)(186003)(16526019)(478600001)(8676002)(6486002)(83380400001)(66946007)(4326008)(16576012)(956004)(31696002)(66556008)(53546011)(66476007)(5660300002)(54906003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BsGp0SESpjGTSa3ZOG/iOA+jKgi5DLegkW+jgDb/ftggPeWx9jQDesyZwdvN?=
 =?us-ascii?Q?PWSRjmhaav4iXzNFaMOcXOWN+h7WhYPgl0PT7/SfFntIW8bzeq1qBjD4guHG?=
 =?us-ascii?Q?FaIiHa7L00MSZyWxU2SaWJ/QwEAqgi2ucB6BX46eAWC63NvRxo2s/jkzVB+0?=
 =?us-ascii?Q?2w50esTFfsfUgG0+4FrKFTwz6xNHXS4bYHmRC7p+apYs04zlRSULu9SWtjYD?=
 =?us-ascii?Q?ONl7Dhyws7gIwWFLN5ji6nqH/mxrzI1TnJ950R1eZxbW4RZUW6grzWlzYFU5?=
 =?us-ascii?Q?HVLMReeA/+javfwtOIfjygTBsbLdcsNKIBO6nDrUohPrFlUoa+JHrdjU4Idv?=
 =?us-ascii?Q?9md/ESV9gbQ5AiE7LTCu9ECeo7zwxa9oKU+0ntlq9vljFyNgK3ppfN6dkwSj?=
 =?us-ascii?Q?HWvkJpCSsreAfWHo+q3Gpvb0NH9rESuRiMWnoTl6aFgtHp34bBnwrj5nxHJ9?=
 =?us-ascii?Q?x3Dnxi0Z6Dm+tcYu9CawWcGAo8BhwWMsqVct0vUszTLDEewVbWjxs1wt5aaV?=
 =?us-ascii?Q?GZyo27baMxWp1XQuuxSm63bFkYn3R9Rzxod2vkGoQcygoW7Ltn7XvLA+L3GF?=
 =?us-ascii?Q?xLbHhDl31+AbL1yr6rYEZGvNz44u7bC7I2wEkP9hoRDLBavB4+9TyP4NEVoa?=
 =?us-ascii?Q?JX5EW6rMpQedM7X0BtBJrE2Mql25RJ5LUIK3Lc+6TkHhKQ6UhEamc7D0MUFc?=
 =?us-ascii?Q?nTivP7Txq0jd/zrJezwuJz/+v5Xk/dXg66MQqRseo41LUR+LXksqlINnlPum?=
 =?us-ascii?Q?GV+KO3Hrx1SbItOzssKJeZZyHB8uix7Y3ZFXE9Uf4t6TbkxUsi5yLSi48SUj?=
 =?us-ascii?Q?l5atTPKggRVufPt2W36beDLGTrEcdDyzKVhF4YNC0jWm2DGFtJWHpjk9bQw1?=
 =?us-ascii?Q?/Gx5aWmRmIj0mPXKuTmVePwD6cuzqs4l2YHDLMeuYmZ4YHq05cGgApAGSfkO?=
 =?us-ascii?Q?38YJaDtpLiiICSPNv8FiyKTLeC8mwfcN3jSLeUIQW3tqroDvJXxh6r19i7B9?=
 =?us-ascii?Q?NP2Q27w1iCAI/5Z7pjwt7Q+zQI6Ppou/kB653CJehgsdtunrlhUAlCScM33b?=
 =?us-ascii?Q?C+p2aUCs4DX85wkt4qxckvReCSOfNxXnnL3s8u7+HCynfJfmNEhsOA9AJagR?=
 =?us-ascii?Q?eAbVSwx5j1wC9Y3o4RLK6HYyvqapGlQpadQgnD5uQoLAX8wibFLjtDpbO09P?=
 =?us-ascii?Q?J/7cZUKN9Nq1XgRTLsx+9Iev2e4bv9vXyKDmxjzBiIxK+srV6SQISHcNw5yf?=
 =?us-ascii?Q?exm7Xvdlkmp45lcxQtLRdI/lvSZTLfjkb2XiqN9X5K0M9nYSDprd4kaiLVAM?=
 =?us-ascii?Q?d4b9s8a4oNrATsrwyXyNQi+Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812f0bba-8563-4143-011b-08d93186f2c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 11:56:31.8549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGZxbmcVHhqEum97uXAzZQ2OnFpkL8QdCqSQ8LCBPW0TY2hDpCUNp1RYS7s6X64VGC/otUFnh7MCnTKhRx5Pyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 16.06.2021 17:43, Andrew Cooper wrote:
> On 16/06/2021 09:48, Jan Beulich wrote:
>> On 13.05.2021 22:15, Andrew Cooper wrote:
>>> On 13/05/2021 04:56, osstest service owner wrote:
>>>> flight 161917 xen-unstable real [real]
>>>> http://logs.test-lab.xenproject.org/osstest/logs/161917/
>>>>
>>>> Regressions :-(
>>>>
>>>> Tests which did not succeed and are blocking,
>>>> including tests which could not be run:
>>>>  test-arm64-arm64-examine      8 reboot                   fail REGR. v=
s. 161898
>>>>  test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. v=
s. 161898
>>>>  test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. v=
s. 161898
>>>>  test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. v=
s. 161898
>>>>  test-arm64-arm64-xl           8 xen-boot                 fail REGR. v=
s. 161898
>>> I reported these on IRC, and Julien/Stefano have already committed a fi=
x.
>>>
>>>> Tests which are failing intermittently (not blocking):
>>>>  test-xtf-amd64-amd64-3 92 xtf/test-pv32pae-xsa-286 fail in 161909 pas=
s in 161917
>>> While noticing the ARM issue above, I also spotted this one by chance.=
=C2=A0
>>> There are two issues.
>>>
>>> First, I have reverted bed7e6cad30 and edcfce55917.=C2=A0 The XTF test =
is
>>> correct, and they really do reintroduce XSA-286.=C2=A0 It is a miracle =
of
>>> timing that we don't need an XSA/CVE against Xen 4.15.
>> As expressed at the time already, I view this reverting you did, without
>> there being any emergency and without you having gathered any acks or
>> allowed for objections, as overstepping your competencies. I did post a
>> patch to the XTF test, which I believe is wrong, without having had any
>> feedback there either. Unless I hear back by the end of this week with
>> substantial arguments of why I am wrong (which would need to also cover
>> the fact that an issue was found with 32-bit PAE only, in turn supportin=
g
>> my view on the overall state), I intend to revert your revert early next
>> week.
>=20
> It has frankly taken a while to formulate a civil reply.
>=20
> I am very irritated that you have *twice* recently introduced security
> vulnerabilities by bypassing my reviews/objections on patches.

I'm sorry, Andrew, but already in my original reply a month ago I did
express that I couldn't find any record of you having objected to the
changes. It doesn't help that you claim you've objected when you
really didn't (which is the impression I get from not finding anything,
and which also matches my recollection of what was discussed).

I don't think I know which 2nd instance you're referring to, and hence
I can't respond to that aspect.

> At the time, I had to drop work on an in-progress security issue to
> urgently investigate why we'd regressed upstream, and why OSSTest hadn't
> blocked it.
>=20
> I am more generally irritated that you are constantly breaking things
> which GitlabCI can tell you is broken, and that I'm having to drop work
> I'm supposed to be doing to unbreak them.

GitlabCI doesn't tell me anything just yet, unless I go actively poll
it. And as mentioned just yesterday on irc, I don't think I can easily
navigate my way through those web pages, to find breakage I may have
introduced and hence would better go fix. Unlike osstest, where I am
told what failed, and I know where to find the corresponding logs.

It's also not clear to me at all in how far GitlabCI would have
spotted the issue here, no matter whether it's caused by a hypervisor
change or the XTF test being wrong. So far I've seen GitlabCI only
spot build issues.

I'm also puzzled, to put it mildly, of your use of "constantly" here.

> In the case of this revert specifically, I did get agreement on IRC
> before reverting.

How can I know you did? You didn't even care to reply to my mail from
a month ago. And there was no reason to make an emergency out of this
and ask on irc. You could have sent mail just like is done for all
other normal bug fixes etc. Iirc I was on PTO at that time; it would
hence only have been fair to wait until my return.

> In your proposed edit to the XTF test, you say
>=20
> =C2=A0 L3 entry updates aren't specified to take immediate effect in PAE =
mode:
>=20
> but this is not accurate.=C2=A0 It's what the Intel SDM says, but is
> contradicted by the AMD APM which states that this behaviour is not true
> under NPT under any circumstance, nor is it true on native.
>=20
> Furthermore, any 32bit PV guest knowing it is running on a 64bit Xen
> (even from simply checking Xen >=3D 4.3) can rely on the relaxed
> behaviour, irrespective of what the unwritten PV ABI might want to say
> on the matter, due to knowing that it is running on Long mode paging as
> opposed to legacy PAE paging.

Neither of these are reasons for a 32-bit guest to _rely_ on such
behavior. Hence the change to the XTF test, which so far you also
didn't care to reply to.

I'm aware of NPT having different behavior, but can you point me to
the place in AMD doc saying so also for native? In fact I can find a
statement to the contrary:

"The behavior of PAE mode in a nested-paging guest differs slightly
 from the behavior of (host-only) legacy PAE mode, in that the
 guest=E2=80=99s four PDPEs are not loaded into the processor at the time
 CR3 is written. Instead, the PDPEs are accessed on demand as part
 of a table walk."

This to me implies that in the native case the behavior matches
Intel's.

> If these two technical reasons aren't good enough, then consider the
> manifestation of the issue itself.=C2=A0 XSA-286 is specifically about Xe=
n
> editing the wrong PTE, because of the use of linear pagetables, in light
> of the guest not flushing the TLB.

The PTE edited is, as said, only perceived wrong by the XTF test.
Hence the patch to correct it.

> If you were to remove linear pagetables from Xen, the issue
> (do_mmu_update() edits the wrong PTE) would cease to manifest even on
> legacy PAE paging, demonstrating that the problem is with Xen's actions,
> not with the guests.

And if I introduced shadowing of the L3E writes, pushing the new ones
into the live page tables only upon CR3 writes, the issue would
reappear. It ought to be permissible to make such a change to Xen,
even if we may have no specific reason to do so at this point (albeit
I think we really better would, to match bare metal behavior).

Also, in my request to you (still in context above) I did specifically
ask about the aspect of the observed issue only manifesting on 32-bit,
yet you claiming a general problem, i.e. also affecting 64-bit. You
didn't comment on this at all.

Jan


