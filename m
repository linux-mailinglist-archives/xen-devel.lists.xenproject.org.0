Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7919444467D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 18:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221095.382625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miJce-0005qv-NB; Wed, 03 Nov 2021 17:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221095.382625; Wed, 03 Nov 2021 17:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miJce-0005oj-K1; Wed, 03 Nov 2021 17:00:24 +0000
Received: by outflank-mailman (input) for mailman id 221095;
 Wed, 03 Nov 2021 17:00:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+yV=PW=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1miJcc-0005od-LN
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 17:00:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 859f9e8f-3cc7-11ec-9787-a32c541c8605;
 Wed, 03 Nov 2021 18:00:19 +0100 (CET)
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
X-Inumbo-ID: 859f9e8f-3cc7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635958819;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=A8gltBmfwnQqi46oxfrWK2jUtPuq5owj2WpDVGfyqnE=;
  b=hlhNwdl2MWCCTJV/Z94cRKISlGKoKbgYOl8C4gxNALshjeE48yJOMOxZ
   t6wEQ07K85eOFBlTq48TGIiR2NZ0joYtImGLjqHd5FsbAye9tfpI2VW6I
   8n1NvtiI6RlCS/W/DrptqfIBwJqBXbuvAKit5Pm27DCP/QUJPWJzquzBz
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: y5+XZMR1l0qtGF3CL4avDFiiHA9lrHK0o2Ols3lD35qWqlcjV24A7JEwqWAmgYVx9+VUytSGyb
 jjUwiHDkPvtSnKXX90zeqkgiTDy+AV0btKfdDnlNbRqwMeLHmdJ03CSDNNsWpGfFyds1sqc1/v
 OAFog/pka4iylPOIb6E6A6GZUTnjRAR8da816M6zdp21qONAMx5rN3gtAAPNx4QePy6eQg8ZOK
 +wHdzzqmH/wQ2MoG/WZbx+ek5IMafUBnvjTs+FBSoqUCir4RHCXwr/3d7KN/Pn1FDUJSmoxhMz
 6rAjXbkDzdfVAGo1+2pRyfx0
X-SBRS: 5.1
X-MesageID: 56977856
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LiE0iKuLfOEM7z7AFN66qMQ/K+fnVLpZMUV32f8akzHdYApBsoF/q
 tZmKWiAaPqOZjT1edxzaIzj/BkEuZTdn4NjTVE5+H1gFCoa+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2YPhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplk7O/FT4XOojwluUTajhqSCA9D5dY0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY254fQqmOO
 pRxhTxHNxfBQiRmZ3QrLpMQo/eZl0fmVj1VgQfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCntTz/cJIfEvu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M/pHI
 lEQ0jojq+417kPDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyyC2CTQ9cDpkVNInuvYXd2crl
 W2zgfq8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNpt10ySF76PBIbw14SoQm+on
 1hmuQBn3+1L5fPnwZlX6rwub9iEgpHSBjA46QzMNo5OxlMoPdX1D2BEBLWy0BqhEGp7ZgXe1
 JTns5LHhAzrMX1rvHbTKAnqNOv4j8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN4l4Bu88NZCH2PfAfj2eN5yICl/aI+TPNDai8UzazSsIpKF/vEN9GPBb4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOdUWHPTP7tRxP7V/23oH
 yN3apLiJ+N3C7alPEE6MOc7cDg3EJTMLcuq8JcPJrLYeVcO9aNII6a5/I7NsrdNxsx9vuzJ4
 mu8Sglfzl/+jmfAMgKEdjZob7aHYHq1hStT0fUEMQn61n49T5yo6atDJZI7caN+rL5ozOJuT
 ulDcMKFW6wdRjPC8jUbTJ/8sI09K0j72VPQZ3KoMGolYpptZw3V4du4LAHhwzYDU3isvswkr
 rz+ig6CGcgfRx5vBdr9Ye60yw/jpmAUne9/BhOaItRadEj23pJtLij90q0+L80WcE2RzTqGz
 QeGRxwfoLCV8YMy9dDIg4GCrpuoTLQiThYLQTGD4O/vZyfA/2elzYtRa8qyfGjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRCu/EfxrJdvgfqC
 EuD9sMDZOeMMcLhVlUQOBAkfqKI0vRNwmve6vE8IUPb4i5r/eXYDRUObkfU0CENfqFoNI4Fw
 Ps6vJ9E4gOyvRMmL9Kag30G7G+LNHEBD/0qu5xy7FUHUeb3JoWuuaDhNxI=
IronPort-HdrOrdr: A9a23:Hu6fJK8W/M1rCx6l5Xtuk+FEdb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICO4qTMuftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOd+EYbmIK/foSgjPIa+rIqePvmMvD6Ja8vhUdPj2CKZsQlDuRYjzrY3GeLzM2fKbReq
 Dsgfau8FGbCAoqh4mAdzQ4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kPEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 XxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72weBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlFXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbdrmGuhHjLkV1RUsZmRtixZJGbDfqFCgL3a79FupgE786NCr/Zv2Uvp9/oGOtB5Dq
 r/Q+JVfYp1P7orhJRGdZE8qPuMex7wqC33QRavyHTcZeo60iH22tTKCItc3pDcRHVP9upqpK
 j8
X-IronPort-AV: E=Sophos;i="5.87,206,1631592000"; 
   d="scan'208";a="56977856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3Mt3+VFqHVtDR6oeNjrXP2lku7gxIVU6ZAmN+WE1MeeXkfOzYJkfv9AwZoXbM18TH2/t8BtljHa8tEs7UVIibWOGGQ4Z5cJWiClUcrbRuuoZxXh5EuY+MFt8kvfsAh6SjsVlhMxRrSC9P31zfrHuvduQHFJkCJ09xi50gxSZxdanp2E5MUmoix3w3wgz9BhVvHAZaFCkWZZC5Sxzdht1koKZkQTkqSas89lcEsAsWE4gW31rf/DCMmf0T8Ku2xovAENk7l69JiRBuV1wjR+xsY2lL61SkuWzSIfv30zAAoeO82ncMf3pavUfiv2872j7bXAWXv5ZgjvKAJUXfmwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7E24NxF7hiAupysPcbVLz2RmMrpixKrNtgEVV8OTdfA=;
 b=S8bPM+dmenGnA0JkqpNCzwQ6kz/QcMZ8PIU+mYRMrH30Vqn/26P8cjdQ2UqytcxzsL/Wet6fxaLhc5nRxChj0lrISdyOvTwytTWOsbZ4/zt9+R1Q/2L/pck7+7qQ5EN8VUe6OH1encxgYHNdkEevQVvrvB/Jwm/inmHX4Uw5RUBbbDM8x2LzsUmtahi2VJGEjmUnashytodspuSjs3WDTVDXvPi1Ns/YhvT6cmH1+sNB00CEvwrY5U1d+Ik4ZIjWmFHp8ivuD7c1suGz58QxvR0m7+VxvGULRjWkORgnDHF8cqpDxfOExAHgQ5CHtZCSMATtk5C3hRy7ozJ2pEEhNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7E24NxF7hiAupysPcbVLz2RmMrpixKrNtgEVV8OTdfA=;
 b=BN9s7NXRg3SD2AqlKbwm4+OWwNMyyJSoOO3cqiXDlWrHzZiJoA3ZrIJggLU5f8Su7RYz/YiezLLAd+HeZJwJ0pCs5hSsxiDac93oah5XpFby110JF43Q+pwP9U0ROIPXDPCqB0tk8OryuUUnXrzQyLg4Q4O4yPXb+oIBfbNzacw=
Date: Wed, 3 Nov 2021 18:00:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/3] AMD/IOMMU: iommu_enable vs iommu_intremap
Message-ID: <YYLAGMIBjYGGPS1e@Air-de-Roger>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <ff7b68b2-5bba-2927-e3f0-f3062862c466@suse.com>
 <YXaGxX3J1aB39mSG@MacBook-Air-de-Roger.local>
 <dd2929fc-dc1a-1c16-5954-6894766d9dda@suse.com>
 <YYEa6HQGR1cHJBw/@Air-de-Roger>
 <bcaf1547-98ae-923f-5be8-50156e318bf4@suse.com>
 <YYKldeiym0fLWTsa@Air-de-Roger>
 <ebe6b551-2302-830d-72ea-8d4fae1c411d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebe6b551-2302-830d-72ea-8d4fae1c411d@suse.com>
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cde0f117-fcb1-4a73-c8c6-08d99eeb66d7
X-MS-TrafficTypeDiagnostic: DS7PR03MB5445:
X-Microsoft-Antispam-PRVS: <DS7PR03MB544584A15F46A036002931868F8C9@DS7PR03MB5445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y0hymv8NTBuSywX/esKoVOupkcy33UrtbrYaBoGqLYfMAIXEuGkF+DFPvjK6sCaOxZtSk79XL2Pos7W57wS5R3i5bgXOeU+xqsBGGExGvOOQTFzsHaW0hj0VjXMsFjzEJmJrps5/3csItAXZCvfiYVf9/Lb62rLJ59ABbRkpixuZ/lf/TK0SsvbxmCnhGziJXa/+3/CmqxehZ+RX2fhs4R2vILpCqVrxJOXsonduUbJ05tlFEFNFEZ5y/TVA3Sd9wjqOHQN6C2u6ceMW8DbCdqgt2p4Lh8P1IC0YbjBOXv/lNTDcVi0j0zIXafp4EkpTsONE1K85o9TflvmM9ZQQ4k3TACYaay+Fqvu01CNY7dni0vP/wbKzhd4c7QnXOfO/sGWCn91SUlNspPtYw8Anqv7gew/Bc8/v1k9PbLG5w6Jsg3NZJb2/+nQKV/bWRT7scgHLSZNAYrDWgbYfXDeSrssPzem6Twqk8UhXbbMSkJn56Mvr8peivOPR1lLYRM3yKfDN35ysQsF1E18c5JH2LASUq1NTjqqVjHyIQuEz8sQYYuV8jobDi39CqthMHmbTWhWliGai3binxfAzVD3BshWLk18Ew+J6EM4J7g1vhvBhBzGveArH/zoySTmgB90J7MRlbJ9tiolWqq+oXjU8FA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6486002)(85182001)(2906002)(9686003)(8936002)(66946007)(66556008)(956004)(66476007)(86362001)(6496006)(6916009)(508600001)(82960400001)(83380400001)(186003)(316002)(5660300002)(33716001)(54906003)(4326008)(8676002)(26005)(53546011)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFR0SXFCei9BWmthekN3SUN1Z0R6NHRTZThwZ05YZWNvVXZxMVA1c1ZyUkNX?=
 =?utf-8?B?cGZPZVF2MEVRS09xcllQVTV0NVZSZmwvTGE4N0ROVnlkZ05mS2lsNlJKSGRV?=
 =?utf-8?B?TjJHQ3k0ZnVXVmhFK2lYS0k3SmtMMzRwQjhwNklFVExSSTVsTnRTcDRxaHF4?=
 =?utf-8?B?VlB0KzBzdzA1aWl4a3ErdmFDalliRmxQUy8rVURPZ1NMRUx0eG1MazJrSGtN?=
 =?utf-8?B?L3lJcDBmNUZZM0FLT2lmSHk5UGdhNnJKa2N2NHJub2hBTFF4OFMrcHFsZFFh?=
 =?utf-8?B?R2dKbmpGaGdmUnJyUDdUbzRJT1VJOUJJUjhqQjlyZVdJenJFMzdETUs1MWds?=
 =?utf-8?B?V1hXdU9LTEhpK0JZTk1JZTV6eDY3QWQ1WitBSWdZeXRCR0JHcFl6OG9Pb28v?=
 =?utf-8?B?SStuQlh4UTZURUI3bnlzT0grTWgyeGVZNWdPZ3hpbzZVYXV0THUycFg4OXBz?=
 =?utf-8?B?NSt1dUZoZnZHeFlwYVc3Q1g3V2pwMkRNbld4aERqYzlrYzN3LzQ0QUp3bHhm?=
 =?utf-8?B?bnBDd1lQQXNkb2RMeTQraWozcTNiUWJmTG9LRFVNYk01OEhWOG9jY3ZpOE1H?=
 =?utf-8?B?VzhlZlFNanBYTjEvRVloa0h5U1B6aUtlWEtmSExjUXZJTExWVzErL0NRQTVt?=
 =?utf-8?B?cFJXKzZMVXR3OCtOWVB6MTBLeFM0OWQxMnluNk5VWEpaNm5aUExxTzNxK1o5?=
 =?utf-8?B?L3lKVWVKaWUxRlJwbWYwTTIrelFMdzh2VWdDUXMvTlZQUjM0V2F6Uld3TDBJ?=
 =?utf-8?B?cHhpVjByNldQbDJZWVhYQ1k1NGI1ZEcwVDhTNlpRcHpXNUNOYTBkR01MSFZJ?=
 =?utf-8?B?SlFUYlRLS3dwMkU2Yk1PSkI3a25FNk1wVS95a1hYcmI0ZS8ydzVRV0xrc2JK?=
 =?utf-8?B?aW03N2RXOHQ1MkRQVks4RWpPQms0TzNIQnBINmwrUC8xVXQxTGxzWHJGZ2hT?=
 =?utf-8?B?N3cvUHZ5WlFlVzVQZW5sTnNMVnN4NFk0eGxMbGV5WWc4U1NseTNSUjltbGFr?=
 =?utf-8?B?N2RxUGdHRHlCNWpmUUNhL3EwcXlzcUVXQnFKbTFvTlZSNEkxL0RPc2pjcllF?=
 =?utf-8?B?b2N1bFhuNTduWklQS0RPc3ErZjVwZUVJb1ZaQU9uWkpYVStDSlV4WmFucG42?=
 =?utf-8?B?L2tUbktCamxQTGRMeERQOVRtaFZBS0srY1dsODNRK3J0STA0T3ljTEtrcDVW?=
 =?utf-8?B?K0FoRlc1Q2thbXpMYWNmSzh2UzhxMTVpNGpkOXJ4U0tmamp0dHJrdGRsSnRm?=
 =?utf-8?B?eUlXWXRUYjl3bTRMRVArclNZSGg4cEN1S3R1enQxZkpxQ2dNdHVjajhvYVBF?=
 =?utf-8?B?cjUzazhJUjVsVEd0NTIrSXBSUWtVeWFTY1dEa2RQZW9kUXJWb2ZOSTF1d1VV?=
 =?utf-8?B?a1VOWDVPbVg3cVhEV0pPNlhFblNzSWpGZWxGTXRRN3RwaktGMSthR1ZjWGp4?=
 =?utf-8?B?MllwMTB6V2I5VTdUOWpwb3dEem05KzJObTltSjFjQm5rWkRGYURjb281QTJE?=
 =?utf-8?B?UDJROEIwREJ5RUtCSmNvWTYzSWVEeUNDZnRMdXp5aVZBZWhnNzFkaEQ5Zkow?=
 =?utf-8?B?cUhNRXJhTUxudVNLR0hRZzRCK09VQVJhQU0rcnFlQ1hVZktKd0l0YUkyek9I?=
 =?utf-8?B?MTV4MTlackRYQVJBTkx4ZVdzdkI0KytvaStQbTNvQ2wvNDNQaEtBbExtbS80?=
 =?utf-8?B?Z0Z2Uk4vZkhXZmRCaGsreW16K2dPSlFRaW5GcWY4RmhvaGthVWtuY1cvR2xM?=
 =?utf-8?B?Q1lQUm9XMFl2RVBDMzloL2RvaVlqUzhIV0Zla1MvajBVWndmL0ZuSThGMm1M?=
 =?utf-8?B?Tzd6OS93VndIaEQxOFRsQUZZTUVJc3FWb1I2YkN0QTYzZ3dvMkRaWTlCanY0?=
 =?utf-8?B?ZytkMVlMSE5BWDFvYkdyV3pwVXUzTXg0K3Mra3BFSXp5ZEJvSVh2SER4bUVP?=
 =?utf-8?B?dnQ2MEJNRW5MSEhqR3BsUWxHOXhPeUEwOVY5aDl1RzI1UEJsaWN0OVhxM1VG?=
 =?utf-8?B?cFlTUFcvWUxzVlRpSnpmQVA0ZzloclRhN2w1Rmg1YTBaRGZFOGtyNDFZTGhO?=
 =?utf-8?B?UGZ6emgwaXFzZnJkNERVckVOU3FmMDI3V3dCdmc1M0VrWnBTQmhpaWVQdU9M?=
 =?utf-8?B?bWZJTWRPYkdrdU9DNGhHdWJLNDc3dFRXZ01rdzdJR2VOQU94WEk2RHFqVlo1?=
 =?utf-8?Q?VbFl2qckgEOEFobZjazfQ2s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cde0f117-fcb1-4a73-c8c6-08d99eeb66d7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 17:00:13.1169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOaW2mSruF8egq/PGu/uU3Te6qDT9TELAqT6oDxPhG6OhLJVGj8IUEGHSEs92aO8E/dUcGhDf8WTAgHxxPXbfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-OriginatorOrg: citrix.com

On Wed, Nov 03, 2021 at 04:15:52PM +0100, Jan Beulich wrote:
> On 03.11.2021 16:06, Roger Pau Monné wrote:
> > On Wed, Nov 03, 2021 at 10:46:40AM +0100, Jan Beulich wrote:
> >> On 02.11.2021 12:03, Roger Pau Monné wrote:
> >>> On Tue, Nov 02, 2021 at 11:13:08AM +0100, Jan Beulich wrote:
> >>>> On 25.10.2021 12:28, Roger Pau Monné wrote:
> >>>>> On Thu, Oct 21, 2021 at 11:59:02AM +0200, Jan Beulich wrote:
> >>>>>> The two are really meant to be independent settings; iov_supports_xt()
> >>>>>> using || instead of && was simply wrong. The corrected check is,
> >>>>>> however, redundant, just like the (correct) one in iov_detect(): These
> >>>>>> hook functions are unreachable without acpi_ivrs_init() installing the
> >>>>>> iommu_init_ops pointer, which it does only upon success. (Unlike for
> >>>>>> VT-d there is no late clearing of iommu_enable due to quirks, and any
> >>>>>> possible clearing of iommu_intremap happens only after iov_supports_xt()
> >>>>>> has run.)
> >>>>>>
> >>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>>> ---
> >>>>>> In fact in iov_detect() it could be iommu_enable alone which gets
> >>>>>> checked, but this felt overly aggressive to me. Instead I'm getting the
> >>>>>> impression that the function may wrongly not get called when "iommu=off"
> >>>>>> but interrupt remapping is in use: We'd not get the interrupt handler
> >>>>>> installed, and hence interrupt remapping related events would never get
> >>>>>> reported. (Same on VT-d, FTAOD.)
> >>>>>
> >>>>> I've spend a non-trivial amount of time looking into this before
> >>>>> reading this note. AFAICT you could set iommu=off and still get x2APIC
> >>>>> enabled and relying on interrupt remapping.
> >>>>
> >>>> Right, contrary to ...
> >>>>
> >>>>>> For iov_supports_xt() the question is whether, like VT-d's
> >>>>>> intel_iommu_supports_eim(), it shouldn't rather check iommu_intremap
> >>>>>> alone (in which case it would need to remain a check rather than getting
> >>>>>> converted to ASSERT()).
> >>>>>
> >>>>> Hm, no, I don't think so. I think iommu_enable should take precedence
> >>>>> over iommu_intremap, and having iommu_enable == false should force
> >>>>> interrupt remapping to be reported as disabled. Note that disabling it
> >>>>> in iommu_setup is too late, as the APIC initialization will have
> >>>>> already taken place.
> >>>>>
> >>>>> It's my reading of the command line parameter documentation that
> >>>>> setting iommu=off should disable all usage of the IOMMU, and that
> >>>>> includes the interrupt remapping support (ie: a user should not need
> >>>>> to set iommu=off,no-intremap)
> >>>>
> >>>> ... that documentation. But I think it's the documentation that
> >>>> wants fixing, such that iommu=off really only control DMA remap.
> >>>
> >>> IMO I think it's confusing to have sub-options that could be enabled
> >>> when you set the global one to off. I would expect `iommu=off` to
> >>> disable all the iommu related options, and I think it's fair for
> >>> people to expect that behavior.
> >>
> >> It occurs to me that this reply of yours here contradicts your R-b
> >> on patch 1, in particular with its revision log saying:
> >>
> >> v2: Treat iommu_enable and iommu_intremap as separate options.
> > 
> > Right, I see. patch 1 uses
> > 
> > if ( !iommu_enable && !iommu_intremap )
> >     return;
> > 
> > Which I think should be:
> > 
> > if ( !iommu_enable )
> >     return;
> > 
> > Sorry I didn't realize in that context. I think we need to decide
> > whether we want to fix the documentation to match the code, or whether
> > we should fix the code to match the documentation.
> 
> Except that adjusting the conditional(s) in patch 1 would then
> be a functional change that's not really the purpose of that
> patch - it really only folds acpi_ivrs_init()'s and
> acpi_parse_dmar()'s into a vendor-independent instance in
> acpi_iommu_init().

Right.

> Alternatively we could adjust the conditional
> here (in patch 3), but that would feel unrelated once again, as
> this change is supposed to be AMD-specific.

Depending on what we end up doing regarding interrupt remapping being
disabled with iommu=off we might want to rework patch 3.

> > My preference would be for the latter, because I think the resulting
> > interface would be clearer. That will require introducing a new
> > dmaremap iommu suboption, but again I think this will result in a
> > better interface overall.
> 
> I guess we could do with a 3rd opinion: Paul, any chance?
> 
> In any event I hope that we can agree that patches 1 and 2 are
> okay for 4.16 in their present shape, and patch 3 (plus whichever
> further ones) would better wait for post-4.16?

I consider the issues either a bug in the documentation or the code,
so it's likely I would suggest whatever fix we end up doing to be
backported. At which point it might make sense to add to the release.

I don't think it should be a blocked though, as this hasn't been
introduced in this release.

Thanks, Roger.

