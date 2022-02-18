Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2F24BBABB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 15:35:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275511.471438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4LI-0000dE-6f; Fri, 18 Feb 2022 14:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275511.471438; Fri, 18 Feb 2022 14:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4LI-0000aQ-3P; Fri, 18 Feb 2022 14:34:40 +0000
Received: by outflank-mailman (input) for mailman id 275511;
 Fri, 18 Feb 2022 14:34:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YtLv=TB=citrix.com=prvs=0411da6ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nL4LG-0000ZM-Q1
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 14:34:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e499195e-90c7-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 15:34:37 +0100 (CET)
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
X-Inumbo-ID: e499195e-90c7-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645194877;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7VTNoFVDNGcjQfdLiA7ylnRk9qV10cync6xBOedRTiw=;
  b=QAHd+gsoAw/iMz+t84iot3A745iHxzYdbqmthlOJvVu7WZUG5fX8gOhB
   XJHJof/AGucrSBrXURnrrQoH0yLhU5KoJEy/NihkHRnlObo+tMqV5MQY0
   49IZd+SiNwJPHPTuXssIVbOQzbNzYx+NSfMxQwRWEp4S0QoCK8H4dqVF2
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64417970
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:q3HvnaKNiG8yTkHxFE+RxpUlxSXFcZb7ZxGr2PjKsXjdYENS3jAOm
 GQXWmnXOPiKM2SgL4pzOt+zoEwD7cLTzoUyGVNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc42YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NRQmsaQVD4jAqeSh+M2SQhYLS1FGbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gls2pkRTKmGD
 yYfQRRhcBudew9+AWwKC7khrMatn3rmVzIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 GjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsvwMzAfpNKucG4l+SzYHO8ganClMgUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNeZJhKTysDA3CMqsyq7AHzFtW
 1BexqCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wNuWsifBY1bJ9eEdMMX
 KM1kVoAjHO0FCH3BZKbnqrrU5h6pUQePY+Nug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid9408BCLanOnGPq+b+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwkzITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:xyo+r6nF8dwNbiyusYo9p2+zIavpDfO0imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICO4qTMuftWjdyRaVxeRZg7cKrAeQfREWmtQtt5
 uINpIOc+EYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ARV0gJ1XYGNu/xKDwQeOApP+tdKH
 LKjfA32AZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kSFjiWWgPNJt3ck4l+KSHqInc2omRCek1Jd0J6d
 P8bG8=
X-IronPort-AV: E=Sophos;i="5.88,379,1635220800"; 
   d="scan'208";a="64417970"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=af74N8QXH5MqPxnqegTCdHwz1KfVlQYKl/XzcAuBz2/MJLVnuQ0agrWyM9qDgklh55++k3WdNOU6m2OFrmMX7UsLITenguiduGXcFd7cSFgXbSqQxln2pQ5iXFW4hb5lFlmEqDoQ9txbyISkYi+GwxQbE/Gd5sGz0O5icr2ZqJblgRRA94tECSAd3Nff5BeeY2cGWTktXQy2HNKdf7aEW/XQxSlC54PfTsn3zmC4XGENysXgevQIUa0zlX36IwA53IBHPT8+TlJj3MbhJy5/4RbDfo2zRM3NXJfdH/DftWS0nqCSM1PfQ3DH1M9B6teostxVfQFJSAEAn+G+H4vhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nv6gW1Mlt7VQSuRHTBBB8hz+ff/2S3H03ut9wK9Gkqs=;
 b=kpzao6FfhQcuy/b+7ONocd+T5NG8jtvpAitOq7L7WyqC3XwvxAfWxPCa/3MY0NGVQ4RjkIVtt+VEsNEsaJuEywTaaDC4VbZ44XwSd6R2K99e30yK4h34DvTeq+5VLD0Mo+sY6wI5NZw64W+PbbS7EzotrfoJ6NUNoe8kl44MeRBeMvjDwGjlv9esJuSNsu8sO5d5zJHYf3ZR0Nqjgs8QfZ1ybSPRHLfkCUkDCd7C6ji2ca+u/oQYdhKMSQzlYvEt5RVYmF6tCjbWaevHvy1hlTOaYBiWO5a5n/dXHoFrOpCFx8EquPR8GRkAscBO7+SbOzWFmZuIGAY9niCtHEfJ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nv6gW1Mlt7VQSuRHTBBB8hz+ff/2S3H03ut9wK9Gkqs=;
 b=wiO8WYATf5WL+xKwB+hhSYdeF16pHxycMC0cnrJvzFUVI6cfVBL916dGEd771LEzy6YMl9aVAolB0zvXDyJ1Zzk6sEWYeIJY2n9KGg4jFlq5dgbm88TEJ5fioVHMJlG4auMw9excVLvfp0zp+yRw3hde8l4FBVqFAGVqHMMmSBI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/3] x86/clang: add retpoline support
Date: Fri, 18 Feb 2022 15:34:15 +0100
Message-ID: <20220218143416.34475-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218143416.34475-1-roger.pau@citrix.com>
References: <20220218143416.34475-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0299.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb99fa3f-f0f6-4ab6-9992-08d9f2ebc6b8
X-MS-TrafficTypeDiagnostic: DS7PR03MB5543:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB55434A4956237A22A3AD4C308F379@DS7PR03MB5543.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: afrksBiQhL2DSkJ+wcpQZ6SYNWJCdbFz2QXClNnywRbQt3SDSU8DqUJOMt4xAg84JocBim3vzsNlsE9hQmQ+ibaxOBGC1NjJr2X4+hO5F7jEdx+MbUOTxqn8bODZQnHPdq3OWbkL6IEA3dAzaCLUhBFRqC6Ip3tSaKXnXm7x+T7f+CxRx9RCwnUR4mJ90L+6CwUtMflYPUAyoKIV/7SJ71uCezF87vEKcrd2yQ3rL8iHI64gZ3ZTDU67QtxkFHMvS1rI/FWm5FXRUgsYKaCOKauT93j+ZLIJnuSioKitLUEMuzZ8w8R8/YF8tIxMx8It7Pw3lMECPgrZ7uTLdIrml4TaRUrD0d4D+4PMN/BfdoIu2iq4jgnAWImyQTV3JNmGg4TqFPe82iCFo9188mZ2ZMktm/1iOkEmwuGBvOMcxOGWl4b2K0JojEOowMA0L3fUMI1Rprg5YI+zdnqMFbrEiRfJlFDmymwgY9WGs/WeLj1fNd181WFZLfz+I1Yzq14sYyg5FdXLQtgJNrIK53SUCQcG/yxaqB/YCUeM1LycAxUt5J6v7hZzoYS8IIVOlnBRVE4vve7Dc8bKzKKuKTRfrrhsS3S/5BPq2dIHn3EfaRtEFnl+WFjsAeO4lDsUUwKt732q3Efwm251ZH5tsFuJWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(6512007)(36756003)(82960400001)(8936002)(26005)(1076003)(6486002)(8676002)(6666004)(6916009)(2616005)(66946007)(5660300002)(2906002)(54906003)(66476007)(316002)(66556008)(83380400001)(4326008)(508600001)(6506007)(186003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWtnRWZhZFM1TEJ6SS9YcHdFcGNINW9pMk42QUN5bjRCTXI3Z2lTTGZDWnlm?=
 =?utf-8?B?TmF3aHRSaUdYazkxa055L1RSb25xK0dlL0VqUE1PN2I5aFF0YTNRb0I4b0U1?=
 =?utf-8?B?dm1UcVVHK3lXUVphd2FmQ1RGUVJJZ2xEU0x4dGFWOXpHMEZoUHM5WXFuWFRy?=
 =?utf-8?B?dDBIYU55L0JPWlRGbmxscVljWVArWEZzdnM4dXcyS0I0dTVDUllza0o4Qy9E?=
 =?utf-8?B?clMxOGFwUnZ6d2d5cjd5REd0MzFPcjhZQnJRZWkyTVcvNnk4Z2dNV2o4OWo0?=
 =?utf-8?B?Rmh3YUNJZGVKeGljTnVWZ3RjdmtXdFg5SG1ibnRkcVhodFNDKzZiVlE1ZFd5?=
 =?utf-8?B?azN5N2t1YkNvUnNsa0NyODdJWCtDUVVPM1hkMW0rMTQzL0tvNERONnptajdL?=
 =?utf-8?B?RExHSTV6YTZZeDRSSitHa1BTQktGK2F3YjV6ckFSTlNaMi9QdXA1MndjUjZk?=
 =?utf-8?B?QjAwVHFwOWZNa1d2elJzdmdodk5PMUVvYi9wcjcwekwxY1RJbEZITFoyRDln?=
 =?utf-8?B?Ry9hT25XWlY3eTl0eGJVdzd6Mk05QkZ1aGUwZWZUaDlveGRBa0liYzNTclVh?=
 =?utf-8?B?TFZOdVI0c2pGa3l4L0FqWkZnWmFQMVg1amhSb0k3Q3pyM3NVcFA4TlRxVnZH?=
 =?utf-8?B?UWlTb2l1eWtvZDV5UWs1aUhMY0ZxRTg1NDVONUowQnIzOXc2VEQzZ3NuK3gx?=
 =?utf-8?B?eHozNUljMXVLQWIxak5FbjlwZW1aL2xRSVk1V3JyL0w2amt1NzUxZmt0MWZP?=
 =?utf-8?B?K1FFdFFrRHVnNTNDL0J0ZTZiQS9hSkVmaWVXancrMWZDL083ZkNWOU9uTkh0?=
 =?utf-8?B?ejZyb0RQQzQyTjYxL2UxN1pkODg3aVZFVnM5OFdybmtBaFZsZ2gzVzRyRDVR?=
 =?utf-8?B?WmdzbFJBUlRDZ1lyWndhdC9KV0t5a2NLNjQ3Nzgrc1Fsb0RBVVFqSTVvZzVN?=
 =?utf-8?B?MkVqdktiZ2EvTXhXYWpWUTZYc05zZ2dSdUFJbGk0cnpnMnJqekpaUXBXK1NM?=
 =?utf-8?B?UXRNMlhvM3M0c0hCeGRseEVlNWNYeWg2SUFpTG11WXNxaTgwbFZZT0NUZERF?=
 =?utf-8?B?L2NhaVlxOWxqVE9mb3V5Qk1JSXpTK01DZkJzejh5RnF4VnNUU0NQVFZmV1NF?=
 =?utf-8?B?dXJHYkZOWUM1TGVzbE5mK3BRdDZhWEM4c1g2VTljK1JCblIwc3Vtb1pFYjI1?=
 =?utf-8?B?M0tINDZsMnlLVXF3eS9xMXlGN0NVR0dZREFiUlhaLzFyWVdsNFRIMVZWZnZ0?=
 =?utf-8?B?L3hYTmhQRC9KNFl4M3c2NDNEOTUzYWp3MFEzT0F1N1hCUkE2amJwdG9IQi9y?=
 =?utf-8?B?MlVIeGhtMDNxNnlYWmJHQnFPMGxvT1ZVNzduU3FXUFFLR2VocnNNVWRLM0pW?=
 =?utf-8?B?UmhhYTZ3OXNCQ0NKeVY5b2UyTi9GT1lxQ3JqN3FtMXpPeHI0eGJOK0VoeXN4?=
 =?utf-8?B?RnVhbTN5TEpZamM3bHRleEhrSmRRK3A1NldHL1hWamVaeDBNUUhyOUhlNUZK?=
 =?utf-8?B?OCtSUGpTanU2Vk9ZMkZ3azN6YzNCdVBHMS83WXFzUEcxTk1LZkZodUVoTE5o?=
 =?utf-8?B?Tkw0VVdPTGx1NHBYWkhiRndFb3E5a01idzg3Tk4yNzdROEZ5Mis1eGtTeDBp?=
 =?utf-8?B?K0tqTUtnUVVBTEFPdmF6YllhWThheGovQ3krdVFuV1lPanRnOURIck9BRXVL?=
 =?utf-8?B?MGp0VUxaR3VsU296SkVRN2Zlc1dtK2NDUEFXWjl4QTVTeVp4cmNZWVBmdTcw?=
 =?utf-8?B?cW8vMTEyeXdHUG5qaXZSUzl5eWJhS3F2cHoyVlJVc053Y21yejQwNCtOa2NX?=
 =?utf-8?B?UU51eUp0N2hkNm5FajNSNWVoT1VRQ2JYa2hESE14bHg5RGlZSGhrNVVseitL?=
 =?utf-8?B?SSsxRE9UZUlnYzQrSFJxWHlCME1ERG9YRElyN3VnUjhiUzBDTEpqWXpXQTMr?=
 =?utf-8?B?R2RRK01mem0wclJFQmEvM1MyTy82czQ4bkZuSVJBTnhVQXNvaEM2MWltMmNR?=
 =?utf-8?B?ZHJoclM2UHdOMC9DNVlpdDhNZ3dydGJFM2tMYWFRNk1YNFBWNDBtTFNFTlJE?=
 =?utf-8?B?R080ZXdMZmFUMnZwQmhLblczRVc1SmxzeGVDOTFCRWJzWDhhNDd5SWFsMUIv?=
 =?utf-8?B?TEI5a29SL3VsdFdPajZ0RzQrM1plcmIrQ3oydkVDd0RvOTI5MDdmQWlTeUp0?=
 =?utf-8?Q?IKq6xAPMDC3jJRlBxxrCb7M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb99fa3f-f0f6-4ab6-9992-08d9f2ebc6b8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 14:34:31.6421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJpOkLrqsXkA6RLDZT+oEdkAjcvwZ7v4mVJTBmDqS4LrebmlAU3dJqfW5Qw5FkdLCS/2iufT62x+xbFJtMFXhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5543
X-OriginatorOrg: citrix.com

Detect whether the compiler supports clang retpoline option and enable
by default if available, just like it's done for gcc.

Note clang already disables jump tables when retpoline is enabled, so
there's no need to also pass the fno-jump-tables parameter. Also clang
already passes the return address on a register always on amd64, so
there's no need for any equivalent mindirect-branch-register
parameter.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/Kconfig | 4 +++-
 xen/arch/x86/arch.mk | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index a1a90da4fc..f8dca4dc85 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -33,7 +33,9 @@ config ARCH_DEFCONFIG
 	default "arch/x86/configs/x86_64_defconfig"
 
 config CC_INDIRECT_THUNK
-	def_bool $(cc-option,-mindirect-branch-register)
+	def_bool $(cc-option,-mindirect-branch-register) || \
+	         $(cc-option,-mretpoline-external-thunk)
+
 
 config INDIRECT_THUNK
 	def_bool y
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 6388b1d93f..066d749ba0 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -47,6 +47,9 @@ ifeq ($(CONFIG_INDIRECT_THUNK),y)
 CFLAGS-$(CONFIG_CC_IS_GCC) += -mindirect-branch=thunk-extern
 CFLAGS-$(CONFIG_CC_IS_GCC) += -mindirect-branch-register
 CFLAGS-$(CONFIG_CC_IS_GCC) += -fno-jump-tables
+
+# Enable clang retpoline support if available.
+CFLAGS-$(CONFIG_CC_IS_CLANG) += -mretpoline-external-thunk
 endif
 
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
-- 
2.34.1


