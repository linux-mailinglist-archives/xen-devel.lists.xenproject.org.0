Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DC543E193
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 15:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218016.378283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg545-0003XF-Em; Thu, 28 Oct 2021 13:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218016.378283; Thu, 28 Oct 2021 13:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg545-0003UV-Bd; Thu, 28 Oct 2021 13:03:29 +0000
Received: by outflank-mailman (input) for mailman id 218016;
 Thu, 28 Oct 2021 13:03:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Bw3=PQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mg544-0003UP-6k
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 13:03:28 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13c13876-5818-4a16-b822-92e87fd61794;
 Thu, 28 Oct 2021 13:03:26 +0000 (UTC)
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
X-Inumbo-ID: 13c13876-5818-4a16-b822-92e87fd61794
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635426206;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=AhceljzKYRz2odnWhyS8tRE+GxdKJQirIFvwjs4RfdI=;
  b=atblYchJ03iXKWhaKYqZmof8FiDIdMQ+2wjUrfoDMpQm4b/ieLArACvd
   CmFFChel5tnd38v1nKK05Z8XL0ttRZY980RPuaZ6AJAPRRRkmusJVdIqS
   E3TRuFTLdB53sWHbcHtKfqSJUkgBsoUWrn7y2+Ad6OnZl8pxRgNMWJYpP
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Vqm9IcfZ7tUlYJjiWScSa81XyRJBkdzJQbW4OtfH3OJQR/jr5IuZ2SaubNtbm3W5uKcgosIvZP
 WlAaCoykwqLI9RVZ5G4XzxPbq6jvvoSCWvj9zhy1oWMaoMF0rcbXf6+8/WOTcDvCAaOwttt8n3
 WWur3N/1/T0gNIlvtZdLU1LEXzU5+i1RsUmwZB2iZNdZ2MAAaUsEfcI2t2qe5YnguWu3ISBpnp
 2a/fNy/0eoOgf4Yynn8rlqOudZXpVMW2rmdVRDxnnhTI5FotpU1lH8Swn9wy2sBtQiy2BmFBwr
 Ua4Yu03nkAD46BHrnnJzcvQW
X-SBRS: 5.1
X-MesageID: 56941798
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:z1j846LdQbQaVM+EFE+RjZMlxSXFcZb7ZxGr2PjKsXjdYENSgzYGy
 jBOUW3QbqzcNjanKI9zYdji9xsPvZ7Vm9NnQVNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eo5y7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB20jf9q4
 c4TmqC2YisoMJ3mn+4bDgVxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Xu44EhWhh1qiiG97ca
 JYCWx1BRy/pXA8eZnMwWY8ng/yR0yyXnzpw9wvO+PtfD3Lo5A5+yr/2K/LOZ8eHA85Smy6wv
 Xna9m70BhUbMt23yjef9H+owOjVkkvTZoUWE7Gp8+9wt3eazGcTFR4+WEOypL+yjUvWc95WN
 UE84Cclqqk2skuxQbHVXQC8oXOClg4RXZxXCeJSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsaKXYWKQ8K+OqjG/MjRTKnUNDQcGRwYY59jooKkokwnCCN1kFcadkdndCTz2h
 TeQo0ADa6471JBRkf/hpBae3mzq9sOhohMJChv/Y3CK9SpiOqGZYaeE6Fbrx/FKKtuFZwzU1
 JQboPS24OcLBJCLsSWCRuQRAb2kj8q43C3gbU1HRMZ5qWz8k5K3VcUJumsmfRY2WioRUWaxO
 Be7hO9H2HNE0JJGh4dMaIWtF99i86HkEdn0Phw/RosTOsYvHONrEScHWKJx44wPuBRz+U3cE
 c3CGSpJMZr8If8+pNZRb7xEuYLHPghkmQvuqWnTlnxLK4a2an+PUqsiO1CTdO0/567siFyLq
 IsEaZPQkEsOALGWjszrHWg7dgliwZ8TXsmeliCqXrTbfloO9J8JUqe5LUwdl3xNwP0Oy7agE
 oCVUU5E0lvv7UAr2i3RAk2PnIjHBM4lxVpiZHREFQ/xhxALPNb+hI9CJsBfVeR2q4ReIQtcE
 qBtlzOoWa8UFFwqOl01MPHAkWCVXE/62FzUZ3D8PGhXklwJb1Whx+IItzDHrUEmJiG2qdE/s
 /un0AbaSoAEXANsEIDdb/fH8r97lSN1dDtaUxSaL99NVl/r9YQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbi/ucIzgltEHjRQU6sD7dsfiuP0cVV7/Ufzb5FowqmH
 EmI/4ACa7mOPcrkFn8XJRYkMbvfha1FxGGK4K1sckvg5SJx8L6WamloPkGB2H5HMb94EII52
 uN96sQY3BOy10gxOdGcgyEKq2nVdi4cU78qv40xCZPwjlZ50UlLZJHRB3Ok4JyLbNkQYEAmL
 iXN2fjHjrVYgEHDb2AyBT7G2u8E3cYCvxVDzVkjIVWVm4Wa2q9rjUMJqTlnHB5Iyhhn0v5oP
 jk5PkJ4EqyC4jN0iZURRGurAQxAWEWU90GZJ4HlT4EFo51EjlDwEVA=
IronPort-HdrOrdr: A9a23:A877kq4CR+UwD7/eRAPXwMzXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1/73TJYVkqNE3I9eruBEDiexPhHPxOj7X5VI3KNGOKhILCFuBfxLqn7zr8GzDvss5xvJ
 0QFpSW0eeAbmSSW/yKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.87,189,1631592000"; 
   d="scan'208";a="56941798"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+9UhwpDcEBrmCkSTi7xBhPUVv7HdvG8FWUK6hpWWEY2W/qw3rHjft0EmV61CyowgoRE+TW6mWiKBPQ27iEOn6nI7GcO916ZinY26gqFMr7vf/jLOvJtEMikQLct9MJvjPovlfBnHN8/rQNbdhjWFigIuUNYiYG2ycoBS2teEPvSRdxsQIvESTTZeTuMfvV7XxkA5P2sqoWCJJEqe8QuRXGadiVrUD+XvQ2UWoDIbAnjdvbWa1qG4KPaN30f8ZvQ/zne3Db/w2dLenFgrxEkcqw5/KnA02A03HBd+PK9a+/tzrVttVog9J6cxaW06QsZLDNU2Dd7ocWgGnGy4/yMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMjAYuXt5rsltQUWFAndqjAVZQiKlI8lpg4tgKFHseE=;
 b=cKppplmRiet98NaboJmmiSzwDtUOgFV+moarau+HQB57CW4JM+/KXZvJu/3KjoGLukvuRQn06ILpLcy9mpjhF2em0jEx9FYj+zkAuLhI6E/eXSCjVzG0eK3evbRyU4888Kmsl8WhxwgTB3rDD1NCEwOj6E8Ak43XPAUBxWnzCCMbzTP+m0sVBe9lA9KbnqxNTtlH2+bGaUsIHMpPgEmxvB4kqz26FFaHVDn3d606fJzuFNHBEZJ/HUMEFg5D1UcGw1DFsZ2b549MQC/vUR04abBoXEf9ceeTQku5bopcSbf/rb/haOtpGxfixBZN8Rz4CdDvpxEDPHbobOCTU2K1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMjAYuXt5rsltQUWFAndqjAVZQiKlI8lpg4tgKFHseE=;
 b=NUp+B9bAZlmU3ESw8z0C3taUlC4/8Ph1xtiTidjh3G5CeE34cR0DlEcaSGT4AzSOKH1tbkTk9WfM9+vEhl59ac4J/mpQ+oumQgfpARtrMMWEG8VW4o97+A+uLTFb2OxmTGMv+koW+mhDiC9cagJqQF3jGtoNUqF3RF+OIZ4plxw=
Date: Thu, 28 Oct 2021 15:03:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.16 v3] gnttab: allow setting max version per-domain
Message-ID: <YXqfk4tj30EmbSEt@Air-de-Roger>
References: <20211028095923.83982-1-roger.pau@citrix.com>
 <24954.37807.277003.373593@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24954.37807.277003.373593@mariner.uk.xensource.com>
X-ClientProxiedBy: MR2P264CA0109.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6054c68d-0f55-4f55-d240-08d99a135182
X-MS-TrafficTypeDiagnostic: DM6PR03MB5068:
X-Microsoft-Antispam-PRVS: <DM6PR03MB50685173F398D63202434F848F869@DM6PR03MB5068.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fChqEKLMg01Mser8Hu0HAv+JpaObxGUKkdTpePxL9FUtqZO2RZsKriyPYIQekPtM55yM7+jE2wrnGmozAcHMFFEGxLEAV6nQKtkGNIK7qlfyh1Zh6MmzXq9QGrAIPO/SB2XpTkiIRfAI71NVDON8y2Tw19i+lwajiNvJgBZs4wRngEG1XWkx0jKdN6HmD2+EEr5WZDmTrC5j1+A2fNZN5dmubB4rUM2pi7JalFNbZvc99SHgpkGXRt2h2Bu8J0hXyvMmoW0WMyws3LTolR9COX9tbxG0wrKqxqIc0lwRT2vt2X2rZ/2akm8rfwF06BKpjVp6zJQq18HEHoI6U+w9YwE59AH6gddyHx5rDBclEcqYK9BFc1Sk9sLJ3UyInfMqXmO4600VPDddL0EoLv0nTqz73JNeWaUbPMkNiPaDG0c4w7unvjCpJOOxgTxqz+UIXqq4sXxVRsxJVyXhq+kOTUwZGLgQdhWVs5YWaSPQdzxl7h7d2jtkQadU8YXbYo6KmioB8Gx2Ge0fnUoJXsooDA2Il7wp5HbCwAtpvDR36+tLx2MbxV/BryFYPED6TXze5HwkBy+p7nK7tzCZjur3KkWczN4nESoOjTlZjzOu+ZCxWmseTlrPVGhxtzw9QH7V35GFAbeYDsHihvQZJpX75F3lxtoqvZ4Mvu/WnO0b8yNME+EDbCyT60JFqYMa64423p8PVoBKqHkzwCqjUZpnyRvthOBfmS+ABaHhMt3zZaCOAs4Ig0GzgwzrCPX9SEzwJqdxNQ5ss73zg+fVEMQZEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(956004)(38100700002)(66556008)(66476007)(5660300002)(66946007)(2906002)(8936002)(83380400001)(508600001)(26005)(6666004)(8676002)(9686003)(6916009)(33716001)(4326008)(82960400001)(6486002)(966005)(54906003)(316002)(6496006)(85182001)(86362001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFB3Wld1MGVwOEZlYjE5MWxoU082UHU1dVhYRzZsNnNRalZmWW1IMERhVmhU?=
 =?utf-8?B?Rnk0cW92cGNYeHd1U01hS2ZZYXJHNTFNMFdjOGVTenpwZWQzK2FYZUF2QWRJ?=
 =?utf-8?B?Rm9BNHhhdmFRU3ZFTklHMGFKT1pGcUpLc2s3NHhpZ29UblBDQi8zVzkwOGVQ?=
 =?utf-8?B?MlJaTlVad21sRHFMMVh5UzllWG1xWjZNNHNCZDg1Wll6akZGdGZHWFlZalV0?=
 =?utf-8?B?WjhtWHBzRWppdU8wSE1GZnVEaTRwdUxTOTZjWDRwRXBPWmo2WHJnS3NHWm9h?=
 =?utf-8?B?aGRKcG9KUHNUblIvZmZhSXdwN1lEbFltVW9KdzBnYlJRMHVhNWRGdWxXUzJa?=
 =?utf-8?B?NFpxY1l5MjhmRjZoc1BOTzRFQ3FCKzQwaHlpUitrNDJiV0NxcXJ6TWtiWTd6?=
 =?utf-8?B?eEZsZWtkU0Erbkx5QzNQN1E3VjZTVTA5MHExcUpYNVM3OHVIcStvbjJXdE82?=
 =?utf-8?B?MDJ1alloNEM2KzZFVkNsR1BSNWVsMFNIbXlycTROUEVIMDZ6S2FJdHdjNkpy?=
 =?utf-8?B?V25rQnIxaEtrL1BURUJjK1FoU0ZoSEJvYUtuSkpSYUE4QmMvRm5BOFlYczFF?=
 =?utf-8?B?NkZzNFczWFBhSkFwVDRUQ3R1a1daMml2Y1NxVHZ4VncwNE5kcUlJM0UvbWFs?=
 =?utf-8?B?UENML2RsT0xFbTczZDVycnNST0JvTW1XMlBuUnVlZ0d1MjVaMXVsQnhMd2Nj?=
 =?utf-8?B?NTBHbSsvcEk3TzZPcnBLUDAwd2pldEJ0cVg4aHF1emNRUXUxQWlaNGtKcVdT?=
 =?utf-8?B?bHZ4Z0l5MXIyWEU0clVaT1ZFakJSNTJJSlpjQlluMFc2aXZwVC82d283aFZI?=
 =?utf-8?B?N2RidVYzaVhiNHBLSlM3eTFoMUF2TjJmZ0EzS2VFQzk5REF6OXFER2N5Ty8z?=
 =?utf-8?B?UTRWRlo1R2k5UERlSHB1OEVZSldzSU00OG4vY3lyRlB2ZUpPbkMvNEZEMUZZ?=
 =?utf-8?B?NGxsYTZ3Qy9ZMWhmbTNUbGVzcUJwaFBVL0NlVXpMSDVKM2xDU3BUd1VzYmtC?=
 =?utf-8?B?Wlg1bzlHc3l3UEQ1RjRtSnRYNHRWUlNFUVkwd1paeVB0NjlhelRsa09xdGdr?=
 =?utf-8?B?TmtuSmZKZjk4c2tRYU41Q3NuaFc4cHY0OUtRbmZzQ2hHSlc5Nm9jWjVRNVQ0?=
 =?utf-8?B?aVN6eS9GZ2U3citGaFNQdWV4emNpcXZMbEJSUTlRQVZPV3RFSmRHV2g5TzFK?=
 =?utf-8?B?OUQ1TnZHaExkL0pSNXZIZTZOb2hDTFgwYWIrcmg1VC9IMTl0dU00VmMrVEtU?=
 =?utf-8?B?SDFIb3IwOUJMR0lVV1FJeTgvVjlEYVJVdjlDUm1QV09PS3NyQmFJSUxvRHM2?=
 =?utf-8?B?ck5adm5vY3AvNEJFTHNuR1l6Y2d6UFAzSTRCR0UvN1hORytoWGZSMklZZng0?=
 =?utf-8?B?UDNNeXREamNxcnUvcW4xcUI5T1EyUTFMTXE0TlhJTnE5NU1YdzdKbDBYamFh?=
 =?utf-8?B?OFNYdnFubVE1by9Vc3c1blR2enFLdzhzcU04Um54QkRTMnRpOWZ4ZXlhV3Vr?=
 =?utf-8?B?U2ZrZUR2TWxVU0xOV1Bzc2RCaWdLQStpV2ZFeXUvckpWUi9aaEpuYlpqUFp5?=
 =?utf-8?B?cStFdEdRTkc4SXpySWRrUXEzZEhOWDZNRHZtSEMwYkViY3dtbll0NnFvZ3dW?=
 =?utf-8?B?RXh1ZEpOL2NRUmFBL09yN3FJWXJtb25ZTmRycnl3MGxOYVM5TFdhUUYzZ2g0?=
 =?utf-8?B?S2JQUC9PYkZ1TUZRY09mVG1yaXdjUUJ2cHdjSXpxSFVPME0xNjFIbnBJdzN6?=
 =?utf-8?B?UngzdGhnTENBQWFmMUxmUVptQUl5VlBCVDVJVjlGSUVvWTMrNTNHc2FEV2Ja?=
 =?utf-8?B?elR6SktrRHBLdkhGcDNyQ0xtTVJoVDJtL0tFUDlBQUF2Z2NsNzFQempvYVFF?=
 =?utf-8?B?bTZiNzl4VlUrSkVUUWw5YTdMcVZnc0h3S0xoMnA5RlJ5dlV5bHJHaDNWeFk3?=
 =?utf-8?B?c1JGU2tpK0RjcTNHdS9abVJEUWxDWkl5VWZmcHRIZTkwR2ROMlZldGRzd01n?=
 =?utf-8?B?RldCRnBaQWZ2RFRUUk16YlA2Z1NKRjUrWVE0ZTI1eUdpdVovakppcW82UmFt?=
 =?utf-8?B?S25BbU42U1A1Q0xENXMxVnN2ZU1wbzBsTzZ4N2ZBTkg2V3FvZ05qL2R6Y1dX?=
 =?utf-8?B?aXhzZTc2UzVQQkNocUt2UUx2S2hKcDg1Ujk0NTZ4UzVUay9lRVU1K0Fic0FZ?=
 =?utf-8?Q?QaSDCFwu5TYKx2iDeEKCq0A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6054c68d-0f55-4f55-d240-08d99a135182
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 13:03:21.4012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOn3i/FrQhzVCtIwB0cRhrAY2tF3LJ94PFyv3n1aUFS+usX8htwLaC4pD26sDOkYRIY1M/M4StF/B+5w4J4dNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5068
X-OriginatorOrg: citrix.com

On Thu, Oct 28, 2021 at 01:12:31PM +0100, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH for-4.16 v3] gnttab: allow setting max version per-domain"):
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index 55c4881205..21a39adb70 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -580,6 +580,12 @@ to have. This value controls how many pages of foreign domains can be accessed
> >  via the grant mechanism by this domain. The default value is settable via
> >  L<xl.conf(5)>.
> >  
> > +=item B<max_grant_version=NUMBER>
> > +
> > +Specify the maximum grant table version the domain is allowed to use. Current
> > +supported versions are 1 and 2. The default value is settable via
> > +L<xl.conf(5)>.
> 
> 
> Firstly, review from my maintainer hat:
> 
> In the lower levels of this stack, I'm not sure why you chose -1 for
> "default", when 0 is not (and never will be) used ?

No, I actually had plans to use 0 to signal no grant table support for
the guest, see:

https://lore.kernel.org/xen-devel/20210922082123.54374-7-roger.pau@citrix.com/

> > diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
> > index 6836002f0b..7cd1aa8f7c 100644
> > --- a/tools/helpers/init-xenstore-domain.c
> > +++ b/tools/helpers/init-xenstore-domain.c
> > @@ -88,6 +88,7 @@ static int build(xc_interface *xch)
> >           */
> >          .max_grant_frames = 4,
> >          .max_maptrack_frames = 128,
> > +        .grant_opts = 1,
> >      };
> 
> I think this sets the max gnttab version for xenstore stub domains to
> 1 ?  That's not mentioned in your commit message or your release
> discussion.

Indeed. AFAICT MiniOS only supports grant table v1, and the grant
related parameters max_maptrack_frames and max_grant_frames are
already set based on DEFAULT_MAX_GRANTS and NR_GRANT_FRAMES
respectively as defined in MiniOS code.

Would you like me to this to the commit message:

"xenstored stubdomains are limited to grant table v1 because the
current MiniOS code used to build them only has support for grants v1.
There are existing limits set for xenstored stubdomains at creation
time that already match the defaults in MiniOS."

> 
> Secondly, the release question:
> 
> > Release rationale:
> > 
> > We have had a bunch of security issues involving grant table v2 (382,
> > 379, 268, 255) which could have been avoided by limiting the grant
> > table version available to guests. This can be currently done using a
> > global host parameter, but it's certainly more helpful to be able to
> > do it on a per domain basis from the toolstack.
> 
> Let me think this through.
> 
> Upside:
> 
> So the advantage is to have a mitigation for possible (but, perhaps,
> likely) future security bugs.  We don't change the default here, so
> the default configuration is still vulnerable.
> 
> We have this mitigation already but only on a per-host command line
> basis, so you (1) have to reboot (2) can't use it if you have any
> guests that need v2.  (2) is less of a problem than it sounds because
> even with the selective mitigation you will remain vulnerable to those
> guests.  So the main advantage is having to reboot the guests but not
> the hosts.
> 
> Downside:
> 
> > Changes to the hypervisor by this patch are fairly minimal, as there
> > are already checks for the max grant table version allowed, so the
> > main change there is moving the max grant table version limit inside
> > the domain struct and plumbing it through the toolstrack.
> 
> Right.
> 
> > I think the risk here is quite low for libxl/xl, because it's
> > extensively tested by osstest, so the main risk would be breaking the
> > Ocaml stubs, which could go unnoticed as those are not actually tested
> > by osstest.
> 
> I will want a review by ocaml folks.  Christian ?
> 
> In particular, I would like an opinion from the ocaml tooling
> maintainers about whether there is a risk of this feature breaking
> things *if it's not used*.
> 
> 
> I am not sure about the implications for migration.  Might using this
> cause migration to fail for some guests ?
> 
>    Note that when using the default grant version the specific max
>    version in use by the domain is not migrated. Any guests should be
>    able to cope with the max grant version changing across migrations,
>    and if a specific guest relies on a maximum grant version being
>    unconditionally available it should be specified on the configuration
>    file.
> 
> Only if the feature is *not* used, I guess.  Ie, this is the status
> quo.   So I don't think there is any release risk there.

This was raised by Jan in a previous version, the discussion can be
found here:

https://lore.kernel.org/xen-devel/0b58667f-b6bc-d5b5-2dd1-0c8996367319@suse.com/

The issue could arise if a guest that strictly needs grant v2 is
migrated from a host that has v2 as the default max version to another
box that has v1 as the max version. If the guest config file doesn't
explicitly specify that the guest requires grant v2 migration will
succeed, but the guest will likely fail to resume properly.

This is already the current behavior if a guest is migrated from a
host not having gnttab=max-ver set to one having gnttab=max-ver:1.

> 
> If this change does cause problems, it is deep throughout the stack,
> but not entangled with anything else, so I think we could revert it ?

I think so, unless we start piling a lot of other toolstack changes on
top it's unlikely to be a problem to revert.

> If we can get good answers to all of this, ideally I would like to see
> this committed by the end of tomorrow.  I plan to cut RC1 on Monday.

Thanks, Roger.

