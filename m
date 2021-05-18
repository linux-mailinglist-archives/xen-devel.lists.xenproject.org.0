Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C33387B1A
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 16:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129279.242682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0ga-0004RI-QO; Tue, 18 May 2021 14:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129279.242682; Tue, 18 May 2021 14:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0ga-0004Nt-Mz; Tue, 18 May 2021 14:27:04 +0000
Received: by outflank-mailman (input) for mailman id 129279;
 Tue, 18 May 2021 14:27:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9UfV=KN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lj0gZ-0004Nn-5u
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 14:27:03 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e43e93e7-fa7a-42e5-9f53-e7a089f356a3;
 Tue, 18 May 2021 14:27:02 +0000 (UTC)
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
X-Inumbo-ID: e43e93e7-fa7a-42e5-9f53-e7a089f356a3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621348021;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=n29HjX0WQ8nIQ/X/SgZMOi6yhYglU+HENMd35asfXdI=;
  b=WsrbA9JJxEEEtNWiFKf69YWXkUqlHD66rwVykeUhxPd4KZrDWDUR8/oh
   q+WXMmqx8EAywVLj2B/ML5500MaPvl3y4/I0pn2rRfQkf6Y+PClJBeui3
   /EIUyXq6iaVhDpCOOPEtNresPjQuuTMHtsAgG7MtbcYA68ofkryVIalKp
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +YgaiWr9bGJip5GtOYgkHMbEWYzp1uT3EHXwjptk9zQLICfH5U+UZ3ssv9E+/SGFCkpAq06T/d
 RHWJ3DUeOGQZVt9o41FrwaP80i2ZNAu4kKY/pWn2GNOmBSmrZOdGUHKfzCusuEkOhHrDfaxi2c
 QrnNZyzWvw3H4/JNXlH4lrwap+Xpdwx/o2CS7O5t9DQzK+6otf4cq7bQH6pTyQM0kib6p1NKNo
 8WfPgFiE8N75W+nILyDd/B8lPN6X5mLSCHWwpolVtonjG7NfQD34eLSgcBggbrz2DIs/KTZAXn
 FYo=
X-SBRS: 5.1
X-MesageID: 44034907
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fH1AeKMIqS91QsBcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.82,310,1613451600"; 
   d="scan'208";a="44034907"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obESudzM6sgOGOomWrUZ5F277v5v3AqBTMemo3eLjL7EZiyvJ9XyVe+uptjsoowXC0st4yw5YqAc7CLsX+k720ctP7RTYte/K3Yvw5E5EpjRb2Ap5nqKbxf4M5A1Z+2elbZinClJhVzwGdjSEKAZKKfEcW7i/+hSVsjPPKOhcpw5FdCNGj8dA8gZlNl/B6KsX3tirnrWc1Z987a6KPsRWatKLkjxpRQ9rKdvI1h+SfgWscqOW6Bq/bTjK/1BkQ3WjZQzAEeArVrZx6hn0xjkiYu9Qz9mlofkRlRatXtamDMNEF4mJ4w0WF7P2x06FPGp60MsEeMZZTjWNdSZBRCJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFJzgAqhNGAANfFvgIfHiokGxfmjbaM78LQEcFqxtFU=;
 b=iwmOof0+0Yg1vPfePYOvE3dZt2QIkmswNPcnQA0nCMzWStPwWggMgO+QFdbA8I9T8r8/NBdD+YkJ91pW6qq50d6qAZrEBLd5GgptqfGWaAXrcE8qd7//OBv43a6sjIty4JO/9+kdnlXNjw7ZyR6O+dCYsQOgzlW63DBdqAIat8N9dY/4nmzwpZAJFH6C9MoItqXDUqi18s6r9H0+2cmn2YNhlm5lGpZLeP8j0ovOlSTtOD9XDZgQiLD46lO44haka+1DpV1wxPOeADdQUIwH3wOPoHJL96x7YdNI1ZCpCgS5+0JUjzZZ27rXYwIxLipkh0M5mIqIUJlo/g32fg5xcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFJzgAqhNGAANfFvgIfHiokGxfmjbaM78LQEcFqxtFU=;
 b=aCxLNPQ7uSJk7Njb9ryiTTA3TcgdXAFEC5ZHYxykAt+D87FVmXNTcHAujHRPr9IXnoeGHFM+USUoB9GuuUhOLqhSGgd0hVLO/tr/JXzhjgrNINag8xaPF/ftVLO7DoIE86ot3ScznvSX9XpoZMnKV7uIz6D18zDPK+LGbvrQoYo=
Date: Tue, 18 May 2021 16:26:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] automation: use DOCKER_CMD for building containers
 too
Message-ID: <YKPOqwiiXqOZZ2cO@Air-de-Roger>
References: <162133919718.25010.4197057069904956422.stgit@Wayrath>
 <162133944760.25010.12549941575201320853.stgit@Wayrath>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <162133944760.25010.12549941575201320853.stgit@Wayrath>
X-ClientProxiedBy: PAZP264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:21::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1936f78a-3deb-47dc-6c68-08d91a08fe5f
X-MS-TrafficTypeDiagnostic: DM6PR03MB4601:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4601AA32473FD55334C173738F2C9@DM6PR03MB4601.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lukjFZf24/I469+cgK4eYfNhZNqsEqeQw893e7dcyCnXnpSj/VEhWfRGk0abev5tMNPO0wG81LvTECV/DsIlVr8A/p4XaCAN4uA7TqeGeLPZiw9HmLsk4mCKv7BSuCMyAEIUGqeV7cug4ASJ3osSj+jxbQXmGcDzMuZzrpFK62yNQL13YFVLFo7CRVOArbyIviRWiK1fhd4Lr9KNMJ4B2onO2nSXXlg7CO0Wuz7ZWZsIPJQSUpJ5vEnxMtAoEoJOdrQSmU23N/Atp0kZugjCIdnaLkw8/T4l/uT8CBoo2At7bt0atQb0RVui8FEHdVDQfj/tATgH4ee0GPaHyVsokyhtxY2vFTMVyVqCvM5e8dYw3ASnNIvN9SmDCKOuSPE+0/7OXtve6GhoVhrVrPwQJkd4uwuDAN8hCypNR2gascp85CuxH0lwx7dlaXNUaxD3rShrDJMwz8t8h62FT3Ts/xtN8oT6tmwvkrsTrq0hCU5e6II87Abg/nLqgHM9di9h6JQqTUhlffAQzSa9bndp+5inEWKZxdnv2tfIMBMEEMozHOvv5vZxQ6EZJoKmBWPfZd2yG7Rg6h+5XpO+SAbAIrSX3iD7zRi2P4nCu9zMZoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(8676002)(16526019)(186003)(86362001)(8936002)(316002)(54906003)(956004)(2906002)(85182001)(9686003)(6666004)(66556008)(26005)(6916009)(6486002)(107886003)(38100700002)(6496006)(4326008)(66946007)(5660300002)(4744005)(33716001)(478600001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MklEUnZkL0krU2wvdnFoVzRiN04xNGhMZmd3MllKbGZXU1JPeWl3S0N1ZmlV?=
 =?utf-8?B?a3FjaG84MDFmbWJjVDJuN0dYVDEvSTRRODBlSTVDdnE0MHl4RzFINGdsdmYz?=
 =?utf-8?B?aHJEdDF5bG9ldWVmSEhvQ3kvK1ovdU45L3dnRE54NTk1L1V2dFNCeU1LcGNv?=
 =?utf-8?B?N3U2V04xUEMrYndaR2FMbFhPNkNZaXlTY1FOdlptR2o5MmhiNFNhSk92eXEy?=
 =?utf-8?B?M1BQbVNldzNVdlNBdnRTN3JYanhtZVJGZW1KeWNJRjh4bXhGaTYwR1pmd3l0?=
 =?utf-8?B?RFUxK3VzV2pJbkIvclNJZVZ1VDFNdytjSnlPUlg3QkFxSEYzSGh1K1c5dkV1?=
 =?utf-8?B?S3AxaTdhVFcyQmM4Mm5iM2labWtJU1hkZnBLMG5XQ3pVTDdvaCt6blJJMHBy?=
 =?utf-8?B?dVhFdGlHRDRrdlpxaDVoRk81Ym9wdzZ6RmsvUDg4dzY2dElCaDRDVDlqTGxv?=
 =?utf-8?B?Mno3R3QzWHIvUHROekdQd2lOVVhONmxybFk4LzBlTXlESlNxN2h4R2IrTnMr?=
 =?utf-8?B?dHg1VmdSTlRGdlRjSXI5UlFjNzY1Ky9YQjVRQmJhL21aUnZJTkRPM1dLdzVJ?=
 =?utf-8?B?M0h1TTByTUNsTnE2RC9YaldaMTc3K0NZRjMrREMybm05T1YrMlZqSjNPUHRq?=
 =?utf-8?B?YXpPckkxSlRZbWZGTE9UYTNMTVU0V2o4LzR4bVJDSE4rNFBkYjBGRFdOcnBK?=
 =?utf-8?B?VEphZEtRY1RjTmVhOUFzZk80eDB6WHZzOXdMK0NwcDRXTFp3R0hucENkT2Nj?=
 =?utf-8?B?dUdDUm40TzZjUmdsUVNCVjB4aWh0MDVKbkZTUlZlUkcvV0czeDR6aW95SXFh?=
 =?utf-8?B?d1Rubks3Ni9VaTB5V0pXWU5Qb2cwRWJlME5lbUZMRnVjT1Frb2dGWlZ2Z0ZE?=
 =?utf-8?B?d2tCeGlKblllbDdTME1VRTB2emJpRjNwckxZOUQ1MUM2YnhrTEtDTS9nWHAr?=
 =?utf-8?B?SkNjaHdXTC9IQjZhd05ReFJUSjlCc3JLMVRraVdVRGhRMlBkYXRqK3ovNnhY?=
 =?utf-8?B?YVFHQTJpdHFicGNrdzZkd2lYdUpVZEtTdkhmbTFEM3k2aFVpMytVY0cxd0xs?=
 =?utf-8?B?UjVoOXRreUNYMUZIOVlFaDkxRDIyY1UrNHRCMUI1YTdyN3lQNWNIVmY2c0RS?=
 =?utf-8?B?bUNmbTdxRzZyMWlwdXVOY0lvZnMyWlhFOVhQQk00dE4rWXFyR3RzVXhIWlpV?=
 =?utf-8?B?TERMaUprdkVWc3I1UzlhdklDSjBYNFQ5V21lKzhaVmhrRzdwL3BGNkZ1MXZo?=
 =?utf-8?B?YmxTRlUyUE5NUC9qTTROYjI3UTlVUVpNODUwK2puQzN0QmNGZFpOMzU0Q3VZ?=
 =?utf-8?B?M0FpeVk3RzV2VEhNRHl3ZUVic1pMUHlyMkxzR0tZNC9SK0xiMGFwY1ZoSjZD?=
 =?utf-8?B?NnZCQTVhcnFUOFh2TGZTeDVNdlMvWE9JSzlhb1lPSXl0cWtDeUZQbldvM1M0?=
 =?utf-8?B?STlsTW5saTEzYkdQRFFiZkpuemxQdll0Z1pRbHhBb2grN1E2Ymw5ckI5SjBI?=
 =?utf-8?B?b25nZEIyeEttWnFHdFhoQXJtWGxZSWxXOE9vdXVZUmwzME5Leks4eVkzZUlV?=
 =?utf-8?B?eGUwSEh2Ui9FVDh2UDhMM2pUSnlsSExrTFFHd3dBUjdyenFCUEpoV25PbzBK?=
 =?utf-8?B?ZmxPVVdTNllQQ0x0QVF3Mm9TR2djckw4b3VTd2kvRkJPWk5JdjA2OGYyS1Zt?=
 =?utf-8?B?VjF0NDhBaE5IcG5EdGZqNlBiZGNzWlU5VUk3cXRVTVNJZ2dnamxkcVZZR0hn?=
 =?utf-8?Q?XB/12RejpGUPty5G5/rFKz//+GPOw2VKmAP+l2M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1936f78a-3deb-47dc-6c68-08d91a08fe5f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:26:58.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbG2sRxrEeNzU8/S9Id2AhjJpgJJK7LgwETAQxyP3Dl2N6lmgxkiv4XjagEjAZj/GNZMdjEcE1SYj9/2KDjFpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4601
X-OriginatorOrg: citrix.com

On Tue, May 18, 2021 at 02:04:07PM +0200, Dario Faggioli wrote:
> From: Dario Faggioli <dario@Solace.fritz.box>
> 
> Use DOCKER_CMD from the environment (if defined) in the containers'
> makefile too, so that, e.g., when doing `export DOCKED_CMD=podman`
> podman is used for building the containers too.
> 
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

