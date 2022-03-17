Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FF24DC47B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 12:09:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291500.494766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUo0G-00083s-VH; Thu, 17 Mar 2022 11:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291500.494766; Thu, 17 Mar 2022 11:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUo0G-000813-Rj; Thu, 17 Mar 2022 11:09:12 +0000
Received: by outflank-mailman (input) for mailman id 291500;
 Thu, 17 Mar 2022 11:09:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JNAg=T4=citrix.com=prvs=0684b021b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nUo0E-00080x-Va
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 11:09:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa206b22-a5e2-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 12:09:09 +0100 (CET)
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
X-Inumbo-ID: aa206b22-a5e2-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647515349;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=TG5YQMxHE5nykjYo/YBIAEgsJBbW3Usf7syD2PnlbNc=;
  b=K6zx/Ur5rIlm6Q5pomfL60heGyMJgeC6xZOXEXs0QhUfgPVE4BDREi67
   YV0ukmpHShdRilIcVMLQfCseXv1p90uCp4yLHbh1LOjLMuKkC/IKOV/2s
   OXj7C0Zr1OChc9SBSGeWen2bz5SCxTjT9gbx3/Bh79RPc9WXDc9ng0sdp
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65951484
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vBn8darD/3mzs6ufA3DoXS86abheBmKVZRIvgKrLsJaIsI4StFCzt
 garIBmCMviONmugLt9xYIi18EJTsceGzoBgSQA9qC9jHi5BoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 Iyq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBOouPkeY/SDhhSQJ5YPVGypqceF+wiJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZdINGMzPEiojxtnHHErBbcimveThlqkemJa+W62gJpsyj2GpOB2+Oe0a4eEEjCQfu1rmUKfq
 nPD7n7OKBgQP9yCyhKI6nupwOTImEvTUo8ICKex8PIshVSJ33ESEzUfT179qv684mahX/pPJ
 kpS/TAhxYAw/kG2Stj2XzWjvWWJ+BUbXrJ4EOo88giBjLXV5wWxAXINRTpMLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcGUA8E7t/LsIw1yBXVQb5LC7Wph9f4HTXxx
 TGiryUkgbgXy8kR2M2GEUvv2mz24MKTF0hsu1uRDjnNAh5FiJCNY6rr4Fr59td5dqWeEwGBj
 l1fwu+R1bVbZX2SrxClTOIIFbCvwv+KNjzAnFJid6UcGySRF22LJt4JvmwnTKt9GoNdIGKyP
 heP0e9EzMULVEZGe5ObdG5Y5y4C6aH7XeroWfnPBjalSsggLVTXlM2CiKP54owMrKTOufxnU
 Xt4WZz1ZZr/NUiB5GDqLwv6+eV3rh3SPUuJGfjGI+2PiNJynkK9R7YfK0epZesk9q6Cqwi92
 48Ba5TWlkoGCrOmPXS/HWsvwbYidyRT6Xfe8ZA/SwJ+ClA+RDFJ5wH5nNvNhLCJb4wKz7yVr
 xlRq2dTyUblhG2vFOl5QisLVV8bZr4m9ShTFXV1ZT6AgiF/Ca7yvPZ3X8ZmJtEPqb08pcOYu
 tFYIq1s9NwUEW+Zk9ncBLGgxLFfmOOD3lvfYXD6PGBhI/aNhWXho7fZQ+cmzwFXZgKfvsoiu
 bywkATdRJsIXQN5C8jKLvmoyjuMUbI1wYqeg2OgzgFvRXjR
IronPort-HdrOrdr: A9a23:XCIF3KnbXlgyW2xKhRs1TOg/VrLpDfPaimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICO4qTM2ftWjdyRCVxeRZg7cKrAeQfREWmtQtt5
 uIEJIOd+EYb2IK9PoSiTPQe71LoKjlzEnBv5aj854Hd3AMV0gP1XYdNu7NeXcGOTWuSKBJYq
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWySw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLbhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqnzd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7kl6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklWqvoJBiKp7zPLd
 MeQv01vJ1tABKnhjHizyJSKeWXLzgO9kzseDlDhiSXuwIm7kyRgXFoh/D3pU1wha7Ve6M0md
 gsDZ4Y5I2mNvVmFZ6VJN1xNfdfWVa9Ni4lDgqpUCfa/ec8SjDwl6I=
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="65951484"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyekEL87368FuB8UB90/IQwHo9I2ed9PAnTsKq3SiqeiPZN/Jyc/Lra0sWTVqJTAfcOIfeuh4qy70I3r/CntMuX+mVCorwFpNRRbFrywue/t6i3vO6ANFHXhXwH1+a2ysPSFubdSgmn2JX1Hsn2GoqdGbHxjshRV6JN/xcfNvWYv3sKe2Xqz3phEpjjLeFgFgn5NA21z5XiRfT6EGMyvHm87Rm93vBcvPHhpuneSl5uG9u6ls9G5re5J0vXPUsiYN1psu0rgEgeNGg1NQRMEoJVQemiSXlO/MApOKakeUgJC1WHcZcMB5h/0eHzjYp2cVo0RGNkcuTHzXN+Der9tlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZvNQ2Jsd1nbrbGwaI4yAv5SLDZE/R4NZJGlJk5r62U=;
 b=PV1wIZ19MRKiAH3ZJdtjVPX8e8HdzQOdrkF1ZWpKG2tA3qOXpMNGS3zKtkV8J4qo5snv5BsfoROM6PvuyUukHzOZfGsudinXXbEMzH8CSpIkFyuYTEOAzb7T4WNgtLPfLySh+eCqzenrBxm7XlF0Y63zI7KtisrUY5p9+2Z1TN8wZ/eagLexNUgZGR/aNymHWKsaiK5a9XyMCP6LbKSjmZnHPqWMxX229YTh0KPLRgSbZGOF+DNqvc8l/HGi3ap+iAwYSHUV5Q+6fBm2beXCLZ+sCLbm9BtS+jFO6FB9OPsOPuTLf8aJMaNQzm7W6q1L6f3xJrM1Eexb/hkhkGRi/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZvNQ2Jsd1nbrbGwaI4yAv5SLDZE/R4NZJGlJk5r62U=;
 b=Zh9spOnXbWkBQ5WjIEmHaCukLuS2HnD2mZFbDuhsxKRILQobpChvGr3XGrG1iG1ikfhBiWhyISu0EPnyIoaddyKEsxAacXgbTahCvnvNld8Z852VGMPp7f9cOZ3POieol1xglQ+35UB9mAGY4chqalafGpSSeDv3d6gm+DyoDQw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] livepatch: fix handling of (some) relocations
Date: Thu, 17 Mar 2022 12:08:52 +0100
Message-ID: <20220317110854.39050-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0060.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ead39772-0926-46fc-2b49-08da08068c48
X-MS-TrafficTypeDiagnostic: BL1PR03MB6102:EE_
X-Microsoft-Antispam-PRVS: <BL1PR03MB610264F5A9F0E21CC3915D798F129@BL1PR03MB6102.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JSsGPzoStBvFQQuZxGquA/+fhiGprAU7UGrlKJexAotQlkkY+bKi3UCWwx82afd7vBPqWAOnf4QTqNsD/ovQqS+WcjDNjd0iLMcLbOIfn3jAc2KQikFNosSPwPXFP2MUef+c5IJFTejSN6KX7BsitT3IGbxubn2M3Nlf0MAZ1IJn1WGmEAEoW4hYIFdkQJn7RPhe41Rsl1nkLBqcHt2icOUuIV3BuIhhc6+oRzPfNAw0SWaUvkOSmDv3+qTa38DvJ9GkJsY4ayWt7YdrRZ4Lgl3y1t2bmIbrEuW6+jAjUvAYG+SYo+F+eB37aB7seLnnB/UMcZ17/lvVxmW24dbmh/v2NnUenBfnshsub4UHfxAx13Cwr1wQxYNeFSX3gY++cUmHxucQVLg12IQuREfJurHzNl3NAMQK1ao8v5/40WV55gM2g2fZ7f8e+Ce/zBiskkPCPQP6v/wmZN6Qg/RmeGPBzg77Pt6cmELZYEUo4H+ojLFNjKS0qq+1UawlUSCFlXhyWY/dZzvmAK//P3zJB8/lcyknGmj0Xrp96uT0eGS29vdzsTOMLjkfMnTX5IcCl1T6IdjB+l12qDO/AwYFePhPOdmTTIRETSDweaXdy58pX7nXMlXqBeE8KAcF+Ue37i7OWYQC8WvhxsEP0htXuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(2906002)(4326008)(508600001)(8676002)(82960400001)(6512007)(86362001)(6506007)(5660300002)(6666004)(6916009)(8936002)(26005)(66946007)(66476007)(316002)(66556008)(186003)(36756003)(2616005)(6486002)(38100700002)(1076003)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDh3a21EYkY2dVFta25UZmZPVWtSQ2dVRlJXbVU3OFNwNDFTdTZQaUk0Yjlh?=
 =?utf-8?B?Sjhjb0xCVTd1dUM2eXZXNWgrSmtFd0owdVBkTERLSEhSd3FoUVRIK2dYeDQ4?=
 =?utf-8?B?SDJOL1l1Z0pKcnJFdDY3QmlyUnhwcXpXdWQ2eTFZUCtmdFhhQi9tNTRGd0Nn?=
 =?utf-8?B?czNjaFFpUDRVd2owcVRsZ0dobk54bmlqZjd2dGRPek1hdlJSUlNEZmpyWGpD?=
 =?utf-8?B?YjJuUForM1lndmkzeUtJL0MzSHNMckVhcEgzVXNZeWhRdTlGMVpTMlFzYnVi?=
 =?utf-8?B?VDZOZGU1YVZ5M0FoTjdxTEJHK0Z2SXVBUkVsQXVkWFRSZzR3cSsvbUZFSW5m?=
 =?utf-8?B?YXQ3RWhxTVQvenNrRU5kV21Dd280VUZMYXpQT2V1azF2S3B1TGtGcTBUYXhI?=
 =?utf-8?B?QXdwTFlrV0xUMTFRTGJ5S21oZmxBZmtiOUhNVk54QSt5aDhCbVFQZ0VhdGdE?=
 =?utf-8?B?V2cxRTIrZVBjWUJTMnZIaDFxT1prbzZTZG5EZ0VLaGU3UlhTemVOODk1Q1Q3?=
 =?utf-8?B?K1VTS2tSd3QvUVJBdmNxUlFoT2s4OTlDWDVyR01ZWlhaRkVCZTloVzlHRUl6?=
 =?utf-8?B?eHJXZHVicU1mR2lRdkQwazlXSWNXYlEwUVo3alhWZGlrQnhVN216QU9KRmkr?=
 =?utf-8?B?eFJzam5BeHFIdjRwbjB6M2I2Y3h0K0ZhSVUwQXI1dEgvcm9WM2ZWVHhtOG1R?=
 =?utf-8?B?YW9ianZvM2VRQU91ZytuRUl3VzhQS1pJQXVuS3dpYjZJM0o2S0dQSFpqZngv?=
 =?utf-8?B?K1c3S2tieFZxNjRUd2xUL0xibVNmMjhZOWdRRVkyMWJNQm5QNGcwQXNpQVNt?=
 =?utf-8?B?OGRYVk9EejBPR2tVOTNRNkZPSi9McDVWL01CWktvODBoL25BQlBGL2RrTTVP?=
 =?utf-8?B?TzBRMGlObWVvNCtlQ1RGLzdZVDRHQmJjaWVERElYaDBrdzVqelBaSnVaSTVh?=
 =?utf-8?B?VjZKeUt3ckZNa3hyb3ltdUlpb0JST0lCV1pXTlBuSXdoTWliWGpQYStNK0FR?=
 =?utf-8?B?NnlDOGpjd2VHWGlyRldBamtOTjdMa3FNZVErQ3NZdnBRWWV6U1JIYWw3bVJP?=
 =?utf-8?B?RkFNSVZpejk2eXVpdEVYUFF0QmhCSlYrNitQVGFtY1Y5RDliSVh6dytIV1JT?=
 =?utf-8?B?dm52UXFyUjJkK29GSDF2UEhLTnRWRDNnaGRHVnJPTHdHZ3NZN2pIaUxTdFlv?=
 =?utf-8?B?ZnlFQlhmQXg4aXdLRzgrS1BwL2RWR0ZBeXFxdHlndS9vRUwxcWhBWGxwV1VM?=
 =?utf-8?B?Z3VHbThTbGdrTE5qWHJUQVZMbHZvdWd3K1FyNGRZa0h3SXJSSmFvTVh2WUJm?=
 =?utf-8?B?UjdNZmwvOXEzVGNyallRM2tNTWxLTkNBS2g3bnNHK3RRdHo1bWhIR3Q0ODBY?=
 =?utf-8?B?cjgwT0VVUHNtYnlDdDE3QUZHQUdXSTl2bXVNSmkwcm5CVkVMNm1BV0RyRUow?=
 =?utf-8?B?amQzWThMUXpyZGVDVEFtM00vSWpsL3ZaREVKSURoakIydGJ1enFrTHU1MWhJ?=
 =?utf-8?B?WVhUcStxOXc1eXZPZXlubTVKcUJ1bFJUZ01CcmswKzBZaDdZc25wZWd0WEdF?=
 =?utf-8?B?QjFYbFdtcjFQQmxMQ2c2TmVFaGxHSHA5UkZoVTJoZDU2RXdKT2d5VmtPYUZM?=
 =?utf-8?B?ZzF6ZThjV2J1dTE0ejZaTnlTQ004TUZ5aWlLZzNjL1Znakl5Y2VMQW1QTitW?=
 =?utf-8?B?QjlZZEQxdU1rc2t4MTNtYVprZUU1MldwbFE4T01scDFZM0hsZVgyRlRVWm1N?=
 =?utf-8?B?TUNudkJZQlZvOC8rck1XK3l1cEFJOTVBZGJBRkd6VWZPYnBsczFCTzRoLzhR?=
 =?utf-8?B?bGVDVmhYaGY3Nnh1UVZRU3hha29zSFovWFRzSVpvQXJJVGo2dS92SmZNT1Ev?=
 =?utf-8?B?bEZzaGpNNlNqL0ZxNmMrT1RtUG9wVHRrTm1FZW1RWEwwb1Q5TlhMTm1wZk5m?=
 =?utf-8?B?NGZyb0RrZDduZXV1dDdLQ09wNVlGc0gzTkdaa1JWN0tUVGozTjFqWjF1bDVJ?=
 =?utf-8?B?aUtBSE5ISUJBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ead39772-0926-46fc-2b49-08da08068c48
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 11:09:04.4273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTim6WTVEimnR/BD48wYUwDvo7UcAohI52jatw+gwtR++L4KNMl8PWlmSLnDl5z8FzRjckAeRpQToqTEYM1okg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6102
X-OriginatorOrg: citrix.com

Hello,

Relocations that reference symbols that belong to sections with a size
of 0 are not properly resolved, as the address of those symbols won't be
resolved in the first place.

Fix this by not ignoring sections with a size of 0, while still properly
handling the detection of whether a livepatch can be reapplied after
being reverted (patch 1).

Also detect whether any relocations reference unresolved symbols and
error out in that case, as those relocations cannot be resolved (patch
2).

I wonder whether it's possible to have unresolved symbols if we only
ignore non SHF_ALLOC sections, so we could maybe error out earlier if we
found a symbols that belongs to a non SHF_ALLOC section in
livepatch_elf_resolve_symbols.  The current approach is more conservative
as we would only report an error if we have unresolved symbols that are
referenced in relocations.

Thanks, Roger.

Roger Pau Monne (2):
  livepatch: do not ignore sections with 0 size
  livepatch: avoid relocations referencing ignored section symbols

 xen/arch/arm/arm32/livepatch.c  |  7 +++++++
 xen/arch/arm/arm64/livepatch.c  |  7 +++++++
 xen/arch/x86/livepatch.c        |  7 +++++++
 xen/common/livepatch.c          | 16 +++++++++++-----
 xen/common/livepatch_elf.c      |  6 ++++++
 xen/include/xen/livepatch_elf.h |  3 ++-
 6 files changed, 40 insertions(+), 6 deletions(-)

-- 
2.34.1


