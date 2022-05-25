Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF5533F68
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 16:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337264.561809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntsD2-0001ge-V1; Wed, 25 May 2022 14:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337264.561809; Wed, 25 May 2022 14:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntsD2-0001eB-SB; Wed, 25 May 2022 14:42:00 +0000
Received: by outflank-mailman (input) for mailman id 337264;
 Wed, 25 May 2022 14:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntsD1-0001e5-7i
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 14:41:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d41e0284-dc38-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 16:41:57 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36--17EBT2XOVWOX3Y_Jpzl2Q-2; Wed, 25 May 2022 16:41:54 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6021.eurprd04.prod.outlook.com (2603:10a6:20b:b3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 14:41:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 14:41:51 +0000
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
X-Inumbo-ID: d41e0284-dc38-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653489717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pU0MyUUYqIdpI4MUku3xG1BLdpnI7oaOFFDtuNWwMfQ=;
	b=iEFQ8lrAxodwXdPdrzqSQ3AWpqCMu6s4RDd3hWn/RqYKhP/W590Hlowigbmz+R5RCYcp4M
	kY6BJ0CXUdyp6F1m0BF5Uyr6ZLuO1oBoDSIAXBbfNuxSdUkNPaq9UOdWi8vc4BVfq4pRyV
	RFp+VHFyX9XRNfjstSO22hIfl7dX8mU=
X-MC-Unique: -17EBT2XOVWOX3Y_Jpzl2Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gp6aZP5t6ge+mQdkW++RTddksijSPz7fh3EBx1ATOTwVW+IhLFf1o3lZCz65jvtvg1UzD7jfzJHHroTKW/HwoPnhwGe5vuDDQ1+Q+BcIUFWGoOvF/HIMwTkYmZcz0/fzHjJVdwJHbnrbZqhSZ+lXVbGgoYlHCGdYobZTfggPUBH4C8kp0XOvmF+P7ayNc+K/jpMLRfjRr/9s5AAUMLc0rOmG0buPKIS3c4MUXskLbU21cCKdABTYFFprG8W9lYrEmq26LvxK2OjomYt+biyER5CH7Turm1koJgzv3g4pSGDp5CZHSpQ0+OmicnDhNrU4x41n7TFgSHy7Vq9Ah7Bdag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ayw2X1hAczj0AAK6zkbFFj87xksdKcNXGzvJn8aVHTo=;
 b=UcIzv9kHnG7hjM+nEhSvKxj7/8FqBQ4pJYHgFM/CKrDFceJIre3EMYvQiQeQndPeWHoXeZ4BoqyPuwcVKaOnbdx3TV/1b2OP0zegxzMIGA+sUB/epOc7nxlG1Cy+heUTsM7dDrF/X9N+hqnfeNuJuQ4pqYEQpelTw8QPB/3muv2V1ZEdf+wMyB6FHhta8R5hrl+AyAdqE6dAR6yhgo9yaLkYo1CQ12ne4GDIDKYomDX2RaPQqnZoetfjtvY7EBrjR0a86fI+C13iRY67uXo5mUnYqaj48N/tns8eCJMIbRNJ3sF5L7R66QCT7TdINfu62fAEI7FCeQrH+qCd1Sq1TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <130a3f3c-0128-dfa2-2604-11a966aac8f8@suse.com>
Date: Wed, 25 May 2022 16:41:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/2] x86/mm: rename FLUSH_FORCE_IPI to FLUSH_NO_ASSIST
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220525081311.13416-1-roger.pau@citrix.com>
 <20220525081311.13416-2-roger.pau@citrix.com>
 <58aa1cc1-3a67-60d4-6f8e-6c5746b05614@citrix.com>
 <fceb1ddc-0236-69ac-7d36-766668a22599@suse.com>
 <4bd5d8b5-80a2-8f7c-c117-5c027d8e8f34@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4bd5d8b5-80a2-8f7c-c117-5c027d8e8f34@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0170.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f60b704-6805-491d-2ea7-08da3e5cb4a0
X-MS-TrafficTypeDiagnostic: AM6PR04MB6021:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB60212DBB1769AB52A6BE9D9BB3D69@AM6PR04MB6021.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s7/MYBCyhvFp+ZkJQ8pV66etj/MCoxLz6EZMyJ1vZASrOY5SP+VW+wOryx7HVdQ7f4NH+9/s1O69pLcRvCURGBplXYTH65C6EUFq3HruYktOXsySF1SzaFYbKDCU2iQKL4QEwHmn6pK6RaFcBWCoytGMv1FmA0NFfC8QUrxOiqsdKrYII2asyqy7YtZsa/e/fJFIrPKvmAO061PO55gXDzitEHHn7lBO2FdxWsQHagXJf40K/QFbU5PQUnCCv85Q1lEL+bvA5cNUpsObWsIKnUkCH6fgGjIdmEqQR66Op77fNd5fA0Xg45yMpnPntx9jq6vhG9ViJ9G+y73MDDL2I4/gzSpGOpRXchmFJ2h5hw0w9wIFzCdcSI1Df7HNFz2bUEZS1IqEVcDV7k9ybKEtkX7Q/GMgXnmTUdoKHhYdYg5XgmqDYgnQ7jO4KHQtaeWq6LXgrCWxlnxbxI8O8+0Fldz32zQKr0G+UiOcYCZjkvLQpNLSu+l+kleTX1zYOcyQGeK7fO8FjR8yyujPdhg8kimiRqjp0IG3EAJ5S3zaqjD3toxC8ZHNzHLagibRDSqxYsI8IcMuitMQ4V6PqT7tlHnpamlH/yo7V4LpBIL+7oi2i1+ayYEl8UIgUGTT1YF6TwqqWaN+LorTYwn2MK5euKJs02dSvRnbx9WCzrjdwC/6ZtX2o6M2c3D2THdREzcaUwYbWUFeUATtGFREI6WI8QzRP40aXW8cNeiBCTN74jw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(38100700002)(508600001)(8676002)(66476007)(4326008)(66556008)(83380400001)(66946007)(36756003)(6512007)(6506007)(53546011)(316002)(6486002)(26005)(2906002)(8936002)(6916009)(186003)(54906003)(86362001)(31696002)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mP7zyAv+saxzZsCmgTncXxs7r4/xBD5Z0NPL8R1aRVAOux77Ooh8dDJWYDu9?=
 =?us-ascii?Q?8cTZwZaNmulHkn1b0GB3SdXAutQhX+13w7IVFqUme7rUXUz8HgZt8uwUD6mT?=
 =?us-ascii?Q?d0nbQ44Ca4jnpbEvFm3DTJIoE9yrdXBHq+7K8yrbhNDZQHsZgYwXeNxN6vKa?=
 =?us-ascii?Q?WecEgpfO1nqPtZVaxZKwbAwuECWsrVaLgRX6h2IDe4sxXm29gleDZiGckb3b?=
 =?us-ascii?Q?VeAZKDr/Dn0K0UG1F4fPyxQzn3e/DaZYZ0UKdrcLEup4P+OgldXepgomzYK/?=
 =?us-ascii?Q?VdVv27lU/6Jlcai726bmEZrvou2vtg/7b6AABpWtfAMIPSbuApOVnIApupLR?=
 =?us-ascii?Q?YOco+Y9caGCHRgmUAiNeY4pTIm9mPIEfXx5IKqZNfvQtQ/SpEE6qyXRPR28H?=
 =?us-ascii?Q?BZ7MBt5wYaIPisxSeg1MlSwQw8eBAZPx3gj4CbdDcc9YbKIEdC87mVWsFCx7?=
 =?us-ascii?Q?oHr/a9scjgKT+glMVYYok0tzuyO8Vq05v+12+9Xjp5lUk9jj9gGok6vThCJo?=
 =?us-ascii?Q?LVVChQ3IEsVCjZS8o3CnFBrd11udVrnU1CaPSYDHXTQVBqodKEPyYt9khXBn?=
 =?us-ascii?Q?TOT1SXA/EGkLnNSPuS4Hr+pNWpNr32NcuKG1Vwa2UtWPnFKfafey/BGmmoS6?=
 =?us-ascii?Q?ibGDJK68VYA5+Uu02w+Ew+FMfkk8buZy3XBbGnbtdDVrvEnK0NWkpjFezGYg?=
 =?us-ascii?Q?xgI3dlYV4v555kohvHIW54uTYckB4BZ2pGM85WcEUmQrmEFQlr1qbv4vItjw?=
 =?us-ascii?Q?/len9U56MwI3u7zv/bstcBEom6oVk1swP1zUSsrvuRnnfDNdbhgZIJWMVblJ?=
 =?us-ascii?Q?CJzyuJG6Ghqb5MUQIh3dltqTlBJ3olkQ6tMEoO/OPPFHDQ+lO+retBpByBV8?=
 =?us-ascii?Q?7f4Ldz3a702oxZipsX6z8NMicYj/GdzjZ/dF1fuoFGrq2UcQImlJkLQLcwhN?=
 =?us-ascii?Q?c9QxCeerB9zsUkF/1TvtZ6S903HGSW25SIoJ/5K/zkdIlf8VFqUyh6PTdQqS?=
 =?us-ascii?Q?FHFWWA8VXrL3M1muAm69x1PlDMYKTX8cVTW1MSmZEMHstTLyAkvtHFzZVoqJ?=
 =?us-ascii?Q?XSyiCfay3O4XSSFd0CI1Y9Mad0Ghvr3AbtkmJSvTNI0MRfd3CMdcSDuNjmzC?=
 =?us-ascii?Q?QCgG3tkH7nV/4jT9s7MTNCr9aU3QzYg3l3lAWnN3enKCeDqrq2K8vK4vWJrE?=
 =?us-ascii?Q?YVeyqk46aT36L4Ku/O1UWP+3y5RNAC1e3Uj0cYyIvXgSuvOMogU9hzSxbvmZ?=
 =?us-ascii?Q?dtvM0jDee0mbLz8jqgILByUNm4hh6fH+DCgYAfqnN6KmNpGZdSYL/OsY935s?=
 =?us-ascii?Q?kTa5Zs0EkAnqmZetM1+jSxHwK7SNMKd+CovuujE6aWWxJUSxFBiNrjkC8kYZ?=
 =?us-ascii?Q?IfCNVnwZdBMaWKa8SAd6eVkR6xomf77kyK2kyX53wUHn9GEMEppVBhqjs1bj?=
 =?us-ascii?Q?ce4MvA8D0hQ6Ccke3dGnqwfrYvO1Or4eEItxfAkAVXd6ipzmmUkDCH3GXSft?=
 =?us-ascii?Q?JHkqUxF1zeON1N7g2canzZvW+7NoVS46mlBny/lCh8HNKQXH3b6vu3x7FU3X?=
 =?us-ascii?Q?Fgssl1qPPYmeI5TNFH6GZZuJNXSrT2nu6n36fA9lf1V3vBZBmdGGwoXNblEW?=
 =?us-ascii?Q?mmyFm5b0bJIhNloOmSg4trG4IrtkzHetj1DtjOYEtgjGn9J9yU+sRmaetX50?=
 =?us-ascii?Q?3/f8pxv6UMRKltYETWwST5zc35vh3dPszc6IMAZtPvFySRIJIalGh6kHhVpE?=
 =?us-ascii?Q?mj5iQs/e3Q=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f60b704-6805-491d-2ea7-08da3e5cb4a0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 14:41:51.5906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOzm5lji9v95mBBupVYAndEYoeaRq5tCixDUoYWXdtweibVEKOsTRPUzDRsM9u/EOouJxW+tdcpu8Nn0QhQ/tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6021

On 25.05.2022 16:33, Andrew Cooper wrote:
> On 25/05/2022 12:14, Jan Beulich wrote:
>> On 25.05.2022 12:52, Andrew Cooper wrote:
>>> On 25/05/2022 09:13, Roger Pau Monne wrote:
>>>> Rename the flag to better note that it's not actually forcing any IPIs
>>>> to be issued if none is required, but merely avoiding the usage of TLB
>>>> flush assistance (which itself can avoid the sending of IPIs to remote
>>>> processors).
>>>>
>>>> No functional change expected.
>>>>
>>>> Requested-by: Jan Beulich <jbeulich@suse.com>
>>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>> ---
>>>> Changes since v2:
>>>>  - New in this version.
>>> :(=C2=A0 This needs reverting.
>>>
>>> It is specific to IPIs, because of our current choice of algorithm for
>>> freeing pagetables.
>>>
>>> "no assist" excludes ipi-helper hypercalls which invoke
>>> INVALIDATE_TLB_VECTOR.=C2=A0 Such hypercalls do exist and specifically =
would
>>> be improvement that we ought to use.
>>>
>>> Furthermore, we do want to work around the limitation that created
>>> FLUSH_FORCE_IPI, because we absolutely do want to be able to use
>>> hypercalls/remote TLB flushing capabilities when available.
>>>
>>> I accept that FORCE_IPI perhaps isn't a perfect name, but it's a whole
>>> lot less bad than NO_ASSIST.
>> But FORCE_IPI has caused actual confusion while reviewing patch 2.
>> If NO_ASSIST doesn't suit you and FORCE_IPI is also wrong, can you
>> suggest a better name fitting both aspects?
>=20
> I don't actually agree that FORCE_IPI is unclear to begin with.

You did see the earlier communication with Roger, didn't you? To
me the name pretty clearly suggests "always IPI" (hence "force"),
i.e. ...

> The safety property required is "if you need to contact a remote CPU, it
> must be by IPI to interlock with Xen's #PF handler".

... not in any way limited to remote CPUs. Yet patch 2 is about
cases where things are safe because no IPI will be needed (not
even a self-IPI).

> FORCE_IPI is very close to meaning this.=C2=A0 If anything else is unclea=
r,
> it can be clarified in the adjacent comment.

I'm afraid I don't think a comment is what would help here.

Jan


