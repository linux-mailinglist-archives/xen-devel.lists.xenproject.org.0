Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2EE4E55FC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 17:08:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293943.499555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX3Wb-0002DK-OC; Wed, 23 Mar 2022 16:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293943.499555; Wed, 23 Mar 2022 16:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX3Wb-0002AR-Kz; Wed, 23 Mar 2022 16:07:53 +0000
Received: by outflank-mailman (input) for mailman id 293943;
 Wed, 23 Mar 2022 16:07:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nX3WZ-0002AL-FN
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 16:07:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6252589b-aac3-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 17:07:49 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-uD28o2S8Ou6uJLJsLlAT4A-1; Wed, 23 Mar 2022 17:07:47 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0401MB2395.eurprd04.prod.outlook.com (2603:10a6:3:22::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 16:07:45 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5102.017; Wed, 23 Mar 2022
 16:07:45 +0000
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
X-Inumbo-ID: 6252589b-aac3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648051668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MoLqS1bmjAfXfjyhz7y39+THnQgopNeY391D3Dr5b0M=;
	b=BNoFiitb7VxC3otPmssL64ql9a+9JhfSOwTs1PzeUXzl3IinpnxMWCy6SR6q1ScPhXJRss
	uhlLLZpDEwUYtjFb3WMumHl6ImLb/jZnl2IJyUNnroEQcQsPr0eKfmGv0YjyXjfFKrq6Fy
	g1SwJ847gOJa1SyctTN1XY+q6QyQoOM=
X-MC-Unique: uD28o2S8Ou6uJLJsLlAT4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgPiyV4eJDV+oJ/iRLO3yTVCUqWvUjlesst7/Q28YXw9nIJsGlWthpX+1PvGR4tskFsqo8PbCNxhUnU5xwOvI+NQaJ8gw4n8xu99hW0ZZwDLhwsh9X/GWkW+/SoWdOeDKenKxre4yeJOFXuCOcAWHEbttLzoaUrbtevyUQ6egu+OJ/pt0KLHz+dyZBN3cSC9PXGLK6AyI/rWKpDzEbkiaGcmDRKpvj6EbTNFsB32d2GijNCJrAPCyY76XQ9VcAqTvljqAFvqpvciBeO1k80mJGNMbKVosuQsdHrtA93Gj+/7IKfLsaP63B4T1OG0EZxGsWPEyjTtITk4zJfZeJPG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5wJwKMCkw7X/MSjMTfzq73GZSh2/IKUyZdRv/I2xGg=;
 b=nRwOykvMl610CRr/j4+GPV5vHRdq62YGKotjomL1wL82Ukr37Dh5+V4UKo0MCP8OmDaoVZx6lmHUfc0RrNW1W+JS4SNcAhVJQIDbogUF/izNsUEs/YxV3hf4QwMg+hAQ/zGhQ9YJkLrtE6n3IOEYVr05nF/AtT17CgIqjFjkm6B1DMIBJwEEvG9YHHnUZDdEAiXth7patHbZMnYxh15tRyrLIhIiG6Fs/6tRCjFPFIU1p5UT1W8SD9PBcM9E+/NOzXCvrxB8nYbh9Qybyadtb+sKgM6l/jDt2Ycl8iWQWnoT4FUBkIeZ6QwWMgIa6P8Cgs5C40wZWE0AAoOKu2wDkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36c2a426-5354-fc38-1917-af7045bdf268@suse.com>
Date: Wed, 23 Mar 2022 17:07:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
CC: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0088.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06f72702-7828-4245-e175-08da0ce7445d
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2395:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2395FA48559FA33454DCFA1AB3189@HE1PR0401MB2395.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PoxxnxWkHcoTt6usEdQCfLayktDN2aNJ6mxfIS7nbmVSRN1/m2n13loehpbUZcuplPfY/R94syi3fRP/rLL2eMbEBcNtkhgxfdyF7IV8TLmVcy4GtsD62ZrPWWyBehr93cFMWvTSQ5CGepuIul0NfHWk6zPoxwguhpRazCKOXBOs0DNImHmL5npibH0k6wuOhmWZK3nikDPsf1d6BamYW90sWxqHvMVslQJy1gmGX7abuEdt41l52OckoqESm+kFXkDHvloOtQ6Zng8TxM8x0uqbusyVFCCSrIOcCuz+vqdyahONLExjCZH3VTO0OIYiZ7XzztODnv/zt/pjwdr8CyEcyulWlAt280avcbNErOmhcKi/3Ar9rffPYwPPPBETg6ISUuN1jF2SAfk47aGhVplspoIcz5bSDAF8pNnovchpfy2UZbAFBEKijvS65auTm4m5UFdjMsXs9t7CnK5IXqvB++EW99F1jmt+58wc8b20ZhI1O54cqtpZEtJdfotuCnIa1pMakCfhEwksE7cTZraTYeBnlmU/mgJHxe80kMGDYCReqIQPEORZMkg975/LymPpMyYaAclB6F+Lkc2kypfnmBsGZ8CEILkagszjftBrg6FsPiSBbDjstiA+TIVB4le/dsIp7XITHLKvOT9jqaYrfmTaeSN3Gua+ou0CZsm3ZOgG337zf50mk4ORfZ917b6em8jEZBad6yciI3TnHjXMUIefYaXWXPKeE2ZfRA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(83380400001)(31686004)(66476007)(5660300002)(66946007)(2906002)(66556008)(6486002)(4326008)(508600001)(8676002)(8936002)(6916009)(316002)(31696002)(54906003)(26005)(53546011)(86362001)(36756003)(6666004)(6512007)(6506007)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O/oFWCpndAeBx1kQhRoWZuNJXPZgHNYTALTqhKbHx3uDtbpaoXzNj6JG5ssa?=
 =?us-ascii?Q?lfbmfU0qJwCggfWWpZ3ninNp2y+Rp2V7wqfrkGoFixSd2f00ZpAo1PR/C8A+?=
 =?us-ascii?Q?+k0COp324P9mMQIW9JYNoarTzqKN1/2zONlRxYULgPGsu63m+ifMRp5/371M?=
 =?us-ascii?Q?QJFjcgZFewpEkwOMoPRoKVO1AS7C37WKPFcaXvWp5F3nmjLSUvmDdkj5mgVx?=
 =?us-ascii?Q?tEhMMpiAFlymvVE+0XWPEoRpH0b2CXLfI4LeaDzpGUFWMIo4dabBEAOJcnt3?=
 =?us-ascii?Q?8nRbL+iLJs7LXRGYdSQaZ6V/gY7XoTiJpgmyi1CXr+LsSrRZpS9m+EEnSHiK?=
 =?us-ascii?Q?z89FiwJk9bYoG0w3UevrOaAECFtUJ2uwmOoA/MFWSzNUAmJMyPWCr0fZtgnC?=
 =?us-ascii?Q?B1KlDDLHpWe26odu1kzNSOC1HYEhrVF0bLmYDi4ckN/CpDS7JrSgKLPGcTNf?=
 =?us-ascii?Q?jyfIza5AMrbJc5mX/GOPDZYbkYM57s+wNcijog6kFG77QcMXLHHCI0qFfB2X?=
 =?us-ascii?Q?U7wfqAG3O9Hei0zP22dNAGW9ksGTVAFSHw0clJkr8hU5GcW+1ebpxL72cDKl?=
 =?us-ascii?Q?8oNcq3ZoXm83VYTER3vZGNeYsrbNCHfNACfx7geEaAIL4lwu/ZTU5+IvBBnJ?=
 =?us-ascii?Q?xPMr41OVdYO6jHJ2LYhWB46/Kyl5rWq1BZnJvmI1+mgFxqcoA5/ib67rPN4l?=
 =?us-ascii?Q?JSpWZVByPz7udItKqo6uK+yaxczerwC4z6t6J4sb+wocbL+fE+tSGkeQqaRn?=
 =?us-ascii?Q?prHBU4NAZ5iioDXquTjcY1hxQSeFRxKlIJ8gJa1yUstQ7EGXODFgV4PPZ/bb?=
 =?us-ascii?Q?3dr7Rr9xdfRVXKc6l5oOPQLEuf7a1Nt0vOEpoMNzSMkLemhhSfJVgOlOr3Gj?=
 =?us-ascii?Q?n3P4OUK0zSc1WPNOkfEkvlF42BP6dHy1+nf45EzMQ5tQ2xzcl+w8U1Lm7qu1?=
 =?us-ascii?Q?i9uaixjAZM9ANR16WEtrK3w8h0V3g0CXey4DVL4ceQMf17Ztorq6S91301ZS?=
 =?us-ascii?Q?Ln2EhLi4oq3oCwFQ6eIHm1cQYcWIVS6oDtWZRQn0j64rVyLeTniTU/YDlAv9?=
 =?us-ascii?Q?MoV0C1h8GC+7iSN++24L4/zZlOnKbaAU7+StEOBHaVYb3m3G+gpiV0BWu/y2?=
 =?us-ascii?Q?M9qikiY3WfDl/V0mdBKTv/RunV/Vum7sHV1nfo7GfN2KuufR21nGQXcOrdSz?=
 =?us-ascii?Q?z3GRExS/T+CCg4vl+S3Hx6qObMoBK3D2VkzzqqYRhu5u+IMb7lPNgdj7UPyY?=
 =?us-ascii?Q?WTL0D0c/kn+lkJ2mCRFG1NO6UgKcZ6PvXSn/8k66KMRUI/7NR2Dz8h44m9bJ?=
 =?us-ascii?Q?cG0SwYLjl0mdmohs9C0or0VYia1Tlx03Ii+li2qQLDb3AJAhcg+uWT4bJirb?=
 =?us-ascii?Q?qlAxgjx9OWhQ7RxWERVyd20JpKCEbQ6x4EU5Dt0ywKPf0aufU/+Karrg64OK?=
 =?us-ascii?Q?4qDvHse4CpxxrbJHkiXlnZLDG4JR9qfY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f72702-7828-4245-e175-08da0ce7445d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 16:07:45.1265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZx1L3Mc451MkowpDk912PY0ZP93hEzxzIFQx3T8RfquAXIbU1H5BIiMybUdNByJ48wPH/ST12qE1yS06UfLdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2395

On 23.03.2022 16:43, Rahul Singh wrote:
> in dom0less system. This patch introduce the new feature to support the
> signaling between two domUs in dom0less system.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  docs/designs/dom0less-evtchn.md | 96 +++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 docs/designs/dom0less-evtchn.md
>=20
> diff --git a/docs/designs/dom0less-evtchn.md b/docs/designs/dom0less-evtc=
hn.md
> new file mode 100644
> index 0000000000..6a1b7e8c22
> --- /dev/null
> +++ b/docs/designs/dom0less-evtchn.md
> @@ -0,0 +1,96 @@
> +# Signaling support between two domUs on dom0less system
> +
> +## Current state:=E2=80=AFDraft version
> +
> +## Proposer(s): Rahul Singh, Bertrand Marquis
> +
> +## Problem Statement:
> +
> +The goal of this work is to define a simple signaling system between Xen=
 guests
> +in dom0less systems.
> +
> +In dom0less system, we cannot make use of xenbus and xenstore that are u=
sed in
> +normal systems with dynamic VMs to communicate between domains by provid=
ing a
> +bus abstraction for paravirtualized drivers.
> +
> +One possible solution to implement the signaling system between domUs is=
 based
> +on event channels.
> +
> +## Proposal:
> +
> +Event channels are the basic primitive provided by Xen for event notific=
ations.
> +An event channel is a logical connection between 2 domains (more specifi=
cally
> +between dom1,port1 and dom2,port2). They essentially store one bit of
> +information, the event of interest is signalled by transitioning this bi=
t from
> +0 to 1. An event is an equivalent of a hardware interrupt.

Nit: Since you're talking of channels here, not ports, strictly speaking
it's two bits - one on each side. Alternatively instead of "They ..."
you could say "Each port ...".

> +Notifications are received by a guest via an interrupt from Xen to the g=
uest,
> +indicating when an event arrives (setting the bit). Further notification=
s are
> +masked until the bit is cleared again. When a domain wants to wait for d=
ata it
> +will block until an event arrives, and then send an event to signal that=
 data
> +has been consumed. Events are delivered asynchronously to guests and are
> +enqueued when the guest is not running.
> +
> +Event channel communication will be established statically between two d=
omU
> +guests before unpausing the domains after domain creation. Event channel
> +connection information between domUs will be passed to XEN via device tr=
ee
> +node.
> +
> +Under the /chosen node, there needs to be sub nodes with compatible
> +"xen,evtchn" that descibes the event channel connection between two domU=
s.
> +
> +The event channel sub-node has the following properties:
> +
> +- compatible
> +
> +    "xen,evtchn"
> +
> +- xen,evtchn
> +
> +    The property is four numbers of tuples of
> +    (local-port-domU1,domU1-phandle,local-port-domU2,domU2-phandle) wher=
e:

Nit: I think you mean "tuples of four numbers"?

> +    local-port-domU1 is an integer value that will be used to allocte lo=
cal
> +    port for domU1 to send an event notification to the remote domain.
> +
> +    domU1-phandle is a single phandle to an domain to which local-port-d=
omU1
> +    will be allocated.
> +
> +    local-port-domU2 is an integer value that will be used to allocte lo=
cal
> +    port for domU2 to send an event notification to the remote domain.
> +
> +    domU2-phandle is a single phandle to an domain to which local-port-d=
omU2
> +    will be allocated.
> +
> +Example:
> +
> +    chosen {
> +        ....
> +
> +        domU1: domU1 {
> +            ......
> +        };
> +
> +        domU2: domU2 {
> +            ......
> +        };
> +
> +        evtchn@1 {
> +            compatible =3D "xen,evtchn";
> +            xen,evtchn =3D <0xa &domU1 0xb &domU2>;
> +        };
> +
> +        evtchn@2 {
> +            compatible =3D "xen,evtchn";
> +            xen,evtchn =3D <0xc &domU1 0xd &domU2>;
> +        };
> +    };
> +
> +In above example two event channel comunication will be established betw=
een
> +domU1 and domU2.
> +
> +    domU1 (port 0xa) <-----------------> domU2 (port 0xb)
> +    domU1 (port 0xc) <-----------------> domU2 (port 0xd)
> +
> +domU1 and domU2 can send the signal to remote domain via hypercall
> +EVTCHNOP_send(.) on local port.

How do the DomU-s learn of these ports? I guess information is to be
extracted into their individual DT representation, but this could do
with spelling out, including how those nodes (or however the data
items are called in DT) would be named and what data they would
contain.

Further I assume this being encoded in the DT passed to Xen means
implicit consent of the admin security-wise. If so, this could do
with making explicit as well. If not, the security of this would
need discussing in even broader a scope.

Finally I assume such channels are established fully bound, i.e.
there's nothing to do by guests in order to establish communication.
This is another aspect that would imo better be said explicitly.

Jan


