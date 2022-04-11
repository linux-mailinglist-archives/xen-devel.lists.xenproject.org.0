Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682314FB944
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:18:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302867.516705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndr7o-0004pz-4g; Mon, 11 Apr 2022 10:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302867.516705; Mon, 11 Apr 2022 10:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndr7o-0004nl-12; Mon, 11 Apr 2022 10:18:24 +0000
Received: by outflank-mailman (input) for mailman id 302867;
 Mon, 11 Apr 2022 10:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndr7m-0004mG-E2
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:18:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1340247-b980-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 12:18:12 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-Q_NBAtiMPTGcY7CetEUpyA-1; Mon, 11 Apr 2022 12:18:17 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8551.eurprd04.prod.outlook.com (2603:10a6:10:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 10:18:15 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 10:18:15 +0000
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
X-Inumbo-ID: b1340247-b980-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649672301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUuHfxSN9yVgyp+MdEinxD3HIgk5+2q2xNMXiI7Ii2I=;
	b=l0eFtiYahHnO/+lpfeF6DrfXE3Di9pcKUcKr3OLTX3C2DKH0OjSRnNSiYn/7o2xsaKhaL7
	ZkQUmzM7QKcrq8DgdKNEVwnNdf7xU+lwp3pq5o/3OwWb9/+grMmN55ExZS8cykhvinN3Gq
	+MUrMDMLR3B24fvM8w/I+Kl9BOlqxac=
X-MC-Unique: Q_NBAtiMPTGcY7CetEUpyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdWIi1dNOsgQpmxsW/6NGoQbeM6I5AFHde32T8r1Q7xCwHV71m1jCWI4vYvNYpkDiHdtrtZPrj+wowPNhhHkGfDqknZ67enzoi9CTqhiNaQbuxAxZQmZkWvWBOi8YWdRLFOEYG0D05AYlaBZbKcgZLVLIjHLJq0kreP7iTwV/bzTZ9lAHOSvRoVjJLSMtXE0AMtAUiM0sOx+61A5McOoJ7OoAEnpWeyeud9DnXUTXVPeV62StmWBMcwbNXFhFeFXdAQ3VwweAOBy5pL/SLhQCyFJMM8rDHcuT+t0OzCL64HrNg0cIp7+f02a9STYTT1/cvKf3b+Oa2mOvE6pQAsJ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUbQDo9Kb3I9PKZFWq4LglkV3RQY7wo+HxS/U2Ly0qk=;
 b=nO851Hi2g9TlPsPgfS7tGkfpw6T2DS7AZmYA6lOwuTy0kkonqu/iqQIJaTaw67hf7lOrpK/1CgsipDiFCGikecKXra7gmo0/GVHR+uU7CJHUFglvKjUweloXTzRQ1JlKyBkT3KJoFxGN/Npzj1ueRh7h9uuyrOCG/XUmEHzgyAWZpZflSo82FRFXiCvrTH3/lM5pBbJw8CkA1Q0rWElmywaJa9pXU9XvsC94W2/t2LgIKuJze9ErTc38YvVwOgdEFlhZeUXTdoxQnieXpfUAvs5Uc3EgoPWhcOXpuUsmBtCO7eXt9JRNKwtxjgJBco7kn+4T/Tg78TW0fIQYH5Vt2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae59d52f-7a4c-a4da-275a-a3cc419b94e3@suse.com>
Date: Mon, 11 Apr 2022 12:18:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/8] IOMMU/x86: drop locking from quarantine_init() hooks
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <3430b8fa-6700-b5ec-a160-2e7609dd38a3@suse.com>
 <7b79d293-80c3-d368-1abf-581f57dd2f82@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7b79d293-80c3-d368-1abf-581f57dd2f82@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0015.eurprd03.prod.outlook.com
 (2603:10a6:206:14::28) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d52fff5a-07f9-4f6e-0e52-08da1ba49763
X-MS-TrafficTypeDiagnostic: DU2PR04MB8551:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8551162BB84052CF4D5DBD3EB3EA9@DU2PR04MB8551.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OfjB10rit5SlUIL3WRx9ViOhBt/XBk0Hl//6HIKpU1bTpIu523Wis5vPy22C+8Rhflc/kvaghF4lctSSB5SL0jgVbU20PES1p4LC+hup0TcGmmICCKHBOk8NiskbvCNkUDCtQMLxjtFJvFmGDnLM8UXGcQ6q+HLt7UVp74kPdmTt2RBTKywQYSCUzJ5A6nyKS5n5xqVRTSt6+1Vg6I3mGGp3RcCq6orZ9LeazBMNeSJCcWzLu/KtjNAf1vchNYqEsDxDHfJKLY4M06u36A6Sp8lzLPrnifZ3ApPcOLMxZ1ygRasm1razPxNFAi+iHmDN/DZZtdsguBVJEkSOAVmH8drXWP3uBOooxWk8WDwM4a1mOl20WX8U4ALG9i/Y+EnQcTE20AR8JT8LXu8y1jxWC9Kz/+BRwOSDrlkM/qtl4u9MegN101aHKoG1tFcRDnK6mDjLDLGTbCVXmAkmk1d6uHPJeOFPD35QgzA+2XbDO8cidVaXncFIhgSBR2c22uOgJNyO5F55ccXF1xwQj1BIUM7JV9S4Bc43BZQMLpAp/m0vTGkGk1M37CuF+EYd4EyifjIjmj+mJ4FU1dYkeHXyb3gBdg4Z5+kWGx8y02qmcj84qO0aA6dGZzFe62qRek6qOybD5H2FJZ3vm0LAq0eNO0f/FfjdguPiBscMYdLvYuKZaJqB6X1SOvmzeK7gZWNtrGNOC784JIi785K+CKzDVJrpawiHWMpdZE5CkXlPzIU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66946007)(5660300002)(6916009)(8676002)(31696002)(66476007)(66556008)(4326008)(8936002)(316002)(86362001)(6512007)(53546011)(6506007)(83380400001)(186003)(6486002)(38100700002)(2616005)(26005)(54906003)(508600001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e0nvDutkHmh/gaizLQEsLVel3paH+eyO9fqNJ6/bH7DPhKNd76unJwQQ+7sF?=
 =?us-ascii?Q?9tmGOAh02oyzqxG+s0aDRDnOsjpXhSnWybE0mw5gexl0G8JpnQJMMP5Tu7M1?=
 =?us-ascii?Q?/FqAeEzrB21PxtO9vyyahYcQ68DzL1sKrjv93rkXtEEt1kYIr+LpE/PcWX9v?=
 =?us-ascii?Q?cP+mMIt0+s0QwLWCrxA3JQ2MEbglwXBuSNETFDuWpLeQ8zF5O8toA9yAES5H?=
 =?us-ascii?Q?Vf1OfQujAh4NgvdpCe5pccHnaEIWAJJFyXnHOK4LDJZP90TN1ahAqPt3Nt3B?=
 =?us-ascii?Q?f7GhWCyC0qvjkVZZsNeZV3FQ+d6zwtCulUkgWrYDQLuhoNHt3crUDPP+YOyY?=
 =?us-ascii?Q?U+Cy2SQb1T8UQuhSjSPoIrxVxnACVoGY8TiyvLD0jVoUG6zC6CNt42kMbaq7?=
 =?us-ascii?Q?NWWYIif03cTT/HT0RIDNWgkN2mGUwiV8IKzi16z6aRaFevgDcVMDP/SEWtcQ?=
 =?us-ascii?Q?9jqqae3nbFgmtOLrlN2V1uBaP+yd26/JxuLZjJgURiNl8SmodylqdqZNMiv3?=
 =?us-ascii?Q?oadgtd5X8RiOXB1+AxTbPKEv/z2N066GmxGb0bCekD33y23B3eob0S7c95R0?=
 =?us-ascii?Q?YWPE855kT8GH3uU3GeV29vzZNDoZLxRF+IdzQrxvXHFD7/5zk+OdDGMJAemg?=
 =?us-ascii?Q?TP2MSyzO90HPTwceKLMDXQ47ueKqjh8cjmEZnVcSL2+oGUZo6A0xu7NPVwut?=
 =?us-ascii?Q?ev5AP0t5MyTQLhXP1bza9TSBAWKpM/MtWqnDG5M2vRjeQBNx2gNUNzz2IheU?=
 =?us-ascii?Q?8uk0672boyEJi2Gxj0U5xzddJktzqhQjUblBzbIWVPl10W9P17SHWQUtznq7?=
 =?us-ascii?Q?NaZbxqnBGqhozE0t6NEDalkIQCDQLTHSZlBPyDHxacfjPBaFumI6ynZfxry1?=
 =?us-ascii?Q?a4u5MN1yWIX+wAHoc7e12AR2sANS72Tdl5tdi2gp1xZeX2mo5KMvZzbFgDfn?=
 =?us-ascii?Q?efzpFRMt4eDAEKpEYbRpQSuixroSTTaPsjIHklOF/G+nESOfUTcpD2lu2BrS?=
 =?us-ascii?Q?5VZQrPQzZ3wN4xLzkIRvAf5bbfh8+hpywJrp4zVzhkPlMSO8G19CLg1J74ED?=
 =?us-ascii?Q?ak0KGQ/eP/zXOXxUiPiG6AEiVWaPTUSqo8TmxlaDYo60H8yEgf7tjvHpMXbF?=
 =?us-ascii?Q?03UoRWPuCHJaKqcK+FEEtJ/ZxNkl2tcEowscAamfjq69sKqCgDbAByUqIbj+?=
 =?us-ascii?Q?UKisobgIe3C0/8bn7kM0/yG4mP+5ptcfnhnMnWWrJ2S9lA+mACuJ0D9zqVq2?=
 =?us-ascii?Q?gq0oBXBLQ2ZeV++M4akzITcoe33ehOQomy6bD0i4nsMnS9mKlRv7zuJ+QDnE?=
 =?us-ascii?Q?mrfWrkb0viJuecGkkKbJqaDkPCXzLUx9dwnvaiCn1yLhqMjQCXA1At73MFTY?=
 =?us-ascii?Q?kwHqXViEsWmfh6jVoDbIbqLK9BaGPMbB9Ye2QSqJUeL2L/uI8e96YMoPn4Gc?=
 =?us-ascii?Q?2VkBfWjGduotBRV/nPymn9yBtHHuIYRwnFqKcqwviNCK+CjIKPW+7flqMhi3?=
 =?us-ascii?Q?k22s2+T8UIxp25Em950oYwhl7mLs9RIp3nti4M+qTO76EBq52TNaSlSHPaGC?=
 =?us-ascii?Q?cGIo4b2ZpmMhbDIOcsWOQDf6pMSGM6YGIRDsmu/CLf6jMgF/wmX4Sp++uXun?=
 =?us-ascii?Q?CpTuCh32l8yKULVwddpgxEu8ESDdUxerTSGys4HE6hj6sR+w+tPmd4uee59E?=
 =?us-ascii?Q?oY0hKzMFsb+bs6Q7da+W8W8v6B9+CyqlN6GRgvjqrZ0jbqp0uNahz8duX7pi?=
 =?us-ascii?Q?m//OySnuFw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d52fff5a-07f9-4f6e-0e52-08da1ba49763
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 10:18:15.5878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yC7cRExoOXs05VPRoUuDFNzoFVJZWHxxjaPlpPmKtmFxgA/KrlHftBUrEi0EVr7am1I7tXSfo9gBRzYTyxpwFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8551

On 11.04.2022 12:01, Andrew Cooper wrote:
> On 11/04/2022 10:35, Jan Beulich wrote:
>> Prior extension of these functions to enable per-device quarantine page
>> tables already didn't add more locking there, but merely left in place
>> what had been there before. But really locking is unnecessary here:
>> We're running with pcidevs_lock held (i.e. multiple invocations of the
>> same function [or their teardown equivalents] are impossible, and hence
>> there are no "local" races), while all consuming of the data being
>> populated here can't race anyway due to happening sequentially
>> afterwards. See also the comment in struct arch_pci_dev.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> It is only legitimate to drop these calls if you delete the mapping_lock
> entirely.=C2=A0 Otherwise you're breaking the semantics of mapping_lock.

Not for all domains other than DomIO. And DomIO is, well, special. As
is at what times quarantine_init() is actually being invoked.

> Your argument of "well this is already guarded by the pci lock" means
> that these are uncontended lock/unlock operations, and therefore not
> interesting to drop in the first place.
>=20
> This patch is specifically setting us up for an XSA in the future when
> the behaviour of the the PCI lock changes, the fix for which will be
> revert this patch.

That wouldn't suffice then. As said in the description, and as discussed
during the development of the XSA-400 series, further locking would need
adding then.

Jan


