Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105BE49F3DA
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 07:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261870.453691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDL43-0007MF-9h; Fri, 28 Jan 2022 06:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261870.453691; Fri, 28 Jan 2022 06:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDL43-0007KP-6f; Fri, 28 Jan 2022 06:48:55 +0000
Received: by outflank-mailman (input) for mailman id 261870;
 Fri, 28 Jan 2022 06:48:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nDL41-0007KH-Ex
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 06:48:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a144f3c-8006-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 07:48:51 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-xBFi74SeNj-xfRKQ_RjoSg-1; Fri, 28 Jan 2022 07:48:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU0PR04MB9298.eurprd04.prod.outlook.com (2603:10a6:10:355::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 06:48:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 06:48:46 +0000
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
X-Inumbo-ID: 5a144f3c-8006-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643352531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YmLq5uB/Y9CPzbv2Zk3CtTevVCYDKFI1di5e5tNVpKs=;
	b=BoAld7/JG4HgYwCxoMo5cv/GGk5UVXjhQH0mf3r15gICblHrhB5+le5aXkEZrfj5LO1/S/
	4kUA32IPRZwKMBC2QCB3Nw7JtCwA46BGuKnZ8lrpnyfxpi2nxlfhFsNVwf7bWxOoQnD3VX
	xizbT6FevRbuDR+K1YYq2Kkahq/t1yI=
X-MC-Unique: xBFi74SeNj-xfRKQ_RjoSg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvY81XqC6TDPEc2PxaKiifuBAiY3hb10gIz50bNk5XriRpfaEjsqxBTySX/KFzc/zAbXwjXTQ6FsHiKBEAqbnDx4cvDlcJK4M6DkTdf+OMIQMqgjWE7Z5ogdZgePVD90GxZ8mj/PhzdiT1UH2q+skTGhyID48rGiTg7T9+uGKrf3KAt53JhHCw/+NCsUc/ZY18LQQMZr8QF9oRJCdL4JtDdMkchr4/q2VKaar0lWbylUeOS0PYGlGtwvZyy8M+rkEksd0EM6e2MQRwPQO+5Uto5iv3PsjRR72yvPVpH0YbNFzsfTth/eK7iObuqAkcKw1gkb+aGLxf3hnRJ8ZoXUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HDj+QDjhBelpbStj8jZgdzE9FCzwzbGpviKNmsqLmE=;
 b=AA+974KmMuv3M5seXDkWPd0cRgAeBlmHKbawKNO3OWKFFONRk6lYSQs46TcnbVbCuseZpzDXv7I/bNz8TalXU2zqU8hUw7AdaAyqdI8ScHvzZKWek7DB6LubHEJPNl6fWcBXaNgzuq1w38Paeda4TluWqTeJBoIMwEsRWrj3d3J8NmZgEGdGHrLA1xYuQxTx1q92BMKsZJEz0EJmJnq4HjrcmB/X5Z669LH8Icqe29eQ5RFgcZn8luC6UEKPpnmZ7dwccQkTMy324LdWlyto8eMuTcvjNU3TUKi6VYYm9FZz1hs032+73ocAFRYxVv207BBPvbdy6XohM1kQ6mrJ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c7be91c7-6010-1146-b6fb-92d4793ad49b@suse.com>
Date: Fri, 28 Jan 2022 07:48:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC] xen/pci: detect when BARs overlap RAM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220126122648.52275-1-roger.pau@citrix.com>
 <8537763d-2601-4092-f70f-1abbdd0a211f@suse.com>
 <YfFshcEanUtXUlK3@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfFshcEanUtXUlK3@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28a02d44-aa28-47ae-4deb-08d9e22a3b69
X-MS-TrafficTypeDiagnostic: DU0PR04MB9298:EE_
X-Microsoft-Antispam-PRVS:
	<DU0PR04MB929808B2DED5C4D6D3F577AFB3229@DU0PR04MB9298.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Snz5bHyw0oiLBcgiX0weLCLwFZZxwvIIKOMfL7i82uMUBdXR+laf1yS6Fl3Uvwhg2odO9BZGR4Ut4v2lqARWAC9lwu4ZrPQPsRkJ3n4CewihrhHYN15yR7IEJ3Lx/GU1vfZyFDAxtcGACMbYedwxF0aKJVAmPu35easKSAwiexMW503Q96skuwclHupH0elZ5Cdq+6EiWEBBYdNU7JsRc+ZH1KLh+LoCXmIbto1gKRVXXsNZK/RjIRTl9Q601BHZFN+fpAHmsoi9O7fo416YV1nre8VaBmGa1HxrgSXMP3wpJ9T7QzK99A+ldp/kfsbbVkWVSAnWATikdajMt1j10UIbSY4YKDC3i/42qO0C0CPhtP2Cq6m9R6Ei8ZwnP+keBsmpTU+gxtTZUnVPM6lCtpw8g/QymcBKDeDJourACKxqZocxNsSnMO4+BSuZlM4iMrCe7XEfvhk93YX5BOFklAKxXWNaHKnHhcUfo6zddZp2JowkHxMnIb/+nrggnM3AMbbvueYjMsPMliXqcJKJD6DO2NYRRWfgG94rFBNiIwwr8n3D0F1ZbDRSLegCbmqDy/fSsVBs02YpKChm9K6lvSmfgMfiQmwHtPxs4mjk825/OQREAV1zgfQeqgL3t+DJyORm5pSVhZIYjpTrJbWpH58JZg9W6UjlkvSXH+OtGJdOQunn52DA8Nb8klPwnOVKs9EezPpgUzTtpmwG0PlXcNGl/mULr0A14Hh+AtJjDqQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(4744005)(86362001)(7416002)(36756003)(4326008)(5660300002)(8936002)(8676002)(66476007)(6512007)(53546011)(38100700002)(186003)(508600001)(2906002)(54906003)(316002)(6506007)(31686004)(31696002)(6916009)(6486002)(2616005)(26005)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GuSlx///Y9pH+fJoiddc/urensthHW0MFOmQhTW+S26++VCpiZE13Cbsa+8y?=
 =?us-ascii?Q?xxQ2rb8DjE+jsVPtx+Cz1JpjY2Q2zpSf76rtbo2lrth8j6CJXeEVESMGX2L7?=
 =?us-ascii?Q?E8BlJGaOLLgwNJ45zyQgJqnYufC/5qlFdmHfb6ROfx64HmB8x3vDTW+dJ2TV?=
 =?us-ascii?Q?rAiC2APwBv4xqh+qhkN0kjEjJflDJnTgWLV2xE6cz2yYQZClvamvLGZOPiY9?=
 =?us-ascii?Q?odZmcV/mvNXMDzJYbmtxg9OE6G5O0rWeJJvuBfSlnmiTBpPnpTrzFo5HJBUT?=
 =?us-ascii?Q?l45j+9BxCjgtZ9vffTwcgA0UlVjW/PXD99IQj8Vygu0AUottKLt7bEgKfa+/?=
 =?us-ascii?Q?7VBG3S0UeJMjHmICSWyP/Ri6pT6Awe3+1ojBRP27AwNEO27NuTHLMq7YD7hJ?=
 =?us-ascii?Q?4DgUJh3g7Ta5ipfniLrWQqOvhdiEzxTppjJfv8BD/tCE54rP5lDaz921jM5+?=
 =?us-ascii?Q?cCU78Z4n3EhfiwZXSvcEEHj4vdChzVPBgkZSk4tLVDnsc05jv6iRS0g8bQh9?=
 =?us-ascii?Q?anafQzXmiHaqI0R1mhpJAj4goMIzMfiMhyVYxCae6tbUZ7u0byPofCJ/C42N?=
 =?us-ascii?Q?iXLU84UgOQNHHebGRKSZHJ4PeQEyzyvaIjfGdHNAzjHxP/4i517YewuaVbJK?=
 =?us-ascii?Q?9VuglMqlRXWcZSyAfJPyJeTxkrmoCCRcrBfte8PRB8bHtqOYI+diTbkrPJW3?=
 =?us-ascii?Q?ieJ/v6nnS3TjkmtJzYuRvTAv23j4WtHte+2WIfkwAKzlY3hW8A7L+Bgh7jj/?=
 =?us-ascii?Q?cHpQmSYXdsMmfwWT/9ckXjucrsRybji2Z5Zzlr7wqblnJBRJh9dK7+2gFx0t?=
 =?us-ascii?Q?gooDHWhv5JOJ/qkZeHgkfo1ZY2vjERjTk/tzHmckrk56xQybAKvvXxzteP6z?=
 =?us-ascii?Q?wCSJ3sOaS7NlFSviJ+tNDTGjmZ8sZgfXacA3TgNizcsR+Zee4LWlmGT8p2uz?=
 =?us-ascii?Q?X2Qu/bubUKA9YOR260eP4wE5RWGLjmVIC4Q9JcTv5gf9jCk1ORQKYVn/pSAz?=
 =?us-ascii?Q?oqJleg9Bv4BCnVSmmClj06+EGfEYcOwY7FY35h3O/HslXz2Gi/EQ8XtSmh4u?=
 =?us-ascii?Q?Xjj0V1elDXk8F61xygDi+2IrDEYDu1T/wiV6FquVg6cp5xKFdthk9MoPnXHi?=
 =?us-ascii?Q?bOlKvP6QTNMgEfYOWLU+bZ4FNwym7GAIWQaiD+UBhWMK+IkF4I8XfsosZLva?=
 =?us-ascii?Q?GPYEqNaYCZIqq0P+ghtTPZhyf/JqKJieaa1DDZAaI7veh0bsgk6ZKgSeC4Wc?=
 =?us-ascii?Q?LOPxx+vofoE4aXiL70AkZQD0/Naf1Qonl1W5oni0etB3Du8kolHSVesyf+OW?=
 =?us-ascii?Q?o+CnzPxKPtdZAQmT455Q3YMmAoeI+7XgdDpJnAcvbfnuNLhPfkb0lRC9N3ZE?=
 =?us-ascii?Q?FAYKKyjp30C/tnoKqHs/p3bIybilonyXfBbCLHcjcMTUW4kVN5h/oFHAT7cU?=
 =?us-ascii?Q?FHuL8A4idMcV38G08HU6WKeSYybR+J4kxg2ilx9xdcOZ+luLjbBRODcRcj7N?=
 =?us-ascii?Q?1rqUuVnZrJsBWoX+q1Kp90qHq0Tg4lKlSVP7abDRCJ6A38T/IFt1gB+udXXW?=
 =?us-ascii?Q?cAtpp320wWp3spXhsAtmL6KyQtHw+Ou/mNpAyrNmawwrWUvWGct3/XXCX6ms?=
 =?us-ascii?Q?qgosymt6PVh3mY7lHaTJn78=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a02d44-aa28-47ae-4deb-08d9e22a3b69
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 06:48:46.4615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEeyOcMQ/hMGckgL8XYCNzSSbIzfw0GuZYDVADFtN8YkXBhYRiVzex1rMp+cdYGmE0uRrixgnyUriPhFu8FuWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9298

On 26.01.2022 16:45, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jan 26, 2022 at 03:08:28PM +0100, Jan Beulich wrote:
>> On 26.01.2022 13:26, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -479,6 +479,26 @@ unsigned int page_get_ram_type(mfn_t mfn)
>>>      return type ?: RAM_TYPE_UNKNOWN;
>>>  }
>>> =20
>>> +bool is_iomem_range(uint64_t start, uint64_t size)
>>
>> Might be nice to have this sit next it is_iomem_page(). And wouldn't
>> at least "start" better be paddr_t?
>=20
> (paddr_t, size_t) would be better, but AFAICT size_t can be an
> unsigned long and on Arm32 that won't be suitable for holding a 64bit
> BAR size.

Talking of representing the range - a BAR occupying one part of a
page overlapping an E820 entry covering another part of that same
page is going to be equally bad, I think. The range may therefore
want expressing in page granularity. This may then be easier as
[start,end], at least on the calling side (can use PFN_DOWN()
twice then).

Jan


