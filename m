Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB2450453
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:21:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225872.390167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmazL-0008IW-M6; Mon, 15 Nov 2021 12:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225872.390167; Mon, 15 Nov 2021 12:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmazL-0008GP-Hk; Mon, 15 Nov 2021 12:21:31 +0000
Received: by outflank-mailman (input) for mailman id 225872;
 Mon, 15 Nov 2021 12:21:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmazK-00087p-9D
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:21:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f968181-460e-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 13:21:29 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-kVGN6orHP36SY6NkSVmKbQ-1; Mon, 15 Nov 2021 13:21:28 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM4PR0401MB2369.eurprd04.prod.outlook.com (2603:10a6:200:53::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Mon, 15 Nov
 2021 12:21:27 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 12:21:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:20b:48b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Mon, 15 Nov 2021 12:21:27 +0000
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
X-Inumbo-ID: 8f968181-460e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636978889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M4zMd4CCzz/c4u/RExdROU+OIh/jY1Mw5SUIQH0nMKI=;
	b=efY4zA+YcIEAW3z8sxuWM9LHYkl5zmZFx47We3fXjs35VD98yWCwp3F7IQWIXur1s5+c4d
	fT9WFM60LITr5+PZBWUdHlGjHb4cL+W3Y+ahC6vTsGaBJT9/fwACoSdRcQYRG7ae+HAwDg
	GQd1cJ6aICVRRxB1tdki8URfqwo56Zk=
X-MC-Unique: kVGN6orHP36SY6NkSVmKbQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrIqfMqyoaUEFXyGrD+SxRBLVnWEPmePLsndz9zXZKJfRyTQRzaxCfREeZPcdQeuzELaR3K1p51Z7LRX1xfXcKh+N5sHAc6Cxul3Q35a/EU5xMEhn7XwgcaChsqVX1rwuRDW799KJpeX232FyjrPf2sb7ZVyzDFRrV7EiUiWU312OUZHw3Jxnls0XLq+a1Dw2NdEq0w6xqf/xyf7JozdMjaBi4Jf55vlp6C65V61/d2B4QAra/KXADzQhqj7Kjw9XN10alBTgNqdNbxk0AOZOzPhjRt3Q2OKp/lEs5Ml9Ax53+2EgZvpOTMhtlh3KJGxfsgdE/3Xl1ny49bJ7WX7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbUnondGCrQdZ8lyXLh39tdxTfLNU+0exl2H3Cl0qqc=;
 b=Ho+Ipjka+xU/W7gmX1IGA1zMIyT3J0O5Ni7aJgxM31nKj9EHz4u6Q1tplQ/WCJXz8OrzF0P4ktTI2RddVU4MEDHlGfslaTOtuwSw8gBsblVofesSorrYhAx7lOXKVttcQF1tz4u7BREUUoygQMqWblqezLrx5v+ZVWA/U24g3/EbHAY/lMbxawFssmPy15AmPapMG6uEB2pbBPNoAtB/wngbr7/TQH5aiPht/R82qqOqYuy6cZQbyg3fkYkZM/nLy/DTFX71tkWrySEPcISuk2lCEtKN8PPoBECxMG8GO2ELR3UfRCsohlhhB3vV6IRskNdrGpOrGgA7WJstNuXZaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da097321-028f-0558-83e8-c5abd08a5504@suse.com>
Date: Mon, 15 Nov 2021 13:21:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16 2/4] tests/resource: set grant version for
 created domains
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211115121741.3719-1-roger.pau@citrix.com>
 <20211115121741.3719-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211115121741.3719-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::24) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a6c39cf-819a-4c46-dc57-08d9a832727e
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2369:
X-Microsoft-Antispam-PRVS:
	<AM4PR0401MB2369D2D63EBAC982D3E3109CB3989@AM4PR0401MB2369.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rJpZs/DTG/GPFm3J7tWrbFeqDQ6QGGTgjI4CwR+0t9CNOubD01MlgVuWwvtdKI0BFlOhqlH8wzwf4HnQ8onJ4BuVE3tzVkZ3nJlnNVR3Z5pFtc79qT9REbulCvBgENggL4CHnJcBls33RIgOdrE5B6gty2m91yFhIa2N4CohjFl1MPVKbFgsMraK3ON73Eu6dZ/MFS9Vc7KL5f2xi2ttWC7swG9wZfb1lrujs/wuIO6ut5ABJhplKXWZoiaP5p1a/2C6qJL0YW2ckwSdeGTNzEF3Y6kZ03o2e2+V/gPIhU+dW7auvHpz0N1FeH1h2KDWkqmCqWsZyHrbQrWLMplaVMrwQgjnnVDK6h0+7fzkGm3mUeSVrByDaGIXCxFZ/LQEh9s9HWxqYu5oRiqnp1ypm5pJ7v/i3SYeXetdBNHu6ZpVpq17a9ToeiH86ie9CqmV+aIl9zgmeCfIHNvS8UtGW+NZHs2apDtNs1KIIdJy98Qvs3mBOPsmNV5dZXtH/UdbQHPYjlqdmS9YOqIDgdNwSoIW5/KTjOWQRnSax7QMurwhpjA+H8kRnhjWVGPv150mUKU28Hu4UZqioLxAX8fgRw8Sjo3vJobTITin2JGM6LG2SPo3AyM6zhbsTHC2O1IvUh1Y2jiMYcnlrKO6eEd93xFAQ1blXT6dQlT2TEZmXft6bFUY981uXViuy8iBmL9MUWphKHgJcDOI7KEJDmeeJvu/J/ekQ6AK2OPaMGm9ESobdROvmDDPJu4NCm0RnXpz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(66946007)(86362001)(956004)(16576012)(31696002)(2616005)(66476007)(316002)(26005)(186003)(8936002)(6486002)(31686004)(5660300002)(6916009)(66556008)(36756003)(4326008)(53546011)(38100700002)(4744005)(508600001)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VIyY/rOU2AS7/dzwISGgw9fYED/6k8xL5CFW2bdZZYKSLnMXPgJl5mZ6s57u?=
 =?us-ascii?Q?pA496on4vbLjjrB9dd+mfP9LsZkAKL0CWmX9bI1wjIzY9ee7UgsoUazYUK0j?=
 =?us-ascii?Q?wxti2TCBkx8wp9V4RWMqRh0ZbSkp8C1WtoTHnmDRwpz9f31EIcn5f+vXVHWg?=
 =?us-ascii?Q?E8Z/zfA26nnkHond9w+P9NMGFLQFKpi1O9CRA2GIChw05Nt8gQ3g9Fsm4rlH?=
 =?us-ascii?Q?X/DgEE1iQ9qq1wlZn5X48/poaINKEJB0Zhs4xdVD1c07pesz4nnJG0RWy/Xw?=
 =?us-ascii?Q?/A8bWb+USKozRC6Aeb9b/akDFnxoJgL/mIBtOLDfeENnsKfAWB+CT+KRkQEp?=
 =?us-ascii?Q?gm8AGjixGbyWKObuAcFPMiChRMcwMHFV8WshRxuKDb4ttvdCHuCCHgetRZj/?=
 =?us-ascii?Q?OMnUBXJCJTpU3atF8jgarfS4lP8eJ0wnwb3JfQ+0d6m4wZtLV8VGKVJxYP3Y?=
 =?us-ascii?Q?blasKP+snUC+GiBXu0yJPFwel+hjLM6nWUpdOR1OKBT6R3b72BiAeLItdabH?=
 =?us-ascii?Q?I3y+39BmeeLgg5qfEucQdlqno/CgIoupnAGan1pTrepZvOZYG+zhmSFGQDpj?=
 =?us-ascii?Q?RWd/atQbwWUZklkIZPjgash/L0rnbdkBpxY6MuOZEchGWOmBw3nYr49AsKhF?=
 =?us-ascii?Q?QANQ5eyK6zfrZj+gCDNcQHCnIMpeQ1IjYZniy2xB4Ka5bbV+kFm5Gvuql1QN?=
 =?us-ascii?Q?KCZ+e4s/7arFoFAB/r+a2VsXaaTDu6ljBUm1uRXCvAxGLHMB+7Hy+Fo1L+q6?=
 =?us-ascii?Q?0rWAH1YfFSJt5frY+d//2Wu9AqlvoTOg6JZy+YYDgnK/HjfUF/PrFNXkTHdM?=
 =?us-ascii?Q?sAvygA4mwQQN3tBcZ0LokfDmdKGxLt/GRMLtF1ZVoHJdG5iiyo61EE2o2gwz?=
 =?us-ascii?Q?2IjULKiMu3tycClyKQSZa8afJmDNpUUhSyNminigCnpuK3aeVGkp6PawCH4v?=
 =?us-ascii?Q?iuXGN7vkNi7GKrQVCRUGlcsIFmyoVdg1PFgcPmwWQFjd3sF5vL0yU9t4/L9H?=
 =?us-ascii?Q?2l3bJw/8FvCUH5TxdYFEfstCNblm0e62vgXrhrhu8QW5QVlzZzxO65RFSOSG?=
 =?us-ascii?Q?QYrailRjwVRLboDJbomdUjPnEIcTf2PX0PbtZDoH3WKuEdIhP/Y2N9GL1nHe?=
 =?us-ascii?Q?UFJZPdsb+5Q6G5/fP4o1WDg/xIDd1uxUR1UX4nFSbA/vngzCassc/KnM2XoK?=
 =?us-ascii?Q?ltiIIsWAKdW0zWEMdYek1W3Q7rGd4bgkHg725v8RnWydX1MJSPhwSahNz+g9?=
 =?us-ascii?Q?f+U+X66nTyD+1j3ABB74hQj2kOdXUOGbHbnnArWz05Uk+84WUQKlK0Y0UQgD?=
 =?us-ascii?Q?iCDw41/swMOvshOjaAoNNG/Psa5UEhsW2/8wsoLwL4oC7Clz7TG++HVhdm90?=
 =?us-ascii?Q?h3e2tCzvbvkE4/NSgug3VBKGThfr3Xs42Zk2GFuwoGTZL77/h8sym1hvOGve?=
 =?us-ascii?Q?g47hORjD7BWVYVx/wPOOx5EtUO6JMbJeZwnplksApjjGc6+3E9/Z3S0Uwh6V?=
 =?us-ascii?Q?SziRHThk6qlGY9HcW/OiX03z5l5uUfbDRY7ThyYJj9Xgl9t93xDBwf+lAUw1?=
 =?us-ascii?Q?8f0eppsVWXChCwJn06pGExotyuVmJyqK2udxBz67bjARpribsRgf8mnlsH38?=
 =?us-ascii?Q?ICBwjgpmbAUfXDDbuumtxL0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6c39cf-819a-4c46-dc57-08d9a832727e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 12:21:27.3632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poZ+14VUNhqhmcNT9/R6BgtA2GXPCx2iihhSJhUbYNuLZExWmL4SUCdYxB5J7s+ynVTeutM8bDT36ILITpBNqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2369

On 15.11.2021 13:17, Roger Pau Monne wrote:
> Set the grant table version for the created domains to use version 1,
> as that's the used by the test cases. Without setting the grant
> version the domains for the tests cannot be created.
>=20
> Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


