Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7834A96D1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 10:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265282.458616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuvl-00024g-S3; Fri, 04 Feb 2022 09:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265282.458616; Fri, 04 Feb 2022 09:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuvl-00021d-OZ; Fri, 04 Feb 2022 09:31:01 +0000
Received: by outflank-mailman (input) for mailman id 265282;
 Fri, 04 Feb 2022 09:31:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFuvk-00021W-Ut
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 09:31:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29822008-859d-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 10:30:59 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-HPTJxufcMieHaILKS5MCdg-1; Fri, 04 Feb 2022 10:30:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6599.eurprd04.prod.outlook.com (2603:10a6:20b:fd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 09:30:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 09:30:57 +0000
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
X-Inumbo-ID: 29822008-859d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643967059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Khn6hnq2Hol+n38MHbxQhdXOt2gteuWM+u+3PdxRfg=;
	b=FmytVPgRpEZ7LxswW2HmozsI0rFKhQxJdRJ5lWxxvrqf1d/b+K3XwwxbtyLVdJGrC90x96
	wVj1AOo5G+sDrnLcxw20eHqQZVuXVIHsaE5S2TYblqUICeaaQ+HWQFYRFW/5IV5/j2Ngpk
	zZYMG/gtG/jGIIsbEUyYmyOqzMpiEao=
X-MC-Unique: HPTJxufcMieHaILKS5MCdg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aY4moSW6kHoJqNFfYtAZUTZLCyqtxqVLUPVde6w/kpOct7S2M4wl8YlhT9Q3kbjlUcwQKbQZ57Rdz8DU6sbQMz5KMEmwB1V7JH5ppjw3sQTZqajKMy0PgQtYuE7iZSDWb87UI1C5oUp1YM/5zYZzacwoD3anRPw7EY8Eu7F8FhpABt9wB3K4UougJZ0OpxrCIf5lolG3U3f38yiDXcbclXyuYjTLfDVNC0sKe4AVcWXr6YPIt7LmaZJJsdjw8ZNe9mBaDYhK1u7dVcachLz4txW/rdAy/trVyMgB23VTK202bsldiN3WTThvO8RzOYtUBE8+E9uHzhaEiaO3I0w0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lC1+Etl5uloA3kYhRGGmhTdw4b62+/IvKRf+q3AOnyc=;
 b=ehvqS0yeuPNuT34yyB3Wo76xCcHZ3Is9DUonJKCFFfxC2h0YhyOYEki4jbD0UgH6jh0QFkRGIscP1LIdmaWVk2KTYOx9MnljEogOpoyn1eUoQC7YA4cuyLt/I9rTo6KnjCCCcMVGP1NAFgVX7Ol1zsrhhAV5rKTHi+Dq4ISKghfmj/1fHjFS1u7aMjyp78/6E1ZXx5VaKnuT2eDCt1+YC84ipnDZEErK7xdfasGHKuVf+bNLkSzQRKyFT8yoowf7oXQHj9HHQtbMZkP5A0/8p/dZKOY64HkR/Arp0dWn3XUg6M7pugJ47W8EhvpTsrQwV+zpVlofESgUUwE55XcpzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4ff7ca4-e728-5f5a-e569-ae42fdf17157@suse.com>
Date: Fri, 4 Feb 2022 10:30:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] x86/vmsi: add support for extended destination ID in
 address field
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220120152319.7448-1-roger.pau@citrix.com>
 <20220120152319.7448-3-roger.pau@citrix.com>
 <2e96bf2e-a31e-da9b-2f08-adfa0928e5b9@suse.com>
 <YfzwepCoIvJ3cI0v@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfzwepCoIvJ3cI0v@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:203:51::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d711acef-9d9b-4e00-e496-08d9e7c10c43
X-MS-TrafficTypeDiagnostic: AM6PR04MB6599:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6599AAFFBA49969DB59BAE99B3299@AM6PR04MB6599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KzbdMprPKr9JCmwXHCOECi10SPF6Yo0Ac22plEh7qSw3aeJkRQNB6rYgDsFxE3i4OTShwU2didSyxYaVcFQklgbWIoevzrVUBBsgBhTCcMqMM1TsrZ3RQ2un60Kxk+Of0FKLWa5HJFTe6VgDKgjujioAc8ljFxWHvYcNIEogrRzqzZqcS692aPQpyLSOWa6O9MmCoGPuxjSBwV7zk8pT7FGIOdkRS722xePaRTSb5hS7cc7KmqYxqUl3TQdiyhTzl7dYCE3wUjfRZSH5HnglDY3shjyt3I0LJPoxe5X5VYgzE2nXpQd24eAy2fWQ+23FNsZL7CPYtZXmsmgk9zc+0CDpRBv/fhtlSugaIS75yPQD61xigjZMxcd03uX+IC5i8UEs5T5B2diPOOg63LBDI6SoPq0D0gXOgT+jh8Oq+LuVUhyChkHJEIPRKlW0NudTiEkWqzZXyox8WknrlQtqiZ4QOaXZIcluKhsMA/Qoiqioa/MibWrTPG7CR92bfggr+1VWuGS7aUQ6/B6oLNpUrXJEAr6yD2O+anvjLAG9CqGLZiGuxTlfcY8bYBPELOh8vqFHBoX/XD2I2DxKFFMUIKF7AMvvEKpy5UUpnRkJc+dCJD8qGJg73DWna0C4FocDScSrbwCa6t74xWKbM4T0COVX4AEymU9TEMk/e7NLkN1jrQR3mjKOfPzQOrJAalIxxR838jrGhrP53vgZeccPDkv86v4OBQ5632sgW6cMQl0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(6506007)(31696002)(36756003)(86362001)(31686004)(53546011)(6512007)(6666004)(8936002)(66556008)(316002)(2616005)(2906002)(186003)(26005)(38100700002)(83380400001)(4326008)(8676002)(5660300002)(54906003)(6486002)(66946007)(66476007)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UGWAK/wwM//V6uem7l6mnkebBP6QKOMEw4xwVxnSDUH6PKINcxqav0/8yYol?=
 =?us-ascii?Q?ZMpNQIHhV0oIsDLriy+YPxCHYwXRFCbaMiSZni1w1r8Lk+5zgQoK8HOYIH1N?=
 =?us-ascii?Q?xMqMCyU/nIZWPPhWi4SKBazV+mJo+C/AGa+Vy4hGKY7a7JliMNrlwwVT5UZd?=
 =?us-ascii?Q?jlJnIja1dn4vJ6+hX2hAqyuTv5u3/z2f3G/p5MNB+NUFbx5nVBztV0PSMHaG?=
 =?us-ascii?Q?gWjYjK4UkUUfMklkSMU2G6oo7ifD+hy4fXlZ24FkSkLTtEimwFl6la1qL7sB?=
 =?us-ascii?Q?xvi58/yi+fCxzAR46ha3bk17G5I4p+kXbEQIOQlEfjC3pCyfpXO/EqJCTl2A?=
 =?us-ascii?Q?bOuWzuqC2eCqtovcCqzD8VMRQvRuqWc1AU1FtZJO5HvIDWNUHu9k05eqVASW?=
 =?us-ascii?Q?oZpxQexr0fpcMQPesr+C+tyqgmUAJvTpPnQ6QV/4kCwjxoW0AfFfMMMCTXZz?=
 =?us-ascii?Q?bH3nS4VUZSglsHbUuTacfQMxc7sJasge+uF4DPKaU38euXAIkJ05joaKCRdi?=
 =?us-ascii?Q?XsWthmxx4DzICu+zbd8LWYzb1C1JwMGXZq55jKMsIzUDUI0wbWL4yvyncbge?=
 =?us-ascii?Q?dclniwp59NPKBF4uocDSQv1QTMD27dFoooPqlFlEz5PXyBNaylbHttw0R1tV?=
 =?us-ascii?Q?3LSeoDU+qgOsAb2AJaxvbvtwlcSnYu62vSRZjJMWvjuO81eT688iPHUBFMsv?=
 =?us-ascii?Q?G2OVlBZ/haE8E0edJHSuP+G0L0AUjMOWTeiZ0v98d60tEQmpRxusFlOTPsL1?=
 =?us-ascii?Q?L4MnJRtx1369uzl6wylrAA184BHRZ6cMvcv3N9XBpbsyvNzXRk/ftw0XRu1t?=
 =?us-ascii?Q?LLafauzOZ4H0+IN7XEaK0KYRD4poIv7wd8XHVhD4CwSl2dWPNY2SSBcULQ1/?=
 =?us-ascii?Q?g3UR9wZz2jwkZYPgNTpEGEJz4bdarQrMsN38KU5WJREninpYQ9Zf8SkRWMYC?=
 =?us-ascii?Q?zy8/6G+Kb0brc8ngW7u1U8XHReSJiO8ZWkfEkk5TRE9RhqHt3Kc68KhSaV4r?=
 =?us-ascii?Q?imAwAqKUmrJYTWG9A//3L+TdHWhJR/ro0hAixfMZX0i6QnDWJ420UFuBMj4F?=
 =?us-ascii?Q?RshI+N1z4Yi9NEVOdsXfqgT5QplVcCCIVZ0kUUKgo/UeWBAd8rlTKsI/lHmD?=
 =?us-ascii?Q?1PqcSwr8h/+CThMomKlYJlsCSWydALqL1WI23LgKaSaCyZ0II+0pRObwVcY4?=
 =?us-ascii?Q?KQRKjpFGyo6pUtCRKeNgQ3c4OU5f/J+KXiQYlxmB3uMPwOO9m+S+OrJ4Nu/X?=
 =?us-ascii?Q?hzjLFxzy8ndVo8+MQF7FDkPVdZh/mEFT++hOfBMCzKPwc86036wxsTJLzQr4?=
 =?us-ascii?Q?5qXs/w9x3OPNQmKjXb3D7+49wzG9uQ3kii2UqxZSZTy975XMSP0q0pKN92nr?=
 =?us-ascii?Q?kNU44BiuTUEVXPGfXkn3e+o/UDDmknj5WNNO88hW9aYUcELt2N3P3enxdoEJ?=
 =?us-ascii?Q?BvLDfnWSZbYTLowmoofusBrZAwa36y4QNWhnkburEY/jRL0qz4+b4EVet1Nw?=
 =?us-ascii?Q?3yG3Ua46qTf4MPnfwWsCO3WwOV4jvxRJvq2OlM41S8dEIBorxoK5VZKPkAJ6?=
 =?us-ascii?Q?59LvGub4190XbcotdfKlNimnfdKYcww9U7LRbGdhnhPj+6pVJn4H9dpdxGGR?=
 =?us-ascii?Q?fJj47AmwuTSfKhahCqHv7RA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d711acef-9d9b-4e00-e496-08d9e7c10c43
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:30:57.1209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9cBB8FVHH2mD4wWG2q08Li/iwA4SmKCCWB1kE2xyXIfhRmxI3Aqvf0aWSOXi/TkYXG64Ad7EKmXwqyTyiTcAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6599

On 04.02.2022 10:23, Roger Pau Monn=C3=A9 wrote:
> On Mon, Jan 24, 2022 at 02:47:58PM +0100, Jan Beulich wrote:
>> On 20.01.2022 16:23, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/include/asm/msi.h
>>> +++ b/xen/arch/x86/include/asm/msi.h
>>> @@ -54,6 +54,7 @@
>>>  #define MSI_ADDR_DEST_ID_SHIFT		12
>>>  #define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
>>>  #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) &=
 MSI_ADDR_DEST_ID_MASK)
>>> +#define	 MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0
>>
>> Especially the immediately preceding macro now becomes kind of stale.
>=20
> Hm, I'm not so sure about that. We could expand the macro to place the
> high bits in dest at bits 11:4 of the resulting address. However that
> macro (MSI_ADDR_DEST_ID) is only used by Xen to compose its own
> messages, so until we add support for the hypervisor itself to use the
> extended destination ID mode there's not much point in modifying the
> macro IMO.

Well, this is all unhelpful considering the different form of extended
ID in Intel's doc. At least by way of a comment things need clarifying
and potential pitfalls need pointing out imo.

>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -588,6 +588,7 @@ struct xen_domctl_bind_pt_irq {
>>>  #define XEN_DOMCTL_VMSI_X86_DELIV_MASK   0x007000
>>>  #define XEN_DOMCTL_VMSI_X86_TRIG_MASK    0x008000
>>>  #define XEN_DOMCTL_VMSI_X86_UNMASKED     0x010000
>>> +#define XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK 0xfe0000
>>
>> I'm not convinced it is a good idea to limit the overall destination
>> ID width to 15 bits here - at the interface level we could as well
>> permit more bits right away; the implementation would reject too high
>> a value, of course. Not only with this I further wonder whether the
>> field shouldn't be unsplit while extending it. You won't get away
>> without bumping XEN_DOMCTL_INTERFACE_VERSION anyway (unless it was
>> bumped already for 4.17) since afaics the unused bits of this field
>> previously weren't checked for being zero. We could easily have 8
>> bits vector, 16 bits flags, and 32 bits destination ID in the struct.
>> And there would then still be 8 unused bits (which from now on we
>> ought to check for being zero).
>=20
> So I've made gflags a 64bit field, used the high 32bits for the
> destination ID, and the low ones for flags. I've left gvec as a
> separate field in the struct, as I don't want to require a
> modification to QEMU, just a rebuild against the updated headers will
> be enough.

Hmm, wait - if qemu uses this without going through a suitable
abstraction in at least libxc, then we cannot _ever_ change this
interface: If a rebuild was required, old qemu binaries would
stop working with newer Xen. If such a dependency indeed exists,
we'll need a prominent warning comment in the public header.

Jan

> I've been wondering about this interface though
> (xen_domctl_bind_pt_irq), and it would seem better to just pass the
> raw MSI address and data fields from the guest and let Xen do the
> decoding. This however is not trivial to do as we would need to keep
> the previous interface anyway as it's used by QEMU. Maybe we could
> have some kind of union between a pair of address and data fields and
> a gflags one that would match the native layout, but as said not
> trivial (and would require using anonymous unions which I'm not sure
> are accepted even for domctls in the public headers).
>=20
> Thanks, Roger.
>=20


