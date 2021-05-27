Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E47393015
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133470.248753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmGLX-00065x-La; Thu, 27 May 2021 13:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133470.248753; Thu, 27 May 2021 13:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmGLX-00063c-HG; Thu, 27 May 2021 13:46:47 +0000
Received: by outflank-mailman (input) for mailman id 133470;
 Thu, 27 May 2021 13:46:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ln4B=KW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmGLW-00063W-FE
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:46:46 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c81b972-0b8d-42fc-8f08-2c70236488b8;
 Thu, 27 May 2021 13:46:45 +0000 (UTC)
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
X-Inumbo-ID: 1c81b972-0b8d-42fc-8f08-2c70236488b8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622123205;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4fGDbtEoWzH6UNk042ImkReLBj8Qmlqw2slhI3a/OF8=;
  b=b9cNzf+2fLpht+wS5hfj/lgarzBn8a77djTa0sQ3TS25SglgMk+zdUep
   B3eZPqNYxRaHgtS9odgQL1JMshgCfKSK+JdIYl0+3aRmnKfTVT+DW82x6
   1sz7oYS4St4N116yRIHUolzSQZcogoJhRGhlbwAsIU85w0ZbQU/wS7exX
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vH6fCUzyAP7LZcXOujOZvGGMXwpCtaTDnVkb2wnB+9DVA+P93/Qa/Mh04Y3lWk8jP17s/qh6ra
 5/Vzq0aQk5umyYej5Vt9ABpx+0jB50lrO2rKkSPGjr/Zyn9weEZNRbSomoLwAYdxnmiu4fFAAz
 oB0iaRXOvHewb4yDfacVEd7ETEfGXZrEutJ69VeiJMdFQ29P2P+hs5wtcjOjPRwp6eGYe15sQN
 rmF/FEXGY8pv0Ym7PK0vT8FHIZpkhLr3FCAzx6BC9RYg/4dK3rUJg6bzKlmbq7SMjIYsrv8Q4+
 H1c=
X-SBRS: 5.1
X-MesageID: 44747580
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:U1dkP6vj16kmshsVco91P1sI7skCToMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXqF+rQbsaG6GcmT7I+0pRodLnAJGtRdBkVCe32m+yVNNXl77PECZe
 OhD6R81l2dkSN9VLXLOpBJZZmNmzWl/6iWLyIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH5zr/LiYD59jbsk0voq7hGktrozdVOQOaWjNIOFznqggG0IKx8Rry5uiwvqu3H0idrrD
 D1mWZkAy1P0QKUQonsyiGdnDUIkQxeqkMK8GXow0cK+qfCNXQH46Mrv/MqTvPbg3BQ9u2Unp
 g7hl5wGvJsfFr9dR/Glq/1vidR5wGJSEoZ4JouZkNkIP0jgZ9q3MEiFRBuYds99ByT0vFuLA
 A4NrCj2B8RSyLDU0zk
X-IronPort-AV: E=Sophos;i="5.82,334,1613451600"; 
   d="scan'208";a="44747580"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0FQyivuLqnUfS0M2tawuRgeJw7IZTre1S1LPvrI8V5GA3MAz4Bm5z+Etj5g+pC7K+ak05/JenifRxpYZFc9RO5tq3wr+el//mKOgCM+4GYjg9TK/brF6Xqqu1hhEEA6dadhcYv0IpBzx/YbJdZlwJujaKqlHKY9l1X/EWP85El9Ht6d5/UaK74iGPNwghQDIWExc8ZjMntRNWZtVJ60I+yRy7zItgRVSPm7SYkDKeqD4A6pcG2xiVKgzekrnaHr6wgj1nnQFHjtR9B3QFrVGcY2YfTQV2dgUwIyz9GulKORIAqBSfD0YqrcZ6Wws78eO5xpQFdzBp6h9zr8kL55Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rflu3yQzBzaKqEEvZrK0UCJy5FS+Bo/jM9IWyELmBAk=;
 b=j7peeh77fmuJ9gWutMylWYTSMnnEfMUvI1n7mVxMebACeD3fptOjSVxta6QsAq0h9NLCEbfULhee7IfzA1n/sv2WNBCNPLOFG+IWPtSzLgTPG3KgOSw4dVxqYGaX2C1ab1RA1Z+WOsy8eLdO39Vc5CdUrEO6yRqsE8i+BWl9GOK+S0jmKNtz3fFRS6uqoWf+gWw87bnWFTrYhH1hmuzxeHdubKKChOPIPY6cwTAQYDoM3x7sy5PF6YkscTkUyOQfdrUetunNbyiim5E+S7deVJ1wz8LjpavSKixhf8h7Bgd2dwVy6murpTnivR8/nTGBMl7gPKnQobmowp+t8qEeDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rflu3yQzBzaKqEEvZrK0UCJy5FS+Bo/jM9IWyELmBAk=;
 b=jOX2XZgZhjK6b9m/xLFvK1iH/rdC1d+yVfFTTPplhj9XVQoFUoWoto2cvYd58ffFrPrO1v/0JNNbJijSn96mg5bco8rquHtJLDx11YWu6oSBgUkmjaUElgQzQtCsGq6qnujMcy7e4hZGyyq2BiydfERYYe85YuWKkpg7/fjGVFE=
Date: Thu, 27 May 2021 15:46:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/3] evtchn: slightly defer lock acquire where possible
Message-ID: <YK+ivBEno2iuHeoE@Air-de-Roger>
References: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
 <5939858e-1c7c-5658-bc2d-0c9024c74040@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5939858e-1c7c-5658-bc2d-0c9024c74040@suse.com>
X-ClientProxiedBy: PR0P264CA0055.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6965fcca-5eb0-4939-7789-08d92115dbc3
X-MS-TrafficTypeDiagnostic: DS7PR03MB5606:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5606DD38F151F68EFFCAF87D8F239@DS7PR03MB5606.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ByEyysl4FMgzdcd24EsHvT+w8NI15HHYKvazfvAL4tE2dSr/FpeDjr1SbqXBv69wmmRtbPWqcPIaE3owqHVljXeeVFLMcg9sFPTmnjAp5UoSIFqsfxYB9McQHJS9AJA2k+MXdi8UQOFAV6HkITlsufppGcACb2WApSkd7nVe/isJU8kTU90cHifqLHpY3Pa6qPiWZTEVAFIoljM9/fy4B+lgKzSwyHYkiAHn/P4AzieyJaVPEAo9Oyv8yaunZ++mO9c5I65OT8PtHNjvtHWjvx9uWu+LDD7fwuS9PSz04tnfXBlc+cfzoELl3E6uIvXcSddm/UT9hQ9c0L8LmxlmhnTG2c1tGdUCY9ZO6SdWFUStklPM2AEI/qlQISVgR6WOcUudxdz/ClyQH5mQnpnFiADTYasQjxf6YOHfwpOzco4KVoJssxhrtYHQaZL5HvEsWND9s+gLx3o6lSpZmYrs5/37l/Ssuuzg167+tuHbux/xOdSIPGKcZtjUUwI5YtUTtYzlfIRVmOAUQPIKo9hFP/xP/gz84RLFJ2D1WDHkYcKy4738gm6v7HKol51KRlh9bnPnAz1wG0apRG6BTkQsdDSNBqeZ3SmffA5kKUn+QiwAENXda5Dn5WSP+cvFg7BKIvnc6YD/CLQuTTsHzxfMQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(346002)(366004)(136003)(39850400004)(396003)(66556008)(66476007)(4326008)(4744005)(8936002)(5660300002)(9686003)(38100700002)(2906002)(956004)(16526019)(86362001)(186003)(26005)(54906003)(6496006)(85182001)(6666004)(66946007)(6486002)(83380400001)(6916009)(478600001)(8676002)(33716001)(316002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SU5UTGFrVU9RamNvaE1TSEZjK1llWlBNWEZoQ1EyVWJ5dDhNY2pxMzhvNGFa?=
 =?utf-8?B?UU9iWUtEbi8vNzVWUWZUdjM5akZ1SXUraE1yQzRpVk9nckQrOVFNZVM1ZExp?=
 =?utf-8?B?d1lGT2cvUUtNbkR6WXZXWjN0VlV0MzRVUk9wS3FYSHpONTEwRlNqWVBqMGVE?=
 =?utf-8?B?MXVMYmpEN0kvN2w5a1lROG5ydU9JbzE5RGdCWWIvUFlMRUgvTW9LOFhRSSsz?=
 =?utf-8?B?UGl2WHJtcEtwSXdPTzlyaXNGd2MzOUErUUZ3Z2haOGozU3RtNHRLeWhtL3pr?=
 =?utf-8?B?a01EWGNWU2xaZlpNMy9IWGxCdE1DVTJOTGdOTWJ0RDJLNi81Y28zMzRmbnZF?=
 =?utf-8?B?VHZVaG5iME0zM29xVi9iSnlRR3Y5SXR3OGI0K1B2K0k0ZC9UK3ZDbFdCeFdk?=
 =?utf-8?B?TnppMlRDUncxcCtPUWNBcGxZNDVaRHJTMHRraDAxMjdFWm9MZWtEemliZ0ZG?=
 =?utf-8?B?LzBDaitQRW0xeFIyM3V5NTlaajFLdmExb2VBWHNaMHpyUWduNnZBRzhxZk9u?=
 =?utf-8?B?ZmNFOFlldk9FWmh3dlYvOTlQaUxMWS9nbE5UVVd6dzNIUVdhUU9nSGRKWkRD?=
 =?utf-8?B?VEE0M2ovVkxKSlQ5L0RlM200UmVPSCtrWlZCc0hHYkYrSDFxRG5pY3o4bU1R?=
 =?utf-8?B?ZUxoT2FYTVN2R2dlaTRGOFFZMHF3SGk2RnV5SUx4TVJKZytKSVpZWlVnUHBs?=
 =?utf-8?B?cHJhM2docmdhMVRjdmJqWEs5MnltSWJteWFudUwveDQxUXpiQjl2c1ExYnFl?=
 =?utf-8?B?L21iTGxVZ3JXVk83Z3I2cDFFM2dqRHlNVFhNZ2oxaFVNMlhXYWFzbHMrZ04z?=
 =?utf-8?B?aWtNMnY0REI3c25nSzUxQkgwaHp2RFF2dUQzbm1qWDRGQldrREI1OVFPWVpR?=
 =?utf-8?B?K2JKd1l2a3M0blgyNXJ5M2FHam9zL1ZKUlN0YU16dk5CSW5kNnVrVXlUck5G?=
 =?utf-8?B?d1kzL1dsN09jYXVzVk5qNXdJYlpCbGV1blcvUTZsaEdxU0lzT0ZOQWtiOHJV?=
 =?utf-8?B?d2VpaXhRZDFmRklVU1V3Q0tYMzFXVjg2dVZvUGpJSlU5Vk1TeXVKUWRvQndZ?=
 =?utf-8?B?MVRGQlNJUnVPendtOUwxYTVzK0RBU01qMldGWk5XRk81K1IzTko3R3Jydytz?=
 =?utf-8?B?cC9uM2FKaUVLczZXdW5ScGw1RjNDMTRpRTdjRDZLUTZWR1ZrTGp2enlJei9u?=
 =?utf-8?B?YkpVMTZkdmxvTEYzZlRiemdYNDRGTHp1ckFNUEpWMGV3ZHFJSE9BYytoWXR4?=
 =?utf-8?B?bi9JQmVWWHJ2bm5MR2hMblF6Sjlya1luM2dwbnpqOG1qVXJxOWdtUU95aUY0?=
 =?utf-8?B?UWNKR2VqODVxeERrUnc5by94bG45N3AvQWl3c1Uwb0FTMGIxbktETFVIZStY?=
 =?utf-8?B?dWdMbGIzL2dza2V4VDFjWHFYNzdFMG5CMFZEMC9ZdmYwWWtkeUYwY2dNMmhC?=
 =?utf-8?B?aGJZelVhMGNIblRIcEFTdGJrSDZBYU5RWVlJU3V4YS9iL1EwUGphSGhacVJ1?=
 =?utf-8?B?MHJ6OGlTWEkzQ2FXcm5ibjdvcFFFQjkrQXBuZzNQeUZBNWdzdTZ5Zi9hRjl1?=
 =?utf-8?B?REZvNTJlWWhjL2d5WEZ6YUpSVFhJc0pOajVqb1lVZnBiaVljdU5UZlR3Wi9N?=
 =?utf-8?B?OG4zUUVTVTlMbW5yZDZpc0xkRGtyYzhSSk5OcVNpRHFiNXVRL1owbDFDVVIy?=
 =?utf-8?B?U2dydk8yUldFY3BmdXd3VGpicWVXS1JNcjB0aWh2aUtxM0RlTUp2QlBrazBo?=
 =?utf-8?Q?611A+xvm7CCSMNUwIBGz8+iKoQfCjdvepE6FlZt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6965fcca-5eb0-4939-7789-08d92115dbc3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 13:46:41.5771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtxdX0/SrOPjOR8Y/KFHM4XyWQ2nT7DC3qz6RgLl1T2F6NmJbvRUJ+YGtMJPgmLQMENMJ11IzcOI/EsGaze1Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606
X-OriginatorOrg: citrix.com

On Thu, May 27, 2021 at 01:28:07PM +0200, Jan Beulich wrote:
> port_is_valid() and evtchn_from_port() are fine to use without holding
> any locks. Accordingly acquire the per-domain lock slightly later in
> evtchn_close() and evtchn_bind_vcpu().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

