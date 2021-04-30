Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6C36FE25
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120657.228229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTy-0001p7-4f; Fri, 30 Apr 2021 15:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120657.228229; Fri, 30 Apr 2021 15:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTy-0001oK-0O; Fri, 30 Apr 2021 15:55:10 +0000
Received: by outflank-mailman (input) for mailman id 120657;
 Fri, 30 Apr 2021 15:55:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVTx-0001HD-7Y
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:55:09 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aeafd958-da13-4b82-84db-b27d68e2283d;
 Fri, 30 Apr 2021 15:54:52 +0000 (UTC)
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
X-Inumbo-ID: aeafd958-da13-4b82-84db-b27d68e2283d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=a+brw/ab4WDrji72+dgrWoVFuLwkt3UX6eVY6D2foKw=;
  b=VTmn3r2W+kgglWPV2RpA9hvgqkpfofzcjYnPWw6pLegt1pW+JmkP8Q1k
   e0glNZk4jMIr34rO3VBM2VmrogEuQggQYKz7swuJ8Czlxy7A0MUiL0FoT
   dJSuvITT0c+lbVwTZzFpBveCBVi2oSUGRqOKDxAXkA8zT5foGlMR7BHjV
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WTLBaoxEGsEnXTK0lfhgGcsqomh5xsR3+B745OH30UwKJiOt0gpggCEM3Fc18LuMQjuacZ03sZ
 jLBYYbeoB42fciKgXG3am0vbxDbG0mrvPcc+5wczB43QgwQrfwDcKwP8xySRsY3X793RCeCnv2
 ZhTK3/u+IhHT4bmnurcBdDj9Om9tPTxzfdY9U4lpAvETOG6KgP9SEBiUtYZN/QbjcXkLWmQKuB
 S04j19dDHlbT1u+ZjiJu2gvbAMhPpHJ6TCNFWl2zA/YK4JwJMc38b4JfiEcx0qWtYxKkKiypWq
 8Cs=
X-SBRS: 5.1
X-MesageID: 42625739
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:eJ1P663JA78c9QM3qH3b5gqjBSB3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFnNJ1/Z
 xLN5JzANiYNzNHpO7x6gWgDpIEyN6I7KiniY7lvg5QZCttbLxt6Bo8Lw6dHFF/SgUuP+tAKL
 O34M1bqz28PUkGd8jTPAhPY8Hvr8DG/aiWBCIuKAUg7GC14w+AyLm/KBSA2wdbbjUn+8ZFzU
 HgsyjUopquqOu6zBi07R6Y071zlMH6wtVOQOyg4/JlTgnEsQqjaIR/V7DqhllczI6SwW0nn9
 XWrxArM94b0QK3QkiOvRDv1wP8uQxP11beyESViXamgcv1SCNSMbsiuatlcwDU40dlgddk0K
 gj5RP7i7NrC3r7/RjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VOI1oJlO31KkXVM
 1VSO3M7vdfdl2XK1rDuHN0/dCqVnMvWj+bX0k5vNCP2TQ+pgE382IogOgk2lsQ/pM0TJdJo8
 7eNL5zqb1IRsgKKYVwGfkGWsnyLmDWWxrDPCazLD3cZe86EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3dFnpDcGIwZ1X4hHASGiwRl3Wu4Fjzqk8noe5aKvgMCWFRlxrudCnue8jDsrSXO
 v2OJ8+OY6hEULeXaJymyHuUZhbLncTFOcPvMwgZl6IqsXXbonjtunRdufPNKPgeAxUGF/XMz
 8mZnzeNc9A5kekVjvTmx7KQU7gfUT54NZ3C6jV/+8azYAXLY1Sug0JiVC0j/v7aAFqg+gTRg
 9TMbnnmqS0qS2d5mDT9VhkPRJbEwJI+rn6SmhLogULKkvwdr4Gt7ykCCVv9UrCAiU6Y9LdEQ
 ZZqVgyxLm+KIaIwzs+T/i9NHiBsncVrHWWbpsVl6GZ//35cpcgAptOYt00KSz7UzhO3Sdjsi
 NqdRINTE63LEKUtYyVyLgvQNz5W/Y5qgGxOsJQoW/Yriyn1LsSb0peeSWvX86RiRspXBxOiD
 RKguIiqbKdhDeiLnY+iuwkMFtKLH+aGq5CER7tXvQoppn7PA53VmuEnjqcllU6fXfr7Vwbgi
 j7ITSTYuyjOCsVhllIlqLr+khzbGOTYgZ5bW17q5R0EQ39ywFO+P7OYqq4yG2KbFQehukbLT
 HeeDMXZgdj3cq+2hLQmDGMExwdt+MTF/2YCLQoaLfI3HyxbIWOiKEdBvdRuI9/K8qGiJ55bc
 uPPwuOaD/oAeIg3AKY4n4jJSlvsXEh1fflwgfs4mS01GM2aMCiaGhOVvUeOZWR/mLkT/GH3N
 FigdU5sfC5P2/xZtSFoJunGwJrO1fWuyq7XusooZdbseYur7N1BYDcSiaN23dd3hkyRf2E5H
 82UeB++vTGNYBudcBJJH4c8VotidiVLEwk9gbxGfQzeFkxj3nde9OFioC414YHEwmEvk/3P1
 La7ihWu/HCVCGH3aQBC60xLX9NAXJMnUhK7aeHbcnIFA6ud+tf51K0PX+2ba9FRMG+aMothw
 c/58vNgvSeeCX50h3BpDd3IqpB9GC8XMO5aTj8aNJg4pi9IlSDgqyj/c61gnP2UFKAGjglrJ
 wAc1AMZcJejTRnhJEr00GJO97Knn4=
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="42625739"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZx7wlsr9SzmGn7ouRzpMDuSdlCSjkktwgSxn8JE/QWnOA4tKEoaurk/hEOfdZf9Fu2gA9CcTwXxzYkXwb46jpeUCtMrSnETCLaf2v/e5A2665WrCnw3A5hTRUT9+8S6YzeZciC8OFfPlnVOXokE7gqujqM5QrCjZEvTm9NEwOcCY9o5Ehi2wPf+7f5r40NvfrLRpVnd0FtDKtFGmlk0p+EtD1COVvbFDOPnJB8iazGEPp7wwvejxVr/xD06Ehh4TMcg2hGU6/7SJYp7beEZLhE6lyn0Y9NIIF+aou39vByIznQ+KGafKZU43+yaVlProb7gWbqIeHOkJDRDiXj5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8dPs554Z+qKHV0aj5xYX+zXPIW+eM8kD/rIFlYebrw=;
 b=Cz3e2ABM4AMpwkXfO0sMvckAxGxnKLkJOP6u3vfFgUaKjyjhoghSxPdWKP34YWOFgbL+7MaxNM1519L8J+mMoqNaQv6RDGAEdzrnvNzXWXuqvSxet2VmZq1S8/HkQFiGl/91/8418FHBi18YF/r1wHiwhsrrn6T9RBV4sT+6Tx+0C8eHz19mINhF8ER8pW7q2ShH83AGuJEy9Dq9nYsOa5LZ4x1dzulefdugXXMxsDfU3d3znqEkl8BrM/2H/G1DJYcUIIvyVPKmR2z2JUVsdBMLYt7Kts0phFvyYRiBwhMLMu2tRjIDVocwMRGlCay8fijr9To4C905P/vNr54chw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8dPs554Z+qKHV0aj5xYX+zXPIW+eM8kD/rIFlYebrw=;
 b=hhqs7oIEqqkh9rbSLkkJQ7dCTh1kOLj2Nc4uZowHCy3vpKh21WIlXopPTdQZDqV0p9LlrcN+ucfZ6eR5YyCuap4dh9CeDW6r2tH1lLrphqbtsyConMr8BuZnTbtfAwL8DG3DzimyEknirV8hfdv/9jIr9Z0qCVaMg5UYDf6KHGQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 13/13] libs/guest: (re)move xc_cpu_policy_apply_cpuid
Date: Fri, 30 Apr 2021 17:52:11 +0200
Message-ID: <20210430155211.3709-14-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430155211.3709-1-roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0138.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1ef60f8-222a-43c5-cf22-08d90bf048dd
X-MS-TrafficTypeDiagnostic: DM6PR03MB4602:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4602AA485B5055AEBEA317F78F5E9@DM6PR03MB4602.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:272;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fpj7HFBK61WU/LIKGHehygfyoLz31GQWq1NJFQIwiztR8lpL2hFyX5ihQajvLatYrXk9WqGB6YUEYWU/CJtAHWIoKCzyImJUoz/c+blEJi3ak0JybLwI++oo+7sRSQTQ6Drs2YL2MS2SOzCKiNEDZ5q4g+6mrMiWapfiDTPZSRVAwK+Vc8x9g+r6KHVBGVzqa5IqaNqP5HHROqvfCRltvMiNCzGkvgsHQgPlHGUd6bn7SVAN5cWn7qHnsZ0O2k6C9vpUCH2+bRr4/dy4KTNk5V35wkNvgyFxOcwlrTo/JX3ZEi+LUCCiUNS6zgVyT6+GNoIMg2Zv1K7Q9ObxW2deyyJBsljCcJOSdEVK2C4p6CqZqEUcLzSVGdmVhQuZ0yjP6ulJd0R3WqnHhqcbOCw3raPQ+fMAaSzSAzhvAXleWC2FZh3BPvB/6f3Tu0JZnGsrt9EncC87tvK34XLsPnbx6gL4M/36eSSIvQuthugQr3u9x7ir/f7zIxFJmadYt0E5WYlWq12Gs6FcUajht0tunIYauk9hU22oeaKQKc4GWHnr13yAHYBtlSm/Y/nsPnT7J2D9RgXR5jwDOv1fTFOh3EnoztJBer5y/Q4zq8vEPJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(83380400001)(107886003)(54906003)(66556008)(36756003)(1076003)(38100700002)(6916009)(4326008)(66476007)(8676002)(2616005)(26005)(2906002)(6496006)(6486002)(8936002)(6666004)(186003)(86362001)(16526019)(316002)(30864003)(66946007)(478600001)(956004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V05ERXRaVWFNL0llRWhudEhxVDZNVGdkb01RV1l4c2JYUnU3bVp4R0cyQjRU?=
 =?utf-8?B?aEdrd21Yb3EzWGxIbGlyNWpVem5BdElKc1dwZy90NjM2enJXOCsvZ0IwZlZ5?=
 =?utf-8?B?clppQTBzSHFvRHJ2UVRsYkp1UHJ2NUJhbHczQTlrTU9xck1jU2UzN2NLMnho?=
 =?utf-8?B?TExiWTNSbjJPeGR1YlRqZHIvdlI1UXNyL2tjd0ZLcGxpcTNZKy9hM3I4UTV2?=
 =?utf-8?B?MEtPendJRVNwYTk5TVpZbUU0OWdjVXRpbnhFSk1ackdUSHpZU2FWQ0pxNnAy?=
 =?utf-8?B?Zk9CZy8vOFR1bmVBcDVuVmpmZTJwUmpLRmpjT3JOUExOcGtWNTlWMnRJTm5j?=
 =?utf-8?B?cVZuelVSVXhob1E2VklVQkJVMFRQTFdPaHh1YUNYbVlmMGJ4THNRL3pTNkky?=
 =?utf-8?B?SUNmSmVQWjZwUHU1RVh3d2VYaG1iZ2lUR3BUQStPT3Z5WVhuUTRXUUtnY09p?=
 =?utf-8?B?a0d5SXlaNkxxbzA5RTFvNmJvRGxoWmZ1R0Z5QmE5Q2NMZmY2WWJsYnpqSkNI?=
 =?utf-8?B?b3EzVVU2b1ZoWWtqN29MeWVwOEZVUk5vVGhNazZlMFB0MXhna1h6aVIrUC8v?=
 =?utf-8?B?dk9RajNBZmsxbFFseW9IaThlcm5aQ2pLMWRSdDlQV0d0STZIVnZQTlN6QkUx?=
 =?utf-8?B?TjJLWDNHMTJaL0VTM3NQbUxxeXhwOVU3Y2RnMk1XdmhkaWF5MlhnNGZBaFUr?=
 =?utf-8?B?T2NndkpacGRTQVZ5eStvb1RGQ0Mwb2tjOFovcVVJZXQ2M1JkcXlHa2RyYU9I?=
 =?utf-8?B?aTZzN1M2OGdJbVVaU3pOa1lhaDcyRnRDcjd4dkFzcHRyNzFFM2UydHQvQ0xh?=
 =?utf-8?B?NzZna0RFRXIxSmU4TVQwWHBWdkZBWDdJcFVlS1BSeHM0Q08rOVJncHBPQWNV?=
 =?utf-8?B?WGM5Mk9BcXRTZHdqdU9mandXU3dqMFc0eHNtdmhIOXNPRERsQUorL0pmR1E1?=
 =?utf-8?B?Z2tjZWpDOGV4azBycTczMHlVZEYyMk8xMGcrMHZhczBUcEZPVUtFVWNKZWdI?=
 =?utf-8?B?TGl0VlJHS1lWVHlKdkY5TDJFbElBQWRPUmpITlpqdEJXa3hGTUpXa2tod295?=
 =?utf-8?B?UmtBaFhiY3JhM2tqeXVnRzlPbUFsRm1uSFp5cWxxd3FYckMwUHlTZ0JySlN4?=
 =?utf-8?B?ZzFML1RrTlNHQ1BEakJIMFVQY0k4cmYrRHVXMDNoYUI1TjFuS2xLdmd4cDBl?=
 =?utf-8?B?dXMvWkRRY3pTN2xja1hYZ2o0LzFGa243eHVPMXZLdFFZZmVEeDVPaXZoY05j?=
 =?utf-8?B?WjVhL1R1MG5vYTZQRnA4ME9yQ1RhdmJrb1pCNFViRmZZY3g0L3J6TTUrWjJH?=
 =?utf-8?B?d3B6TFJRRWRCRlRqY3p2dnVLTGdQWTlMZCtySytGR0J2aVp2OURhcmF6eVhF?=
 =?utf-8?B?RzIxdVVEUkRTd3Vpa0J6UTl5SXJ4SUY4ZTlYbmt0OUlhd1RsMk1OUHlXb2Vo?=
 =?utf-8?B?OFoxWDh2R2hHc0dJMGtaMzZucGQvVHZFTjNTZit3OUNmLy8xaVR2ZFQyVFlL?=
 =?utf-8?B?UGtxbzBkMzZYSmVJZVkvMmFMUGR3VGpaM2hJUVdZZklURVhweWJaNjllSzcv?=
 =?utf-8?B?OVVoVzIzZjRFMUpzUGZ2WWZvek8yRlVIZksyTXU3MSsrL0QyZFZuRytDUjFU?=
 =?utf-8?B?a2VDQnR0L2tuS3p0dlJQT1Zycm9Wd2dxS3Fkalc0OVAwdWJma3pldm5Wb1ZR?=
 =?utf-8?B?UE1WeVp3WU1xMWhaOFN6KzNhY3BoU2d6UHY4WEgzciswNG1xeldWY2Y3VlRG?=
 =?utf-8?Q?qm8JVGWqULJqSxi/VT0LQqkitm0kXDvGQBbYQhC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ef60f8-222a-43c5-cf22-08d90bf048dd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:54:49.4129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPACY8ZNie7KxIh1iQZqkkvk8aFlTuFgrz+gudkqAY7yueQUbvEJACEek5XUBkyu6g2NL/dDNV4pQz+7YRRMyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4602
X-OriginatorOrg: citrix.com

Move the logic from xc_cpu_policy_apply_cpuid into libxl, now that the
xc_cpu_policy_* helpers allow modifying a cpu policy. By moving such
parsing into libxl directly we can get rid of xc_xend_cpuid, as libxl
will now implement it's own private type for storing CPUID
information, which currently matches xc_xend_cpuid.

Note the function logic is moved as-is, but requires adapting to the
libxl coding style.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Use LOG*D.
 - Pass a gc to apply_policy.
 - Use 'r' for libxc return values.
---
 tools/include/libxl.h             |   6 +-
 tools/include/xenctrl.h           |  30 -------
 tools/libs/guest/xg_cpuid_x86.c   | 125 --------------------------
 tools/libs/light/libxl_cpuid.c    | 142 ++++++++++++++++++++++++++++--
 tools/libs/light/libxl_internal.h |  26 ++++++
 5 files changed, 165 insertions(+), 164 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index ae7fe27c1f2..150b7ba85ac 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1375,10 +1375,10 @@ void libxl_bitmap_init(libxl_bitmap *map);
 void libxl_bitmap_dispose(libxl_bitmap *map);
 
 /*
- * libxl_cpuid_policy is opaque in the libxl ABI.  Users of both libxl and
- * libxc may not make assumptions about xc_xend_cpuid.
+ * libxl_cpuid_policy is opaque in the libxl ABI. Users of libxl may not make
+ * assumptions about libxl__cpuid_policy.
  */
-typedef struct xc_xend_cpuid libxl_cpuid_policy;
+typedef struct libxl__cpuid_policy libxl_cpuid_policy;
 typedef libxl_cpuid_policy * libxl_cpuid_policy_list;
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *cpuid_list);
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *l);
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index c6ee1142e8e..044d05321a3 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1864,32 +1864,6 @@ int xc_domain_debug_control(xc_interface *xch,
 
 #if defined(__i386__) || defined(__x86_64__)
 
-/*
- * CPUID policy data, expressed in the legacy XEND format.
- *
- * Policy is an array of strings, 32 chars long:
- *   policy[0] = eax
- *   policy[1] = ebx
- *   policy[2] = ecx
- *   policy[3] = edx
- *
- * The format of the string is the following:
- *   '1' -> force to 1
- *   '0' -> force to 0
- *   'x' -> we don't care (use default)
- *   'k' -> pass through host value
- *   's' -> legacy alias for 'k'
- */
-struct xc_xend_cpuid {
-    union {
-        struct {
-            uint32_t leaf, subleaf;
-        };
-        uint32_t input[2];
-    };
-    char *policy[4];
-};
-
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
@@ -2617,10 +2591,6 @@ int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
 int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t policy,
                                   bool hvm);
 
-/* Apply an xc_xend_cpuid object to the policy. */
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
-                              const struct xc_xend_cpuid *cpuid, bool hvm);
-
 /* Apply a featureset to the policy. */
 int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t policy,
                                    const uint32_t *featureset,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index d00be5f757d..139aa91dd11 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -288,131 +288,6 @@ static xen_cpuid_leaf_t *find_leaf(
     return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
 }
 
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
-                              const struct xc_xend_cpuid *cpuid, bool hvm)
-{
-    int rc;
-    xc_cpu_policy_t host = NULL, def = NULL;
-
-    host = xc_cpu_policy_init();
-    def = xc_cpu_policy_init();
-    if ( !host || !def )
-    {
-        PERROR("Failed to init policies");
-        rc = -ENOMEM;
-        goto out;
-    }
-
-    /* Get the domain type's default policy. */
-    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                           : XEN_SYSCTL_cpu_policy_pv_default,
-                                  def);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
-        goto out;
-    }
-
-    /* Get the host policy. */
-    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
-    if ( rc )
-    {
-        PERROR("Failed to obtain host policy");
-        goto out;
-    }
-
-    rc = -EINVAL;
-    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
-    {
-        xen_cpuid_leaf_t cur_leaf;
-        xen_cpuid_leaf_t def_leaf;
-        xen_cpuid_leaf_t host_leaf;
-
-        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
-                                     &cur_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get current policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-        rc = xc_cpu_policy_get_cpuid(xch, def, cpuid->leaf, cpuid->subleaf,
-                                     &def_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get def policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
-                                     &host_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get host policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-
-        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
-        {
-            uint32_t *cur_reg = &cur_leaf.a + i;
-            const uint32_t *def_reg = &def_leaf.a + i;
-            const uint32_t *host_reg = &host_leaf.a + i;
-
-            if ( cpuid->policy[i] == NULL )
-                continue;
-
-            for ( unsigned int j = 0; j < 32; j++ )
-            {
-                bool val;
-
-                switch ( cpuid->policy[i][j] )
-                {
-                case '1':
-                    val = true;
-                    break;
-
-                case '0':
-                    val = false;
-                    break;
-
-                case 'x':
-                    val = test_bit(31 - j, def_reg);
-                    break;
-
-                case 'k':
-                case 's':
-                    val = test_bit(31 - j, host_reg);
-                    break;
-
-                default:
-                    ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          cpuid->policy[i][j], i, cpuid->policy[i]);
-                    goto out;
-                }
-
-                clear_bit(31 - j, cur_reg);
-                if ( val )
-                    set_bit(31 - j, cur_reg);
-            }
-        }
-
-        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
-        if ( rc )
-        {
-            PERROR("Failed to set policy leaf %#x subleaf %#x",
-                   cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-    }
-
- out:
-    xc_cpu_policy_destroy(def);
-    xc_cpu_policy_destroy(host);
-
-    return rc;
-}
-
 xc_cpu_policy_t xc_cpu_policy_init(void)
 {
     return calloc(1, sizeof(struct xc_cpu_policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 2489ceb49b8..318f3bd8599 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -298,7 +298,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
     char *sep, *val, *endptr;
     int i;
     const struct cpuid_flags *flag;
-    struct xc_xend_cpuid *entry;
+    struct libxl__cpuid_policy *entry;
     unsigned long num;
     char flags[33], *resstr;
 
@@ -376,7 +376,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     char *endptr;
     unsigned long value;
     uint32_t leaf, subleaf = XEN_CPUID_INPUT_UNUSED;
-    struct xc_xend_cpuid *entry;
+    struct libxl__cpuid_policy *entry;
 
     /* parse the leaf number */
     value = strtoul(str, &endptr, 0);
@@ -426,6 +426,137 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
+static int apply_cpuid(libxl__gc *gc, xc_cpu_policy_t policy,
+                       libxl_cpuid_policy_list cpuid, bool hvm, domid_t domid)
+{
+    int r, rc = 0;
+    xc_cpu_policy_t host = NULL, def = NULL;
+
+    host = xc_cpu_policy_init();
+    def = xc_cpu_policy_init();
+    if (!host || !def) {
+        LOGD(ERROR, domid, "Failed to init policies");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Get the domain type's default policy. */
+    r = xc_cpu_policy_get_system(CTX->xch,
+                                 hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                     : XEN_SYSCTL_cpu_policy_pv_default,
+                                 def);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to obtain %s def policy",
+              hvm ? "hvm" : "pv");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Get the host policy. */
+    r = xc_cpu_policy_get_system(CTX->xch, XEN_SYSCTL_cpu_policy_host, host);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to obtain host policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    for (; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid) {
+        xen_cpuid_leaf_t cur_leaf;
+        xen_cpuid_leaf_t def_leaf;
+        xen_cpuid_leaf_t host_leaf;
+
+        r = xc_cpu_policy_get_cpuid(CTX->xch, policy, cpuid->leaf,
+                                    cpuid->subleaf, &cur_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get current policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            r = ERROR_FAIL;
+            goto out;
+        }
+        r = xc_cpu_policy_get_cpuid(CTX->xch, def, cpuid->leaf, cpuid->subleaf,
+                                    &def_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get def policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+        r = xc_cpu_policy_get_cpuid(CTX->xch, host, cpuid->leaf,
+                                    cpuid->subleaf, &host_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get host policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        for (unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++) {
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *def_reg = &def_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
+
+            if (cpuid->policy[i] == NULL)
+                continue;
+
+#define test_bit(i, r) !!(*(r) & (1u << (i)))
+#define set_bit(i, r) (*(r) |= (1u << (i)))
+#define clear_bit(i, r)  (*(r) &= ~(1u << (i)))
+            for (unsigned int j = 0; j < 32; j++) {
+                bool val;
+
+                switch (cpuid->policy[i][j]) {
+                case '1':
+                    val = true;
+                    break;
+
+                case '0':
+                    val = false;
+                    break;
+
+                case 'x':
+                    val = test_bit(31 - j, def_reg);
+                    break;
+
+                case 'k':
+                case 's':
+                    val = test_bit(31 - j, host_reg);
+                    break;
+
+                default:
+                    LOGD(ERROR, domid,
+                         "Bad character '%c' in policy[%d] string '%s'",
+                         cpuid->policy[i][j], i, cpuid->policy[i]);
+                    rc = ERROR_FAIL;
+                    goto out;
+                }
+
+                clear_bit(31 - j, cur_reg);
+                if (val)
+                    set_bit(31 - j, cur_reg);
+            }
+#undef clear_bit
+#undef set_bit
+#undef test_bit
+        }
+
+        r = xc_cpu_policy_update_cpuid(CTX->xch, policy, &cur_leaf, 1);
+        if (r) {
+            LOGED(ERROR, domid, "Failed to set policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+ out:
+    xc_cpu_policy_destroy(def);
+    xc_cpu_policy_destroy(host);
+    return rc;
+}
+
 int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
@@ -541,10 +672,9 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
     }
 
     /* Apply the bits from info->cpuid if any. */
-    r = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);
-    if (r) {
-        LOGEVD(ERROR, domid, -r, "Failed to apply CPUID changes");
-        rc = ERROR_FAIL;
+    rc = apply_cpuid(gc, policy, info->cpuid, hvm, domid);
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to apply CPUID changes");
         goto out;
     }
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 5709bcb93fa..d130c073ac4 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2050,6 +2050,32 @@ typedef yajl_gen_status (*libxl__gen_json_callback)(yajl_gen hand, void *);
 _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
                                     libxl__gen_json_callback gen, void *p);
 
+/*
+ * CPUID policy data, expressed in the internal libxl format.
+ *
+ * Policy is an array of strings, 32 chars long:
+ *   policy[0] = eax
+ *   policy[1] = ebx
+ *   policy[2] = ecx
+ *   policy[3] = edx
+ *
+ * The format of the string is the following:
+ *   '1' -> force to 1
+ *   '0' -> force to 0
+ *   'x' -> we don't care (use default)
+ *   'k' -> pass through host value
+ *   's' -> legacy alias for 'k'
+ */
+struct libxl__cpuid_policy {
+    union {
+        struct {
+            uint32_t leaf, subleaf;
+        };
+        uint32_t input[2];
+    };
+    char *policy[4];
+};
+
 _hidden int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
                                 libxl_domain_build_info *info);
 
-- 
2.31.1


