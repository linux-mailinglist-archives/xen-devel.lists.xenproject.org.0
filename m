Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98226E108C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 17:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520828.808869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmyRQ-0000Mo-TZ; Thu, 13 Apr 2023 15:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520828.808869; Thu, 13 Apr 2023 15:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmyRQ-0000JH-Ot; Thu, 13 Apr 2023 15:00:52 +0000
Received: by outflank-mailman (input) for mailman id 520828;
 Thu, 13 Apr 2023 15:00:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nJNL=AE=citrix.com=prvs=46089ce94=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pmyRO-0000Gq-Ec
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 15:00:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7c9d368-da0b-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 17:00:47 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Apr 2023 11:00:43 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5712.namprd03.prod.outlook.com (2603:10b6:a03:2dd::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 15:00:40 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee%3]) with mapi id 15.20.6277.038; Thu, 13 Apr 2023
 15:00:40 +0000
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
X-Inumbo-ID: f7c9d368-da0b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681398047;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ErrKj++KGuoinzmjbMMKSr6tPwXsEhw/7+UFjFENxLo=;
  b=AtIC323yRzHhLuQwGraGc+YKkWAaKY6RZMjI3IDQvwuluLVaulmTIOXZ
   jiOA0ojZmyEBmhiJTOA7TfBoOqq5n/fF9TTD2R9JsG+7Ea1AvYEMbb28I
   BdwietqaBfv8om5wWlRipavNdviHbjeXTBkp6oMbx6Zmc3hDZfAQjsB8G
   o=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 104183524
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:w/VRZq07uE+2i10HtPbD5V1wkn2cJEfYwER7XKvMYLTBsI5bpzEBz
 TFLD2HUbvuONGH1fNB/O9u1p0IPuJODzt5hHQRtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gBnPqgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfOz9zs
 tkmNwo0QhWng8u4mpGbEvk1mZF2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFcZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13rOWzXimAt56+LuQx95JkWy5+HQqLgwTXkW4mvK9sFSdRIcKQ
 6AT0m90xUQoz2SVSd36Uwy9sWSzlBcWUNpNEMU38AiIjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+Wpz6vPSkeLUcZeDQJCwAC5rHLv4Ubnh/JCNF5H8adjMDxGDz26
 yCHqm45nbp7pdUQy6yx8FTDgjStjpvEVAg44kPQRG3NxhtweYqNd4Gur1/B4p5oL4uHT1/Ho
 HkNneCf6vwDCdeGkynlfQkWNLSg5vLAOjuDh1dqRsEl7270oyXlep1M6jZjIksvKtwDZTLif
 E7Uv0VW+YNXO3ypK6RwZupdFvgX8EQpLvy9Pti8UzaESsQZmNOvlM22WXOt4g==
IronPort-HdrOrdr: A9a23:TJlfe67/rJPu9sbp9QPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-Talos-CUID: 9a23:t9zyVmx/AHAPO6JCoU0fBgUuRP1iV0PC9k78Jmu8IGgza53NWQaPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AChNfwA7P960rd5MBB8YdvQ0YxoxZw4e/OWoziaw?=
 =?us-ascii?q?gqsyPKy9LMDOnlheoF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,194,1677560400"; 
   d="scan'208";a="104183524"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0L7+DovZFNZOk7OAr3CZDT0NDO8iXWld6ZXDWktOFHmnOkYNNOpuCIOUScffqlmyWFRfZj1y5CY7ad9z8dZNGo0bPA+tqg6Xa7Y1pEaNJrprgWo7xFpnmm1GIW4ng1JkVttgHbIgjIE9IqDcsQiOsBxooLLwmFkE7E0zInaVSLcgNS6wj3rrRfVG90aYR4p7mtuDjB1fQNYw75WS9vd1HOIEzJWT1v96adQVCPYRGAik327aAaPHQIV/HWnHdiSOPWTQx00fLRPE79DCObhMMxkdlcr9iVdx2F7d41C6QJbekYQGE4jQafVzCAJw74FmB6wNMGIitXSUDXiheyVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klEoG/X0C1nj76ubJnwT76H/xIUNuYrHoSpaG2B1Quc=;
 b=ngJrEfgKDJ0YHWAhgu9J3pvrGRTVp6XIIHYP47a0CdIJ4ke+SFOii+FUNeE9SEzncC4Q/B6BIh9/sqCqygnMu2O1UrWrHJDRg2E/oePjQixGJNQpfSO6LW27eAgmJzWkkqsKCp3gYtIPHVrodn/8KCKra8j11rIOByIr3BdXMcxYna15wgbjWUKWsaTtBiaGPdULO6ApZFLdCIMFl8jDMP94+ljhru3kVx0VfSm46yN3/5JTMdSckG/JtnfnWxGnZriJ3B2qiLbaobn2dLVGeU+20asJbCYeUSeAzcUdUoCyRYmqcdumWfMWJ3X+ZjNkxhDcHp+zVW7CTi6JpKFidg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klEoG/X0C1nj76ubJnwT76H/xIUNuYrHoSpaG2B1Quc=;
 b=QvI0Jc2Ly+zuM7Ppy00VsEECYq7nfVi7IE5mcyAZapbuYWq5L1eSU3P2Yp8NxX87ewnMYYjLsDtJq2QNBKbAfQtBgEZf6njjLPGp/uAV5y3nQc3Gsb0E0MpGcw7ZXbyNkuoAdQY37eswDaLk8B81oTN+vCKmqN/jsb8y6qxqtNQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 13 Apr 2023 17:00:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Message-ID: <ZDgZEZIG89oW6rEw@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
 <ZBNA9q5DXJYG3KVp@Air-de-Roger>
 <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger>
 <87v8i0wyv0.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v8i0wyv0.fsf@epam.com>
X-ClientProxiedBy: LO4P123CA0441.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5712:EE_
X-MS-Office365-Filtering-Correlation-Id: c2812498-98c9-4ad8-9fef-08db3c2fd89e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	giRn09I/fvWGJXe2eH03OIaDaWyUiKrIm8kI/iSH2x1N9wKvX8TeiuH4PtuXC1kjgmd13qJRdZjn/yD8ABXPhZq5BEK44G2iQH5rQEVSFw4sG2JxXW+7QVOpdnaG1eZZO2ZVu+llmrZtSGOe6vBjbTWjNMNlTPfSLdk7XpJDUfixTsbg1qpJA3Vtn1UMje1jMnQJLjLy52eZsabkNz6UifdBCwdgbuj6TQxfSlzigcVOv3tA0jVulN/4vfcBOhQrwzfDFfOaJcZIIykoV7BKS6uxGJhwoMW85DPU+fW/yXiSwcM5aK71rJrmTw7cUHNcGdKBYBUTxZ1LteWzyMoPgfKi9UHlRZbxCoeHgHs8dzFprqF5GflqwVjk8TFk4ypsKDjw4t13fkcZ6CPa/I4KCID6RZ6xqHB2aAD9fVxNnM5HxkKPAgJyteQ3myOilcYTsBatDzyEPJnQb85f8DSqqqflFBG7MkYkNxabXvtHKa8TyOoZt8p3WDpRTQSXycQib9bQNELzHZJZUDCqrtPKuU1NeUydjvlxkCULsaVJS/ca8WvC/9KbUxbkOVrv03fM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(6666004)(6486002)(6916009)(66476007)(66556008)(66946007)(4326008)(85182001)(30864003)(2906002)(7416002)(33716001)(86362001)(41300700001)(82960400001)(5660300002)(8676002)(8936002)(316002)(38100700002)(478600001)(54906003)(9686003)(6512007)(6506007)(26005)(186003)(66899021)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NktNUDBQMWlSRUJUdnE1K05hL1dkS21oSG01WG15Z1Z4dWpwODVrUTRxZ2dQ?=
 =?utf-8?B?M0pUZVU0YXI2QUZXekxmMk9QS2xjQVlqVmNPRjRubGVXdVFwN2hOaElDN3ZV?=
 =?utf-8?B?bXIydGFBeXBLa282M24xTFNINytURm9scWk1WDROb2pYdStrZHd3bjhOZUQr?=
 =?utf-8?B?RVRXcE1UNzQzVmxMVEIyaS9SYzlSd0VyTUVyN2FaOGZVS0pQT2FIakYrbDRo?=
 =?utf-8?B?RVY1VkN6cVBNd0I5QTltbmlqVXFYdTUwUm1aS1k5a01GMWRuQXZqZy9IazEz?=
 =?utf-8?B?dXBSTnJTMzRqNE1zQmpZZWt1Ym5ITkJSR3NFN1cvNEY3R0JWNzBaZlRwdmln?=
 =?utf-8?B?ZFMvUnB3VzdmQWNIaTR2TjdHLzh0U2lac2lTWXUrOWl5T2tEMlFOWG0xVUFi?=
 =?utf-8?B?ekFPRUdheEhhWVhzcUg5QmhxcWoxTG9DVU16S3RjUjQxcXpidFhIaHhVdXRC?=
 =?utf-8?B?RUIrYkdRSWdFRmlrV2tWK29kTzJMa2YyMjBpbjJxb0oxZUJPSUJBd2ZhL09v?=
 =?utf-8?B?aThoMWFzUUpCdzdiWWJRREh4Q3IwS3VRbXByQVlvaGdZeDBjb0IzTlYrSDcy?=
 =?utf-8?B?T2I4OHA0TkRWZWFkNXdreWVpSW94T2VPRVY3a0dXYmZlbmJVVjlXV3VvQlZw?=
 =?utf-8?B?VFBlVFdUdGVkSVVPODl0ODY2TWhmcVhRMG9LMHM0QTZWa29zOUJsaHFXcmdz?=
 =?utf-8?B?T21iWDhxZElkVXZ1M0h2RHJrRElFditnMjNZUFYyOHJreUpSR3d4S3I0VDU2?=
 =?utf-8?B?ZmV1dlF1cWFTZ3krazBPT0MzblVYOVhiS2pDVzI0c2FDQlgrM0NzK0lMWk9i?=
 =?utf-8?B?dW9BWWRDdlMrVUd1cEdLTEpvYXJnZ2g4c2ZGc2NkdldueXFFS3BFbHdDRmdE?=
 =?utf-8?B?R1RyN1lReVpNc1lhWVhXVDB5RGdJWmZyYWxpaE5QVnlXRENjaFMrMmNVNURV?=
 =?utf-8?B?L244bVpzRlFFb05ZOFUwNm1rOWQwNlk4VmZ1NE5kY3F3Zi9BMXora2xOZVNN?=
 =?utf-8?B?UElHN09NeUQxNUR2amdnT29xNXIyVmpTMlgzalh5V2oyRndBaExNZWFNS0dY?=
 =?utf-8?B?QmFEUzRPNENGZE4yank5UGU1S3JyWVMyOFNHbGVLeEJEemNxejZRWnJ3QlhB?=
 =?utf-8?B?SURDMlc1ekhVQmZlK0REWFRQcnZBV3pZZUZpNHhDdE5BdjN6ZENUb1c4NWJY?=
 =?utf-8?B?SU5ubnVCU3V4VGN6UGhJZXk4MXVqK29iUm11bU1zT2M1OUhrcVVtMStHMFZh?=
 =?utf-8?B?NnZmcUtha0FRcDhBNjA4S3R5QjVxQ3RsdEIzTmhNZm1iZG5UaUlWNlhDbURD?=
 =?utf-8?B?VlpLeERiaHNsc01vUWtoT1d2VlptaWoydFVtbGc2cklzeXV2eXAxK3JXY0tk?=
 =?utf-8?B?dHdhOXdGSTdOQ1hPWTJFMTBPVUF6Nk9PQkZYd3IwNFdoTURKYmE4Mjc3eVoz?=
 =?utf-8?B?d0xTTlYwdE8xUUF0ZzRVc1VtS3pzYjduVnZBZTZmZFdrYmRta2hxNTJDYm1R?=
 =?utf-8?B?QmlyclVYdE5MVjU3NzBlYWp5U1MvMHo5dldZdGtWR2JCaUorUnltSFRTNnls?=
 =?utf-8?B?S3dPVHFwcmR3dlBpTk5iRWlYZXBuVm51NUgrVzVJWEVNc1dTMSs3bmJLTXZo?=
 =?utf-8?B?ZXlOQWppNmZraU96NlpuSi9XTmFNYUN2akdBMEFGRVQ0VFFscXRoWFBOS1Rp?=
 =?utf-8?B?ZzAyOE5UeXpEM21xVGhvMklzamxuUXpqcE92dmhPa3Z5VlBKc1kzcXVrVDV6?=
 =?utf-8?B?TXovMnBkVkFGUUZ1Z2VHbkFXbFFiU2R3Um1kMmlyWjFuMHQ0UzRkbFVmZGxw?=
 =?utf-8?B?WHI2T2hoVWNFRDdLNDRueUR4Zy91MjJwTUdCRzFha3BZUWlYeGJBbmh5NG5I?=
 =?utf-8?B?WnprYlhRMlN4S0V3SEdLc28rRGtTdlAwYzFQS3ZJbHVVSzZCMW1JSWFDTmZY?=
 =?utf-8?B?Y25NZ1U3dlRHZ2VzZlF1ZVk4bmsyRG9wVHZNZU1iY1NDZjU5cUpPb2RTTDJ6?=
 =?utf-8?B?dVJrL2ozQ1F3TE1zMDNJYnNGU3BlVnU0dHR2a3d4eEJWZ2ZMUXhQQ3JlOXpN?=
 =?utf-8?B?VFB2bmZNOWtQWmpsb3ZsRjVQTDBuTUxXYUViS1ZGb2ZDdFR4YWZMMCtnSTZT?=
 =?utf-8?Q?VABD8QlzNwiKUuIF2M0AzLZ2B?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nwV6xTNeFZ1ivcHBz348OzL6OZQK9knKQIZH+9BxlFMGRU1KQE7Jo0/AsqxhQ90i9ZPFxdNkeFzlslmWueWu2hiji/lU7fvMdYzjppRPf0K2JC1lrWSTtWUIJVg4OzkIeWV4XHYN0XPlQ6z7zm2y1uMsR1H9Ro24tun+5Jcau/KGweAwLhdKea5K4i8kxR5ylf3otZsp/8Sm4GItGZs66BfOIk0W125ZxPe5N8gPeyT07/pTxEORU0nF6xxzXjwEO1LCYG8ozexgDPLO5Og4+1XmG/5glVb7HcO8yNUDUZU/6w+M7rITuvN8PnIZ3idU2Poi8l56g3S5kisGP8l/2Mqn3R1TwelzNHaIS1OrLUk1jcr4Q4fngdTxdJvOpDRKsowzR3ptqGgd5DZlQeeofmd7/jYIcAsiFitLJBQtgqPs9t9rci5SJnsqtnoWjLNPDaS/jpXH4SFldUr76P7qBycnDoKXkiyO15JhKEA22s79881fRE4lEzwyefLA1m89dnnCamcQ2ppLMeuO7Ez1gSTcDv/JB+7oWUcTXLbbb65pvX5UjZCK690OosiW2IDLLwbIlZZP46npRMlOlLBHWyLCzA6urQLhkAvwlz4CenlxKVJLxQbuAhId6p5jgJpEjVdqiaO84DgfZPswMSX5ilWedHN4A4hqtW/uzuzoIXM0N+Cw6peO+fY+4tEV45isJwkM+IGMH9EKvXmq7pOYIQDAv0dtjRjcPjk2dp08P1SAaSTWLJxgVkYAZ0+S/nbldHndXX3sFLmTVUCrpDWqCX09jhrNK51eeawYz7gliXDuAWVpyv/r8qQxyFhcsW/t/pkA1sUkRB1sOeZsOJ4MG1FzzaaQy/s0PUq0DUmPk837+wga90nWCTrGXYJ4m/jzeqMZ88wdhlMIu0vhf3Ev6w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2812498-98c9-4ad8-9fef-08db3c2fd89e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 15:00:40.4667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SB+fCq6ERjR+XO5cvIOFLejM7wBvN5XsSs6jeF02w7DoM1HVx5SsWoDG9ffzF72YeLGxGgdp9Rd7mGYaSiWFBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5712

On Wed, Apr 12, 2023 at 09:54:12PM +0000, Volodymyr Babchuk wrote:
> 
> Hi Roger,
> 
> First of all, I want to provide link [1] to the RFC series where I tried
> total PCI locking rework. After discussing with Jan, it became clear for
> me, that task is much harder, than I anticipated. So, it was decided to
> move with a smaller steps. First step is to make vPCI code independed
> from the global PCI lock. Actually, this is not the first try.
> Oleksandr Andrushchenko tried to use r/w lock for this: [2]. But,
> Jan suggested to use refcounting instead of r/w locks, and I liked the
> idea. So, this is why you are seeing this patch series.

Thanks, I've been on leave for long periods recently and I've missed
some of the series.

> 
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Tue, Apr 11, 2023 at 11:41:04PM +0000, Volodymyr Babchuk wrote:
> >> 
> >> Hi Roger,
> >> 
> >> Roger Pau Monné <roger.pau@citrix.com> writes:
> >> 
> >> > On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
> >> >> Prior to this change, lifetime of pci_dev objects was protected by global
> >> >> pcidevs_lock(). Long-term plan is to remove this log, so we need some
> >> >                                                    ^ lock
> >> >
> >> > I wouldn't say remove, as one way or another we need a lock to protect
> >> > concurrent accesses.
> >> >
> >> 
> >> I'll write "replace this global lock with couple of more granular
> >> locking devices"
> >> if this is okay for you.
> >> 
> >> >> other mechanism to ensure that those objects will not disappear under
> >> >> feet of code that access them. Reference counting is a good choice as
> >> >> it provides easy to comprehend way to control object lifetime.
> >> >> 
> >> >> This patch adds two new helper functions: pcidev_get() and
> >> >> pcidev_put(). pcidev_get() will increase reference counter, while
> >> >> pcidev_put() will decrease it, destroying object when counter reaches
> >> >> zero.
> >> >> 
> >> >> pcidev_get() should be used only when you already have a valid pointer
> >> >> to the object or you are holding lock that protects one of the
> >> >> lists (domain, pseg or ats) that store pci_dev structs.
> >> >> 
> >> >> pcidev_get() is rarely used directly, because there already are
> >> >> functions that will provide valid pointer to pci_dev struct:
> >> >> pci_get_pdev(), pci_get_real_pdev(). They will lock appropriate list,
> >> >> find needed object and increase its reference counter before returning
> >> >> to the caller.
> >> >> 
> >> >> Naturally, pci_put() should be called after finishing working with a
> >> >> received object. This is the reason why this patch have so many
> >> >> pcidev_put()s and so little pcidev_get()s: existing calls to
> >> >> pci_get_*() functions now will increase reference counter
> >> >> automatically, we just need to decrease it back when we finished.
> >> >
> >> > After looking a bit into this, I would like to ask whether it's been
> >> > considered the need to increase the refcount for each use of a pdev.
> >> >
> >> 
> >> This is how Linux uses reference locking. It decreases cognitive load
> >> and chance for an error, as there is a simple set of rules, which you
> >> follow.
> >> 
> >> > For example I would consider the initial alloc_pdev() to take a
> >> > refcount, and then pci_remove_device() _must_ be the function that
> >> > removes the last refcount, so that it can return -EBUSY otherwise (see
> >> > my comment below).
> >> 
> >> I tend to disagree there, as this ruins the very idea of reference
> >> counting. We can't know who else holds reference right now. Okay, we
> >> might know, but this requires additional lock to serialize
> >> accesses. Which, in turn, makes refcount un-needed.
> >
> > In principle pci_remove_device() must report whether the device is
> > ready to be physically removed from the system, so it must return
> > -EBUSY if there are still users accessing the device.
> >
> > A user would use PHYSDEVOP_manage_pci_remove to signal Xen it's trying
> > to physically remove a PCI device from a system, so we must ensure
> > that when the hypervisor returns success the device is ready to be
> > physically removed.
> >
> > Or at least that's my understanding of how this should work.
> >
> 
> As I can see, this is not how it is implemented right
> now. pci_remove_device() is not checking if device is not assigned to a
> domain. Id does not check if there are still users accessing the
> device. It just relies on a the global PCI lock to ensure that device is
> removed in an orderly manner.

Right, the expectation is that any path inside of the hypervisor using
the device will hold the pcidevs lock, and thus bny holding it while
removing we assert that no users (inside the hypervisor) are left.

I don't think we have been very consistent about the usage of the
pcidevs lock, and hence most of this is likely broken.  Hopefully
removing a PCI device from a system is a very uncommon operation.

> My patch series has no intention to change this behavior. All what I
> want to achieve - is to allow vpci code access struct pdev objects
> without holding the global PCI lock. 

That's all fine, but we need to make sure it doesn't make things worse
and what they currently are, and ideally it should make things easier.

That's why I would like to understand exactly what's the purpose of
the refcount, and how it should be used.  The usage of the refcount
should be compatible with the intended behaviour of
pci_remove_device(), regardless of whether the current implementation
is not correct.  We don't want to be piling up more broken stuff on
top of an already broken implementation.

> >> >
> >> > That makes me wonder if for example callers of pci_get_pdev(d, sbdf)
> >> > do need to take an extra refcount, because such access is already
> >> > protected from the pdev going away by the fact that the device is
> >> > assigned to a guest.  But maybe it's too much work to separate users
> >> > of pci_get_pdev(d, ...); vs pci_get_pdev(NULL, ...);.
> >> >
> >> > There's also a window when the refcount is dropped to 0, and the
> >> > destruction function is called, but at the same time a concurrent
> >> > thread could attempt to take a reference to the pdev still?
> >> 
> >> Last pcidev_put() would be called by pci_remove_device(), after removing
> >> it from all lists. This should prevent other threads from obtaining a valid
> >> reference to the pdev.
> >
> > What if a concurrent user has taken a reference to the object before
> > pci_remove_device() has removed the device from the lists, and still
> > holds it when pci_remove_device() performs the supposedly last
> > pcidev_put() call?
> 
> Well, let's consider VPCI code as this concurrent user, for
> example. First, it will try to take vpci->lock. Depending on where in
> pci_remov_device() there will be three cases:
> 
> 1. Lock is taken before vpci_remove_device() takes the lock. In this
> case vpci code works as always
> 
> 2. It tries to take the lock when vpci_remove_device() is already locked
> this. In this case we are falling to the next case:
> 
> 3. Lock is taken after vpci_remove_device() had finished it's work. In this
> case vPCI code sees that it was called for a device in an invalid state
> and exits.

For 2) and 3) you will hit a dereference, as the lock (vpci->lock)
would have been freed by vpci_remove_device() while a concurrent user
is waiting on pci_remov_device() to release the lock.

I'm not sure how the user sees the device is in an invalid state,
because it was waiting on a lock (vpci->lock) that has been removed
under it's feet.

This is an existing issue not made worse by the refcounting, but it's
not a great example.

> 
> As you can see, there is no case where vPCI code is running on an device
> which was removed.
> 
> After vPCI code drops refcounter, pdev object will be freed once and for
> all. Please node, that I am talking about pdev object there, not about
> PCI device, because PCI device (as a high-level entity) was destroyed by
> pci_remove_device(). refcount is needed just for the last clean-up
> operations.

Right, but pci_remove_device() will return success even when there are
some users holding a refcount to the device, which is IMO undesirable.

As I understand it the purpose of pci_remove_device() is that once it
returns success the device can be physically removed from the system.

> >
> >> >
> >> >>          sbdf.devfn &= ~stride;
> >> >>          pdev = pci_get_pdev(NULL, sbdf);
> >> >>          if ( pdev && stride != pdev->phantom_stride )
> >> >> +        {
> >> >> +            pcidev_put(pdev);
> >> >>              pdev = NULL;
> >> >> +        }
> >> >>      }
> >> >>  
> >> >>      return pdev;
> >> >> @@ -548,13 +526,18 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
> >> >>          list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> >> >>              if ( pdev->sbdf.bdf == sbdf.bdf &&
> >> >>                   (!d || pdev->domain == d) )
> >> >> +            {
> >> >> +                pcidev_get(pdev);
> >> >>                  return pdev;
> >> >> +            }
> >> >>      }
> >> >>      else
> >> >>          list_for_each_entry ( pdev, &d->pdev_list, domain_list )
> >> >>              if ( pdev->sbdf.bdf == sbdf.bdf )
> >> >> +            {
> >> >> +                pcidev_get(pdev);
> >> >>                  return pdev;
> >> >> -
> >> >> +            }
> >> >>      return NULL;
> >> >>  }
> >> >>  
> >> >> @@ -663,7 +646,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> >> >>                              PCI_SBDF(seg, info->physfn.bus,
> >> >>                                       info->physfn.devfn));
> >> >>          if ( pdev )
> >> >> +        {
> >> >>              pf_is_extfn = pdev->info.is_extfn;
> >> >> +            pcidev_put(pdev);
> >> >> +        }
> >> >>          pcidevs_unlock();
> >> >>          if ( !pdev )
> >> >>              pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
> >> >> @@ -818,7 +804,9 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
> >> >>              if ( pdev->domain )
> >> >>                  list_del(&pdev->domain_list);
> >> >>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
> >> >> -            free_pdev(pseg, pdev);
> >> >> +            list_del(&pdev->alldevs_list);
> >> >> +            pdev_msi_deinit(pdev);
> >> >> +            pcidev_put(pdev);
> >> >
> >> > Hm, I think here we want to make sure that the device has been freed,
> >> > or else you would have to return -EBUSY to the calls to notify that
> >> > the device is still in use.
> >> 
> >> Why? As I can see, pdev object is still may potentially be accessed by
> >> some other CPU right now. So pdev object will be freed after last
> >> reference is dropped. As it is already removed from all the lists,
> >> pci_dev_get() will not find it anymore.
> >> 
> >> Actually, I can't see how this can happen in reality, as VPCI, MSI and
> >> IOMMU are already deactivated for this device. So, no one would touch it.
> >
> > Wouldn't it be possible for a concurrent user to hold a reference from
> > befoe the device has been 'deactivated'?
> >
> 
> Yes, it can hold a reference. This is why we need additional locking to
> ensure that, say, pci_cleanup_msi() does not races with rest of the MSI
> code. Right now this is ensured by then global PCI lock.
> 
> >> >
> >> > I think we need an extra pcidev_put_final() or similar that can be
> >> > used in pci_remove_device() to assert that the device has been
> >> > actually removed.
> >> 
> >> Will something break if we don't do this? I can't see how this can
> >> happen.
> >
> > As mentioned above, once pci_remove_device() returns 0 the admin
> > should be capable of physically removing the device from the system.
> >
> 
> This patch series does not alter this requirement. Admin is still
> capable of physically removing the device from the system. After
> successful call to the pci_remove_device()

Indeed, but there might be users in the hypervisor still holding a
reference to the pdev.

> >> >> -static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> >> >> +static int assign_device(struct domain *d, struct pci_dev *pdev, u32 flag)
> >> >>  {
> >> >>      const struct domain_iommu *hd = dom_iommu(d);
> >> >> -    struct pci_dev *pdev;
> >> >> +    uint8_t devfn;
> >> >>      int rc = 0;
> >> >>  
> >> >>      if ( !is_iommu_enabled(d) )
> >> >> @@ -1422,10 +1412,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> >> >>  
> >> >>      /* device_assigned() should already have cleared the device for assignment */
> >> >>      ASSERT(pcidevs_locked());
> >> >> -    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
> >> >>      ASSERT(pdev && (pdev->domain == hardware_domain ||
> >> >>                      pdev->domain == dom_io));
> >> >>  
> >> >> +    devfn = pdev->devfn;
> >> >> +
> >> >>      /* Do not allow broken devices to be assigned to guests. */
> >> >>      rc = -EBADF;
> >> >>      if ( pdev->broken && d != hardware_domain && d != dom_io )
> >> >> @@ -1460,7 +1451,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> >> >>   done:
> >> >>      if ( rc )
> >> >>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
> >> >> -               d, &PCI_SBDF(seg, bus, devfn), rc);
> >> >> +               d, &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
> >> >>      /* The device is assigned to dom_io so mark it as quarantined */
> >> >>      else if ( d == dom_io )
> >> >>          pdev->quarantine = true;
> >> >> @@ -1595,6 +1586,9 @@ int iommu_do_pci_domctl(
> >> >>          ASSERT(d);
> >> >>          /* fall through */
> >> >>      case XEN_DOMCTL_test_assign_device:
> >> >> +    {
> >> >> +        struct pci_dev *pdev;
> >> >> +
> >> >>          /* Don't support self-assignment of devices. */
> >> >>          if ( d == current->domain )
> >> >>          {
> >> >> @@ -1622,26 +1616,36 @@ int iommu_do_pci_domctl(
> >> >>          seg = machine_sbdf >> 16;
> >> >>          bus = PCI_BUS(machine_sbdf);
> >> >>          devfn = PCI_DEVFN(machine_sbdf);
> >> >> -
> >> >>          pcidevs_lock();
> >> >> -        ret = device_assigned(seg, bus, devfn);
> >> >> +        pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
> >> >> +        if ( !pdev )
> >> >> +        {
> >> >> +            printk(XENLOG_G_INFO "%pp non-existent\n",
> >> >> +                   &PCI_SBDF(seg, bus, devfn));
> >> >> +            ret = -EINVAL;
> >> >> +            break;
> >> >> +        }
> >> >> +
> >> >> +        ret = device_assigned(pdev);
> >> >>          if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
> >> >>          {
> >> >>              if ( ret )
> >> >>              {
> >> >> -                printk(XENLOG_G_INFO "%pp already assigned, or non-existent\n",
> >> >> +                printk(XENLOG_G_INFO "%pp already assigned\n",
> >> >>                         &PCI_SBDF(seg, bus, devfn));
> >> >>                  ret = -EINVAL;
> >> >>              }
> >> >>          }
> >> >>          else if ( !ret )
> >> >> -            ret = assign_device(d, seg, bus, devfn, flags);
> >> >> +            ret = assign_device(d, pdev, flags);
> >> >> +
> >> >> +        pcidev_put(pdev);
> >> >
> >> > I would think you need to keep the refcount here if ret == 0, so that
> >> > the device cannot be removed while assigned to a domain?
> >> 
> >> Looks like we are perceiving function of refcnt in a different
> >> ways. For me, this is the mechanism to guarantee that if we have a valid
> >> pointer to an object, this object will not disappear under our
> >> feet. This is the main function of krefs in the linux kernel: if your
> >> code holds a reference to an object, you can be sure that this object is
> >> exists in memory.
> >> 
> >> On other hand, it seems that you are considering this refcnt as an usage
> >> counter for an actual PCI device, not "struct pdev" that represent
> >> it. Those are two related things, but not the same. So, I can see why
> >> you are suggesting to get additional reference there. But for me, this
> >> looks unnecessary: the very first refcount is obtained in
> >> pci_add_device() and there is the corresponding function
> >> pci_remove_device() that will drop this refcount. So, for me, if admin
> >> wants to remove a PCI device which is assigned to a domain, they can do
> >> this as they were able to do this prior this patches.
> >
> > This is all fine, but needs to be stated in the commit message.
> >
> 
> Sure, I will add this.
> 
> >> The main value of introducing refcnt is to be able to access pdev objects
> >> without holding the global pcidevs_lock(). This does not mean that you
> >> don't need locking at all. But this allows you to use pdev->lock (which
> >> does not exists in this series, but was introduced in a RFC earlier), or
> >> vpci->lock, or any other subsystem->lock.
> >
> > I guess I was missing this other bit about introducing a
> > per-device lock, would it be possible to bundle all this together into
> > a single patch series?
> 
> As I said at the top of this email, it was tried. You can check RFC at [1].
> 
> >
> > It would be good to place this change together with any other locking
> > related change that you have pending.
> 
> Honestly, my main goal is to fix the current issues with vPCI, so ARM
> can move forward on adding PCI support for the platform. So, I am
> focusing on this right now.

Thanks, we need to be careful however as to not accumulate more
bandaids on top just to workaround the fact that the locking we have
regarding the pci devices is not suitable.

I think it's important to keep all the usages of the pci_dev struct in
mind when designing a solution.

Overall it seems like might help vPCI on Arm, I think the only major
request I have is the one related to pci_remove_device() only
returning success when there are not refcounts left.

Thanks, Roger.

