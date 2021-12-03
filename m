Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0653D46742D
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 10:40:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237214.411391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt52E-00067H-1Q; Fri, 03 Dec 2021 09:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237214.411391; Fri, 03 Dec 2021 09:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt52D-00065Q-Tc; Fri, 03 Dec 2021 09:39:17 +0000
Received: by outflank-mailman (input) for mailman id 237214;
 Fri, 03 Dec 2021 09:39:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRzA=QU=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mt52C-00065G-6V
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 09:39:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id defd6222-541c-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 10:39:13 +0100 (CET)
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
X-Inumbo-ID: defd6222-541c-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638524353;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2yYJtmb5fIZLYeLXP4GPlhnLFpMAAP+Aw4Cc/FQkjU0=;
  b=WSKXwF+NJceKDzQGb4Qr8Ca3eTHicwLEo8tiqqfecjgM96wt+Gx7mOlo
   cYErDauVnDp63Yep/GJDamjaM5yPFE83jeIgJzXaSb8ttzAqtk8PJkTAU
   2Op9peJRAinS/2AECTRahLnU4IpZJ6qpqfSgmSLo9IABzqPaYr0LyTjBA
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LQu59hm8dc4Syty5TuTLB+HGMn8aK0deJDzAE+2itFVTR8GX9wv0i2MNbzqubARhT3CL98JXb5
 tzIMz5wFBJzkDmIVChdyyMwx3FmUo/Kw3fWimfpbo7/klyQGGyZR5IA4AIGseG289Bix8QFFTY
 ICgUL98k1ZAzmN1ZznN1D1mIbhExXV5Ov6q/9G785gPR/UPup++dCIifs6hGPDXgdikojN94T2
 UbBr7xV9BDLpaojEOsc8e8iHfkl6TPj3212Y4E2VnbWFq7AvHOfzAkFdjPRt1mEJqwm8ZtOTrT
 8LNjuNQb1PbeyyOfacyoXhYk
X-SBRS: 5.1
X-MesageID: 59207896
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FHTVBaqADlvp2Xfz8t4taPWiMkteBmL1YhIvgKrLsJaIsI4StFCzt
 garIBmAbKyINGWnf4hzOYjj9EwG6p6By9RjTgduqSg0RCND+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx24DjW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYK2bRwsJo3OpPUiUQRdOQwmbZJ9x5aSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0fR66BN
 5tHAdZpRDXhZRR/HGYZM4o7krupjFP/aiQHjU3A8MLb5ECMlVcsgdABKuH9YtWXQe1Fk0Deo
 XjJl0zmBjkKOdrZziCKmlqujOLSmSLwWKoJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJuQRRDXh/iTC5ERFHYMNTatqs2lh15Y4/S6HAEwfSyZhauA3i80rQBYHj
 g+2pOzAUGkHXKKudVqR8bKdrDWXMCcTLHMfaSJscTbp8+UPs6lo0EuRE48L/Lqdy4SsRGqum
 2ziQD0W3u1L1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHd7
 BDoeODEtYji6K1hcgTWG43h+5nzuJ643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK51gBuMALYyP0Nv4tC25UNyjM5fO7fTgCfqqLBuein7ArLFPXlM2QTRD4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOdUWHPTP7tRxP7V/23oH
 yN3apLiJ+N3C7alPEE6MOc7cDg3EJTMLcys9pEMKLfcelEO9aNII6a5/I7NsrdNxsx9vuzJ4
 mu8Sglfzl/+jmfAMgKEdjZob7aHYHq1hS9T0fUEMQn61n49T5yo6atDJZI7caN+rL5ozOJuT
 ulDcMKFW6wdRjPC8jUbTJ/8sI09K0j72VPQZ3KoMGolYpptZw3V4du4LAHhwzYDU3isvswkr
 rz+ig6CGcgfRx5vBdr9Ye60yw/jpmAUne9/BhOaItRadEj23pJtLij90q0+L80WcE2RzTqGz
 QeGRxwfoLCV8YMy9dDIg4GCrpuoTLQiThYLQTGD4O/vZyfA/2elzYtRa8qyfGjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRCu/EfxrJdvgfqC
 EuD9sMDZOeMMcLhVlUQOBAkfqKI0vRNwmve6vE8IUPb4i5r/eXYDRUObkfU0CENfqFoNI4Fw
 Ps6vJ9E4gOyvRMmL9Kag30G7G+LNHEBD/0qu5xy7FUHUeb3JoWuuaDhNxI=
IronPort-HdrOrdr: A9a23:aNRfyKOYMkWuEsBcT13155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY55as854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nI/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Svl
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DPeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6Np+TgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeTf003MwmM29yUkqp+1WGmLeXLzAO91a9MwY/U/WuontrdCsT9Tpe+CQd9k1wva7VBaM0od
 gsCZ4Y4Y2mePVmG56VNN1xM/dfNVa9NS4kEFjiamgPR5t3cU4klfbMkcIIDaeRCcU18Kc=
X-IronPort-AV: E=Sophos;i="5.87,283,1631592000"; 
   d="scan'208";a="59207896"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvnbX1atvOPhKVwTQ+kiH8pxcjHfar+ImpD5d7bnV5+ZkseA9i7KDQxk0T0/G+azqZZE+2DRL9y9/kOXAuDdgUi2QQUZ7o8OIlkaLh0tWEV07NIdGBHwGYW8mKQHZ/rnKl3plQGWuU4WWS/B9wl5ipxujKmTumdATBhdo0LHnsFk5so1dj56vEwoLUyzsmj55PSKavzOQlcFjshBbD/+acTov6SBcRMmy7SbQWtVuyU96RsrxSWmNslC/WBuY6vnuZxOuGtEgMtDi1FMfctwsG+1Jha6gnGES27eHdKEzf/zG8pARdjbt42MWAHTGHaEMmj+V/BMGv8E9sXRQ8IoMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkBAKchbWbpbkskL+7dSQZsjum5Q2M8NmmaKhbouStU=;
 b=GYrDyty0WF3EJajxx5xuXlwzLRuGlF3V6e3UpWp1a6o1I7ubKVZSnz/0EsfU/eZBQdP3YDn72PclmotBhUXbeXO9KTfioABgCAMrNFC2HZSceyb1wYSKxqBRe49gtjCuclPoQtruQEPSsKsRqdrXjYHb9q+Fsbf+00XeQ69+y4kgKeBdoThPRIwQBGTH0pw87ymzc5421+VU2Jqmh317RcAF7+0RLUcw4aRW9PInqLWxJdeb0vyN8g7ms9vl6H9C0oYsEp5SGBBP9KNfOHsoMaLX70jQxvqR4T7D18QPsLLuuC4bwvxCx/L/BQ0LPygWcq1bKWeN6JjXm2PYnFDuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkBAKchbWbpbkskL+7dSQZsjum5Q2M8NmmaKhbouStU=;
 b=ZUsoqtj4GN8b3qfeWV2wjBVYr6YipH/BSMi6PJNyjsWIhHM/3XaCPTpFDIDUWH39v3CZOVgdYTxutmMxkahGu9wmWKZcYCpjMxkv8fg35dwOtApRi/qBBYYwrHyG7Q/tA+r/LuwDFbk3juWfVeIrxuh41FpePyYbiW139x2eU6c=
Date: Fri, 3 Dec 2021 10:38:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 08/18] IOMMU/x86: support freeing of pagetables
Message-ID: <YanlrrHQjLDWh5fY@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <c12fccbf-82f4-1259-f69d-a6ad8d78ea15@suse.com>
 <YajubFeUclKtpqV2@Air-de-Roger>
 <03dbb062-002a-3770-61c4-4f93de73c0a0@suse.com>
 <YanViGSnE+uMwA9S@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YanViGSnE+uMwA9S@Air-de-Roger>
X-ClientProxiedBy: MR2P264CA0156.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 140934da-041d-4715-42eb-08d9b640baf4
X-MS-TrafficTypeDiagnostic: DM6PR03MB3580:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3580F3158DEA160AE0BAEB448F6A9@DM6PR03MB3580.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YTFQcDu+aUYp4/b/eiALVgqToQKduc2eJ3Ay2EEvpACRITCYps3upmHjEFzJkIObC0GwVh3jwzoc04qCGHGlE92q1wKpcC7DAo/IFx6RlggF+gjailAdrQdx9oU02YYLaDbLaKzuy51Xabupxve8JYqMwb0gEtlivnMuUuN/KaI26V5iEIwr3UAPwvEfUKyQxPpzBYStHlqLoSuchMfUu0Y2fdbDPsFBq/vuWRmN70HhD6s/GUCeCoPShYP1lmRyE0lgevwaaqrnQgIgTy4RhTkbR4iWesRAJngd7xOih6Wo0mW8fpZkuCt8vHisU3844h6oJwX5R5dyP3EteU3v7MRphHszpsYxOWLD+Sa/nxLhtHb0iISD6d3pq/cMnPlA8vconuvq+qbZvKhAbcM+nnKdxpuiZ8IGwPHwqWEOi+Kmr9trbd7n0413roKDG+0QtFjHl7pGp9z5CGPdy39FHwHT6wYsN72Jg59epflukrgxLIZik946oZeL+TwlvBSX249mRPa6XxahRfGEq+ymlLMdpxoLc+15nXHFbKG8UsQFJa8EOxJxuAsvjoLwL72KnrhcZmFsLHyz/S7BcH2C5112T/M7Qi6LJ82Rknuduj/c0plPh0l+HqZ649aiUHlsiWpB38uiAWcLGGeAJzwfVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(8936002)(4326008)(6916009)(2906002)(6496006)(6486002)(8676002)(33716001)(956004)(26005)(186003)(5660300002)(53546011)(85182001)(508600001)(66556008)(82960400001)(86362001)(316002)(38100700002)(54906003)(66946007)(6666004)(66476007)(9686003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dksvSEozR2p0UVhkZ3lMYWx2RmQ2dzVIQVlDMWI0K25QQXovZVVnWjg2aEhu?=
 =?utf-8?B?TkhlSWYxTzlHZDl2Y0dPZU82R2ZtYmVFUEgzOXdFbGRRekhJQ2hldXVmOTEx?=
 =?utf-8?B?R3NSbkhCSmJXUHMxY3JmbTRNT2YyU3Jzc0lVS0lFc1R2WHllTllGKzNxbURZ?=
 =?utf-8?B?QkpvSFByU3AvbEtVZ0VYOTJvU1ZHSkRYeGZVU3ZVeldzY1VmZEFweEE2QkhZ?=
 =?utf-8?B?ajIrUEU2L3V1SG5iSUhXbWNsdTFsa05TbWVOdkpqODMwV0xwL1FYT2JmaXVY?=
 =?utf-8?B?anI3MFZXbzdBNUlJNjV5SmNFaXB6L3RHZVpJOE1tL29JNnpWL2FaK2xmbEM4?=
 =?utf-8?B?ZmhvWHE5WDhoYlY0SUI3U2ptSnZhakNxUjJBY01KUE9RMndMYlEzK01UWEI4?=
 =?utf-8?B?aVRzSkdiT24xc0RIM2NCTll2bm5SYzg4ZmVla1ZFVlB3d3FDMWxIeTVYWmRR?=
 =?utf-8?B?S0lWeUo5K1NOZ203UThPUEZnU0tScGZ0K2lhTzIzdjFpRXgyV2k2ZEJESSth?=
 =?utf-8?B?d0h6c043ekZZWUJ1UW9jMURFWjlBRzZDY1hoRSsyS29RR1p3UnQwRG4zYk8z?=
 =?utf-8?B?TlJPWG5mTmNZcjdSMS9hYzhTcGplaVdBcFVKTnFRYzdsRVJocUJWVnkwZXNz?=
 =?utf-8?B?bWN4eWNoaW5aV3FnK3BLM0c5MUtpYklxVVMvYlhoMVVlcUthc2lYSzdiKzN5?=
 =?utf-8?B?dE94bnlFdzRobjRTR1lkdHE0eGsyYVpUOGZZUjVaaEc1SGM4eXV4YXp1TnF5?=
 =?utf-8?B?VHZEbjhCcEhhbGp6bkR5K3haSGhQOGNHTk40dmZzcWZjK3cyRXk3S2tCUWlZ?=
 =?utf-8?B?MEtVdmwvWnV5aVU3d0dYcnRzSWppSVZBcnBiQWFoTXRXU2syNHpNRExmUUd2?=
 =?utf-8?B?VE5ZVlMyUUVoNFlrekFVbnpCZ2djVFRLMFBHcUtxTWNQb2FTM1BtN2E2S1hy?=
 =?utf-8?B?dGc4MHBwc3BjRFRzQi81UG5wYnA1NmduQzZxT1B0R1kwTFNvMUJsK0F1UFRa?=
 =?utf-8?B?Y1BCOWJPWFRuUk1OZmdQQVEyUUZKTEsxT2l2T2lPQXE1MHl1LzFxeEplR3F1?=
 =?utf-8?B?eEgwWHFXWmdEaGlVZmxMckhOd1ZVOEg1UEFtb3BtQ2dEQndqdW96VFJiRzJY?=
 =?utf-8?B?QmZ3blZYeDVSU2wzSUZNV3VyY01FZFBrTzg1cjdMeWhWQ2t3Wk4rekdlMEFI?=
 =?utf-8?B?bFhUSThQVUxGWXhXMlIwSU1nWXJpamFVWTh0VXBqQ0xnMmZoNDdzQW1iR0dy?=
 =?utf-8?B?aTNxSStiOVlYTHZleUp3VFdhKytmUjFGVktJaVNzaUh6aGhNeGxsTnFMN2Yx?=
 =?utf-8?B?WWNFdHlRSTlTeldGRTh2OGM5R3U0YkRxbGZmVEVVQXBucnRqTmxPSitYQnI5?=
 =?utf-8?B?NDVJRmg3NmpNcXhWQXVxcGU1R2pSbCthaDd4RGFtQ0txK1ovNm05aVZMTFYr?=
 =?utf-8?B?ckk1N2N4VDRudkxVamd6R1BPbmhiZVZFMm5MK2tCQXhxRkZVdTU0RU5vRjBm?=
 =?utf-8?B?U3dTb0Q3citmMnlaZUJnMitPZEZ2S20rT2MwUW5pZm01RHA5V3RWNEZ4ck8v?=
 =?utf-8?B?OE1rVDM0WTBKK0UwRlQ5eVA1YmZOcVNkYmR0bkxaSVJRNEEzVE1hdEdkK2dn?=
 =?utf-8?B?YncwQXJMR1VXTWtBRkpmMFpVeTlzRUc5UGhHOW41TzF4RUxRWWtTam5LMENs?=
 =?utf-8?B?aHlJTCtFWWs4Tnh5Y2RIdkpnRzZTbHR5R014U2VXYkdRbEw2ajZUTGN0Y1FE?=
 =?utf-8?B?enhPY1k2THV3WWYrcGNRd2w4TDRHRzcxekJPS2V6Y2hzY25Pb3UrZXlSWG9w?=
 =?utf-8?B?cW1HVEtYWENFcytXaHVpTjFOaUVvdFdHTXVwczNrYnEySXcrWjg1elIrZUdx?=
 =?utf-8?B?ZmNSS2ZxQnYzRjlzK0VZYVQ2U3l0Y1c4QlczQUVSYVNHcVFZMEVJN3JNTS81?=
 =?utf-8?B?aDM0Wmc4NUtFOUI3QXdGQ0psZ21oWUhubThpdHY5YUpCU1BTNEtENElHYUNU?=
 =?utf-8?B?RVVpK0FsYWxJNUZ4QzRoajYxdXhMdFdQdTMwaU16amFsdVRwZ0hQSitJaVBF?=
 =?utf-8?B?Z212Mlh5VnovNFRhTzlXTGFWR2t4b2lpK25pL3hIeWM0L213MXJHZFVVb0Ny?=
 =?utf-8?B?WVh4RGs0TDk5TVlwM0RIdytnTzdkQi96dHppQkJmb0l2ZUhoNlBXNXI3Mmkr?=
 =?utf-8?Q?jo6LHz2Jy1g88lnovgkGm08=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 140934da-041d-4715-42eb-08d9b640baf4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 09:38:58.2518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gIeIDfxjwnYbIp4/Lv1t+ms6e8AGFCyb0W+bY34rQ2VkZ57BnTiB3JYg9b5qrGOe6M8PpRMEaPzvx5jWf7c/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3580
X-OriginatorOrg: citrix.com

On Fri, Dec 03, 2021 at 09:30:00AM +0100, Roger Pau Monné wrote:
> On Thu, Dec 02, 2021 at 05:10:38PM +0100, Jan Beulich wrote:
> > On 02.12.2021 17:03, Roger Pau Monné wrote:
> > > On Fri, Sep 24, 2021 at 11:48:21AM +0200, Jan Beulich wrote:
> > >> For vendor specific code to support superpages we need to be able to
> > >> deal with a superpage mapping replacing an intermediate page table (or
> > >> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
> > >> needed to free individual page tables while a domain is still alive.
> > >> Since the freeing needs to be deferred until after a suitable IOTLB
> > >> flush was performed, released page tables get queued for processing by a
> > >> tasklet.
> > >>
> > >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > >> ---
> > >> I was considering whether to use a softirq-taklet instead. This would
> > >> have the benefit of avoiding extra scheduling operations, but come with
> > >> the risk of the freeing happening prematurely because of a
> > >> process_pending_softirqs() somewhere.
> > > 
> > > Another approach that comes to mind (maybe you already thought of it
> > > and discarded) would be to perform the freeing after the flush in
> > > iommu_iotlb_flush{_all} while keeping the per pPCU lists.
> > 
> > This was my initial plan, but I couldn't convince myself that the first
> > flush to happen would be _the_ one associated with the to-be-freed
> > page tables. ISTR (vaguely though) actually having found an example to
> > the contrary.
> 
> I see. If we keep the list per pCPU I'm not sure we could have an
> IOMMU  flush not related to the to-be-freed pages, as we cannot have
> interleaved IOMMU operations on the same pCPU.
> 
> Also, if we strictly add the pages to the freeing list once unhooked
> from the IOMMU page tables it should be safe to flush and then free
> them, as they would be no references remaining anymore.

Replying to my last paragraph: there are different types of flushes,
and they have different scopes, so just adding the pages to be freed
to a random list and expecting any flush to remove them from the IOMMU
cache is not correct.

I still think the first paragraph is accurate, as we shouldn't have
interleaving IOMMU operations on the same pCPU, so a flush on a pCPU
should always clear the entries that have been freed as a result of
the ongoing operation on that pCPU, and those operations should be
sequential.

Thanks, Roger.

