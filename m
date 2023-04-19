Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A856E768E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 11:42:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523287.813191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp4KM-0003q1-Gd; Wed, 19 Apr 2023 09:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523287.813191; Wed, 19 Apr 2023 09:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp4KM-0003nf-Dm; Wed, 19 Apr 2023 09:42:14 +0000
Received: by outflank-mailman (input) for mailman id 523287;
 Wed, 19 Apr 2023 09:42:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pp4KK-0003nZ-S8
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 09:42:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74154e24-de96-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 11:42:11 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 05:42:03 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5510.namprd03.prod.outlook.com (2603:10b6:5:2ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 09:42:01 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 09:42:01 +0000
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
X-Inumbo-ID: 74154e24-de96-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681897331;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RLWIMFXKjEqHXJfkfeAHLj0Cn07ctCqIClDuKE7Z+O0=;
  b=Fas0rAJwLq3lt3SbqTinQmO3TfC7osFVl1Y2fm8f2N4+SnqyDU+Q9ypQ
   HXCZC3YPJ5N5lQHbvQdhgivvfIvF+oJuBkdVYPShRkxGHf5Z9RtTwy03z
   bQmAt+1pQplzbGkfJ2Nr6OMKbIHjt85xghYBRlYSt4jTQ843/JbHWaPQQ
   U=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 108516847
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0KKuwK9ww2vEFbpj+nBZDrUDBH+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 DccXzyAM6mJa2b9fNpyO43gpk0B6pDSnN9kG1M6rns8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOakb5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkU+
 OxEKCAfaCy6uPutyrzlFeNRgdk8eZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpiNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXzX6iBtJOS9VU8NYzmlmzyEBMGScqSEm2rqi40HTjHMBmf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSNEgrt5wejUs2
 XeAhdavDjtq2JWeTneY67GVsSL0PCETJGAPfwcUQA0d+d7hrYovyBXVQb5LEqS4k9n0EjHY2
 C2RoW41gLB7pcwW06S2+3jXjjTqoYLGJiYu/RneVG+h6gJ/Zaamapau5Fyd6uxPRK6GSnGRs
 X5CnNKRhN3iFrmInS2JBekIQreg4q/dNCWG2AY3WZ486z6q5nivO5hK5y1zL1toNcBCfiL1Z
 EjUukVa45o70GaWUJKbqrmZU6wCpZUM3/y8PhwIRrKiuqRMSTI=
IronPort-HdrOrdr: A9a23:NCVxgKPJV/VDWcBcTgejsMiBIKoaSvp037BK7S1MoH1uA6ilfq
 WV9sjzuiWatN98Yh8dcLO7Scy9qBHnhP1ICOAqVN/PYOCBggqVxelZhrcKqAeQeREWmNQ86U
 9hGZIOdeHYPBxBouvRpCODNL8bsb66GKLDv5aj85+6JzsaFJ2J7G1Ce3im+lUdfnghOXKgfq
 DsnPauoVCbCA0qhpTSPAh8YwDbzee7767bXQ==
X-Talos-CUID: 9a23:ONikfm0mWSmkfFlOJG8M1bxfQM01Ln3N3nHsGnChEmxnFuKfdFiN5/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AVSZ4LA+1y5cNwTLYo4wNzgGQf55y54SgJB8cq6k?=
 =?us-ascii?q?bqcSLZC0qAWrang3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="108516847"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZYwLqpT5CDZKJZvDuwbJHUUBh7vS610tyZkM1KO2N9asaT0PcgpbAWohpoAouFcy3cpIKkj5GtdAl82v2tDx1TdUJMDvB0ZiYt96C3jPUCv0adqcPyZCU/dNg0k6wXxb29RnhbtCERspX/0d038smfEMdRqBWsySjepA1dANSLwgPOQEhQp2it2+6oDvbx7Of4jOdniEbj8SfvXK4iQH8qy84kHgi4+rR2qvX03F2otLFotxfaXihqB4LAXL8SZ7l0eUfRnYHJzIuzhQm1qZwrvnOcxdCbYSrbV6NGJYYP6k/STMR4maV7CgHXarEqA62dTG9gmDp2Cb9clPv2R0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A15T0GhBZob4zDopz2ez9OET1z5EhIqj/3n3yuOhFkc=;
 b=GAThWiEUABvteL8V4DgpfrNv7CFeIegqbdfSq5XrwMjLjkxrKdaSI4BmLfdrdxbMY/th8PdhBhjztK44eTRo5IwuWkMPMxwPs0wpHgr7+ClN2D2eXZpxqk2t3ug2r4ye0EQB4vGN48Ee69V9CUP524DpvXK1YqBAHzhqLzGkezeCG1WDDACPOWdzjt7uJh/z/DERpK2OAT79YqmuAV2scJ1FIWptK43ySJK9sCFmCDmFTNOaOT5WI/xhYSQIOOrqUMJSWaX4li4Rc64spICSiG3JcUNxOXYV8QUrq8RFt43Tkk/WhNuHOcAJ+gh19/iI/R1vcAx+3LqI182Iswv5VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A15T0GhBZob4zDopz2ez9OET1z5EhIqj/3n3yuOhFkc=;
 b=mmYhOy1WSIv3ncvvMQ3OOHtpjkFXF9p6cg7uXNbjhRE2Mf66OkvmoL+YlBwo6Dil4v91mtH/BEfZNmxXA3Ll6O+2uUw1lkzfhG617HDW96B1izk21n6p0uAbfoEuAW0Eva+hSGhD2diP6SbWToXxY0XnKYo6aEfDyuie4Zwl1Q8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Apr 2023 11:41:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/vcpu: remove vcpu_set_singleshot_timer flags field
Message-ID: <ZD+3Y+YYQxFSoAJi@Air-de-Roger>
References: <20230418154223.20181-1-roger.pau@citrix.com>
 <225aeacd-7d8d-3832-8043-4f565403c2d7@citrix.com>
 <ZD6/Fk6S6D421AgE@Air-de-Roger>
 <acea0109-967b-f3d3-2a60-b71e5a207ea6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acea0109-967b-f3d3-2a60-b71e5a207ea6@citrix.com>
X-ClientProxiedBy: LO4P123CA0364.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5510:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1ed386-ee0e-4423-42de-08db40ba536c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h9pkxaxnWn5cVJdq13fuMJOx7DO3GsMKQDJzv3uXTXA3D2OQpt/ChYz0mJo14DIKTJbHmEiX2oZOHcirIV00NsX8hmGT5HXp/bpK2URmivPhoP5wNyz1VZjIvpBu8pTh9qdESOctvfI8c2azAdMIqdpNS5EB8VdhJaMpoNK87pjM4eYwigXHP4YEjBXJ/a3mW9/vLDPZ4fobUGcYRHev5pys/Aqb1is4rC5lfL3sTng+5T5XT7pUkU5KGVMpOX9JDZ1tavB/w+gdOP13cf0D6PNT420umkCGgYc5icfywi7u/sNSJiRTBchOTJXkH1B31Ms/zRIslMNgLriazrXcP+OCrDbLlq1yrtbR2Cb+LTO9mJO2HeNe4JnQkSRP3PdJnc7ksVbqcsIh1RR4ow5Q8U9gL60mRT3caUyM4c/pXtYb1gVxuOwoIalPSIOP0RPAGJ8BgFgl+Sam8noWzyWPTHzNrbv17R6e9ePOWhhhp0si2TPgbCcSdbi8CCYoj+RIt50JKPNzcKEvfhtmR7fshwi8Axswy8yyHiO7qupWDE6cRQvS33DS9onahsl2vc92
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199021)(85182001)(2906002)(8936002)(5660300002)(8676002)(41300700001)(6862004)(86362001)(38100700002)(33716001)(478600001)(316002)(53546011)(26005)(6506007)(9686003)(6512007)(6636002)(54906003)(186003)(6666004)(6486002)(4326008)(66476007)(66556008)(66946007)(83380400001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eG0rWVhPTGlSM1ZXZExqOWpLaUpBNXFGTWFtUjdTNjJKcWVyVDlkZkxmVUtt?=
 =?utf-8?B?U3BmdE8xUU10eUhRWW0xOWdBUWJ4K1M0N2xHYnk3eWdmczdPU2I2dHYya3Iw?=
 =?utf-8?B?dUdWWVBaWldCbGcwVmRYdzR4YlVMZDVyVzVqdmNOd0lDQkJQdmlJWjdoaEx6?=
 =?utf-8?B?ZS83Y2UyVHpIKytNZUhhbUxrcGI1dnJBR0F2dFRaNXZiRHJpSG9MMWV2OUM1?=
 =?utf-8?B?TFNYM3MrRHhST1FWWVI1Wkx3Z0xtcFA4NEg0WXk4UzVRaTFObWRZMkgxVTI4?=
 =?utf-8?B?bjhQMGFqRXFVM1VwY1VOTFFudW5RS251K01uVmN2MC9oK0JrQ1pBTThxVW9V?=
 =?utf-8?B?ZDVwRm5HaWJFVG9UNGNZUGhid0NmakFYbTl3SE9uVGR0cnlFQ3FPZjZHZmNH?=
 =?utf-8?B?Y0JLd3BvcGlMc2d0UmEvNkhRQnJwQjBtdnVFSVJSeXR0MlFxRXRnOEt6T295?=
 =?utf-8?B?N0RuMGtpY0ZtOW5aMVd5RGszc2RyU09NQWlwWEJ3UGtyTC9HZDJQWW1LVHBl?=
 =?utf-8?B?V0h1UFc3MEVCZFZ1dm9aMEQ4ajFOTVM4Wk52SFA3YWFSREZHNklUMFJTclhy?=
 =?utf-8?B?bWNHVnZPeVc1U2NGSnJkQXBxQ01UdWtEL05hM3F4bm16NktSTFVwWFRrVUQv?=
 =?utf-8?B?N1NvZUpIbUtRT2pOKzU0eW9rU3pWNG8xKzZoZVQ3SDU4NE1nWnE3VkpSQVUw?=
 =?utf-8?B?ZVoxVHhqWDEwZEJ5WG03azRUZlpCc1dDd2g2NWRiVDRlM2JhY21JMHdhSG5L?=
 =?utf-8?B?cS9SU1RJZlVmWlV4RWZha0xvaFo2N2VCSEtRR09hSHNtckVWclFiYXp3dXEx?=
 =?utf-8?B?dDR4ZG1uWUU5TU9rakE5eGJCaGVuSjMzNlFzay8rclkwZVZqTWdJemIyR3Ju?=
 =?utf-8?B?ZU5iYkJkbmh6bXVHc0hKVExtUVhGaURSdUZJd01JaHJ6SVNjWDZyaWNPRmlx?=
 =?utf-8?B?VWJ0TUZsQ2c1TnhuYUtxcm5qeGIrb0JobmZJSU1oc3dyM0sxUEJKUGRYZ0lY?=
 =?utf-8?B?OWoxZ01qTE9udFkvaXJTWHRjVG1QZGNEYm1ZbnFoZzAybmhsMno2RnZHUCsy?=
 =?utf-8?B?bVhPVjVHZFFBS3NHNDJsaWtGOGVOTWlWeU0xMmdITm44QVM0eVdOTzBtWFZy?=
 =?utf-8?B?eGw3NXlDaWJLZHM0Vk45azIrdklSQS9qNVE5R2U2R1N3cFhRbG5MSEhsc1Fo?=
 =?utf-8?B?ME1leTdJSGVFZjRVckk5ZzJ1bnBUT2JGMmlmWnl0RjkwR0tVUzZVNVlON1ZL?=
 =?utf-8?B?blE2SVBVWVpISjBmbi9SMjZ0RVFRaGozbkltWEM2Z0I2OG1YWUpFaWV4L0p5?=
 =?utf-8?B?RkhBT0pCUUEwZlpScE04cm5zbEJGOHlJNUplYWJrMTc4aU9YbWtsYjVhcy8v?=
 =?utf-8?B?Mmt4Uzl4S2NNc0Y0OWp2WDM0eWkzOGRNVFZMTGRqRytzOU9tUzRJMmsxeFFZ?=
 =?utf-8?B?ZTJSZjdmdFAvNVM0eHBETlRac2l6MUJRS2VCNzhBM3J3c0ltYkhrWWUwamh1?=
 =?utf-8?B?ZkZpd3dqckh6aUlKQkg0NVJBZmYvV1pwVTBkaVhmM3JBTlo2cHhxckVBM056?=
 =?utf-8?B?cGx0cmtJWjV1R3kyeGVSbUZvL1haMFBtRmErNGQxMjFlM21BejZOMDJsMmxr?=
 =?utf-8?B?cUMxNzVPNTZDbmF3K2tHMWNwNURDWndROXYyQVBLZm1VRnpkTlNBVWRXamNl?=
 =?utf-8?B?QnNiN2ZLaXhLUHZ6cUdWL1lteE9GZGs2N05wTVRDZnBPVWJUc1dVNDBmWmFT?=
 =?utf-8?B?Z3VtY0lrWm9JRi9zV1VrV2ROSWI4YXFhV1BJenBuWTZpTE50QzArd3I1cTVs?=
 =?utf-8?B?V2NMTDNRTVRxbzFMZ2YvV0pQUjdLaE5uMzRJTXlpWUxPTEE2dUlxbWZmV1g0?=
 =?utf-8?B?OGh3T1lDelNXdGJ0NmFIRWdwdjhmaXliQTlZTkJhVDRCcThzVDV1ZlhwbkZD?=
 =?utf-8?B?RDZCNDI3VFFHWUhBTVRBZTdHZDRaYjFXZkViZnBBMHBQNUNmQ0w0ZXZGd1ll?=
 =?utf-8?B?K1VzMkV4Y0FreWVEMzdCVkpWZ0I2SllQSmZXWkVTT0VLQXFiRkE4NjZHV0Zo?=
 =?utf-8?B?Wk01dWEvWFc0d0RwODk5UEZzaEtwN1JhYkxETjlpajNKclBpLzA3MkRFWmFk?=
 =?utf-8?Q?ONGSs/LQ1TH5HguB+Ef2PZP7M?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M0arHisaJR0JSX9/rxdCaPFRWSOOyiIG9Hn7UCqjwWUEiK2rfQLqvJdsrafu1k8O061Fh+GfnQ7mEGYBB5Gy3bRUVcqoD7/haigQh66WbyeY5x29s5WAY0qDNAM4+eXD/sapzssSQo9TEfPFz3uYZLnCwxExoDFszAc5IQjmn1k9ldPgX8A5vU3HUxN6uaI2olU36WAYVZuDYPGiFY8pW6oscJZidpKYLd7f4mOX0A2/w8HZ0XjKyzwaNjlB/CeVzesVo0iP33NCPie+locJ39fK+YKH8adX0amenJYiSqB5CinIMZahhptdALWRBYG4zGxSZBj3W1eOn94NCoXg1towWPxgONmBaz9xlvSe2Scijfvc3Z2if4GiC5M+e7K3ONBkswVvKXV7dr+I2CwywYN+sbamxuREwW4IqFASFL2O+RNXu8+Nk2BfcUXkHCUj8IS+rsw2BGa4M6PmjQ9I5HCWxMWYbzhkh/qfK50rrtj/7QmgiVatJe/pTa2VAmB2b9LZFH2DwjXf+rpSvbyPmoiR6QcPMZNlUyOyuX+FR1zMi0aIYi77T7xCAOYOriXlDa+WpDhFLyWbqA97i83GS47sbB3nQJtztJr394PmOnzS7CrbuZGqx2mdHVsHMmCCP9bPX8OiJPet+snOysKqhYe/lub3JWdxjNuNoBNHJcHJnP+iDtt7MJD5Fm/PGoWn0LdVMbmuQ7Vv/B/Kxf/ZqVNMAuDBrzYhkC8+g9VCSChv9KIq8cQaG8TT5agLj7jLli37vp9/EdR+Alm8hKIU5EN7heKJUWMqjMNQ2KgIlDUrxLpITCnyqOF0k7RH2edacTWK08m1gWHK1s0q0NEGWtdn/BqNmkDpXqi/KY9StTbVwAsjrHk7m5sXggOFIXv+akBcn+MxJEiKf2DKZ+OJZx8N/LI8Hg+KjIOu0g7+qJc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1ed386-ee0e-4423-42de-08db40ba536c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 09:42:01.3667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MYJP01+qXclTssKy3etEmXEY/a46OEKN++chyG6hr+hhFmeu9/JjtgsyTrlyP//HCmKCKyj+oTwu6Z4pieRgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5510

On Tue, Apr 18, 2023 at 05:12:07PM +0100, Andrew Cooper wrote:
> On 18/04/2023 5:02 pm, Roger Pau Monné wrote:
> > On Tue, Apr 18, 2023 at 04:54:49PM +0100, Andrew Cooper wrote:
> >> On 18/04/2023 4:42 pm, Roger Pau Monne wrote:
> >>> The addition of the flags field in the vcpu_set_singleshot_timer in
> >>> 505ef3ea8687 is an ABI breakage, as the size of the structure is
> >>> increased.
> >>>
> >>> Remove such field addition and drop the implementation of the
> >>> VCPU_SSHOTTMR_future flag.  If a timer provides an expired timeout
> >>> value just inject the timer interrupt.
> >>>
> >>> Bump the Xen interface version, and keep the flags field and
> >>> VCPU_SSHOTTMR_future available for guests using the old interface.
> >>>
> >>> Note the removal of the field from the vcpu_set_singleshot_timer
> >>> struct allows removing the compat translation of the struct.
> >>>
> >>> Fixes: 505ef3ea8687 ('Add flags field to VCPUOP_set_singlsehot_timer.')
> >>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> While everything said is true, this isn't the reason to to get rid of
> >> VCPU_SSHOTTMR_future
> >>
> >> It 505ef3ea8687 does appear to have been an ABI break, that's
> >> incidental.  It dates from 2007 so whatever we have now is the de-facto
> >> ABI, whether we like it or not.
> >>
> >> The reason to delete this is because it is a monumentality and entirely
> >> stupid idea which should have been rejected outright at the time, and
> >> the only guest we can find which uses it also BUG_ON()'s in response to
> >> -ETIME.
> > I agree, but didn't think it was necessary to get into debating
> > whether it's useful or not, since its introduction was bogus anyway.
> 
> Well - the reason to actually make a change is that (older) guests are
> really exploding on that BUG_ON() for reasons outside of their own control.
> 
> And the reason to fix it by ignoring VCPU_SSHOTTMR_future is because the
> entire concept is broken and should never have existed.
> 
> The ABI argument just adds to why the patch ought to have been rejected
> at the time.  But it was done, and the fact it has been like this for 16
> years means that the ABI shouldn't change further, even if it done in
> error in the first place.
> 
> >
> >> It can literally only be used to shoot yourself in the foot with, and
> >> more recent Linuxes have dropped their use of it.
> >>
> >> The structure needs to stay it's current shape, and while it's fine to
> >> hide the VCPU_SSHOTTMR_future behind an interface version macro, we do
> >> need to say that it is explicitly ignored.
> > Oh, I think I've dropped the comment I had added next to
> > VCPU_SSHOTTMR_future that contained /* Ignored. */ (just like for the whole
> > flags field).
> >
> > I can elaborate a bit on why VCPU_SSHOTTMR_future is not useful in the
> > commit log, and add that Ignored comment to the flag.
> 
> The important thing is to not actually change the size of the structure,
> and to change the commit message to explain the real reason why we need
> to make the change.

Why not revert back to the previous (smaller) size of the structure?

That would work for guests that have been built with Xen 3.0 headers.
Currently Xen does copy past the original (3.0) structure and likely
copy rubbish from the guest stack from those guests, that might
contain the VCPU_SSHOTTMR_future bit set and end up returning -ENOTIME
unexpectedly.

Overall I don't see the benefit of keeping the flags field, even if
technically it's been so long the ABI was broken that it doesn't
matter anymore.  But still keeping an empty flags field is kind of
useless, the more that removing it allows removing the compat code
handling for VCPUOP_set_singleshot_timer.

Thanks, Roger.

