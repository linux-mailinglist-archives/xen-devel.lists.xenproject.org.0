Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD4D475470
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 09:44:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247237.426280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxPtE-00054M-Oz; Wed, 15 Dec 2021 08:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247237.426280; Wed, 15 Dec 2021 08:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxPtE-000516-Ke; Wed, 15 Dec 2021 08:43:56 +0000
Received: by outflank-mailman (input) for mailman id 247237;
 Wed, 15 Dec 2021 08:43:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iD5n=RA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mxPtD-000510-Cr
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 08:43:55 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21464ec1-5d83-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 09:43:53 +0100 (CET)
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
X-Inumbo-ID: 21464ec1-5d83-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639557833;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Kyc5hA5unG9cZZZ/4DgK6uatWjK8XcZes/1sBJxAHKg=;
  b=UpjAdiX5NzZnYGplZMwBJUTGnuqnRBoL3TQypgkrrfd0R1/HZN13EbsB
   gvB9UheM9YcCAgmqHbkOr3Kg36yzuSlxpV+zoJk7tPEnKuR8SG6FWcP1i
   L+TlJkOXDoXjlBIUNGJRI0ifzPro+120+OAFRCHWdpCP6si4bdaT6bQi+
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DT7cib3dcjKt8uMDZTPBhk6bZNnt2lZhZYajoV2SWUBFlXN8bSH94/+SMgROqd+HxUNGgUsz9s
 zHd4zimi4Druda5UCTKGVkY0G9it10W2YeMnf0nkG/Mb83c8PchGSci6NoYd4EW9FzujDdrVhy
 WB3bICcadGqO9iaUvsftitKxuQhk1UOGoxdGqYiytyxzHsEgd0oSKZeGOvZoC/NgFYadw7NsvU
 qjbp1elxmxF6yp4h5/19Xq1jJXCurVFWQz4LUdV0LhQeOPMzdjdmGUCRtBqdU+J1BXTQjKZSL7
 Sbs2WcFyrKjutugZ3rTc2V+d
X-SBRS: 5.1
X-MesageID: 62131961
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Q6/4lKsv33k+XdVzbduu1LF6HefnVINZMUV32f8akzHdYApBsoF/q
 tZmKW7UO/+KYjGjc4tyPY/j8RxS78SHx94wHlA5/iFgQSIX+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj29cy2IXhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpltLPqW1s2Lp/1tvU3DxV9I2ZXApZt5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JoXRq+PO
 ZNxhTxHfgTAfwJIEV0sCalgxt+GnF3ZLm10twfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCntSLkWqoCGbug7PlojVaPgGsJB3UruUCT+KfjzBTkApQGd
 hJSqnFGQbUOGFKDT/anTUGnsEy9kA82B9Z1I6oT1zqm1f+Bi+qGPVQsQjlEYd0gkcY5Qz02y
 1OE9+/U6SxTXK69EizEqOrNxd+mEW1MdDJZO3dYJecQy4C7+Nlbs/7Zcjp0/EdZZPXRECq4/
 T2FpTNWa1473Z9SjPXTEbwqbluRSnn1ouwdulW/soGNtFoRiGuZi2qAsAmzARFodtnxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd6pmn1pSDzINAOulmSwXuF1O5eJ1cFh
 2eJ5mtsCGJ7ZiP2PcebnarvYyjV8UQQPYu8Da2FBja/SpNwaBWG7ElTib24hAjQfLwXufhnY
 /+zKJ/0ZV5DUPgP5GfnH481jO5wrghjlDy7eHwO50n+uVZoTCXOEult3ZrnRr1R0Z5oVy2Jq
 YsCbJXTlE0EOAA8CwGOmbMuwZkxBSFTLbj9qtBNd/7FJQxjGWo7DOTWz69ncItg95m5XM+Rp
 BlRg2dUlwjyg2PpMwKPZiwxYb/jR88n/3k6ITYtLRCj3H16OdSj66IWdp0We7g79bM8ka4oH
 qddI8jQUO5STjnn+igGacWvpoJVaxn21xmFODCoYWZjcsc4FRDJ4NLtYiDm6DIKUnisrcI7r
 rD5jlHbTJMPSh5MFsHTbP7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V/LCfrZU0/d/FgbG/g72oS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK8zu4nvqrtdwlg2FXnHdQ32WLZpI33A1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KFGgCTW4NQ0PF7+tX1+87ewWElPOwWB1X5GJ7xvPYJ5m
 eostab6MeBkZsbG5jpesh1pyg==
IronPort-HdrOrdr: A9a23:FvtDzaoHWyMqFltJN22T9kgaV5uzL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PfP+W5gNcNvpcfHHelAlfii8Ql56AW6XXZ3vaEi946Ie3t0OlZSXkdozvdwPpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,207,1635220800"; 
   d="scan'208";a="62131961"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjsTlHifb1lXvfJGM1fjqhAYuuiiiSs7jwh7AnPfgfhzYjCcGY3ajOVuktr+RmLCqgtZ+Kp8HjTnjofihUIJWyjaKERpkIrFo6edkDhZxEbxYCuBZux5WUaKkrJw45tlryr7hJi+h9hi3Cio9dwiPm0XPcDWDay1nDGfdEjt8ks3y5UlU1wOZkdIMqp3OVztMz0LeVchOah6riprGKpK4Px1GcYbTgr3JoiMQZ5exSUDzbcQ9bdBI45+i53MpRDDoDxBqSAebG4WzyQX/R0tbWt+kbBNoOT1wWRtSnAypGPwz/V7AXCuEB+rGV8+B9tlbKjJQw+WCdVHCyggx/G3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5C+ZIk3e8/GCHvvU87Qy33fQR347nYv6mO5zi/A6Bk=;
 b=Z8Yt9mK9cY7L8jUElT6DdhsME5y+lwVfLyzIzqQZpWyGtTv2b545imsX0wRJbYpAuntkQSqXnhFetdtBxmdv4szxgPSL5KebxYQU9svzSpj/w1wnS2oRxOT19cfhbeRBb5Akn1LUxd3j3Lr1hrTApLk03FeBWMQYeuIxqqSaBzkfELTUnIHenMjD+LTxu8QWgL8yd7iN/wc3feZLl3mjIRAF1drDd/ie6a3Q5GyA+wZPq7CPlAW3O4DY3td2U0vT8ZymHph32Qr8Nxoxt5BqtWoLnfozKjIb/8U77ys6Etq+OEDdwHKU0Eida3FBFuifSbGSWFbEGpdSW8Km/tz7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5C+ZIk3e8/GCHvvU87Qy33fQR347nYv6mO5zi/A6Bk=;
 b=fAm8jB29P8exvAI4VIehnx+6aM0nosAfDm4SCKvIKxR3pzqoMQsxLQCJHCtCg/989BNP14+rdn1dp9l4i8Rq3crwNEa14qDFLkqx66Cr4kbz94N+wiDrhvsPFLYzt4iF7Til7L/8UXb+20N5PAhsT4gJzizDqhXfh5FtSdVL4pA=
Date: Wed, 15 Dec 2021 09:43:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [OSSTEST PATCH 2/2] daily-cron-email-real-*: Temporarily drop
 osstest-admin
Message-ID: <YbmqtYj4JRFNz24D@Air-de-Roger>
References: <20211214145226.2248-1-iwj@xenproject.org>
 <20211214145226.2248-2-iwj@xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211214145226.2248-2-iwj@xenproject.org>
X-ClientProxiedBy: MR2P264CA0042.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::30)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffdf7d78-3f34-4986-388f-08d9bfa6fd73
X-MS-TrafficTypeDiagnostic: DM4PR03MB6096:EE_
X-Microsoft-Antispam-PRVS: <DM4PR03MB6096225CCBA1592F4C9A08F88F769@DM4PR03MB6096.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ExGqt3T3xEontPNegFanOFUEvfa00U0VOCOBsK1LQ/axr+IK3mQmA1XYtsVvHMmc/5MwBGIEYNEyTH4a6iY48z98edC7FFKDps3n52tTdtLtqeGBAVxxSRPwYk3W+up2G+KNLXDRqJdBxhinS5X7QpOvQqWLqKOGDU/YLs17he6QkkxR81gyD0Ad9jd3IjNjZs9nW7AxbRNahtxpkgEeVUQQb0P8PrHPAalFEMD99KyKdnCXlctT8DM2XE3ejTxfrXRfgkYKzJmZ0DrP/pxMYprDM/mr4hw3zPIeGZwd7ImcOBwzzE+jc2rV4s6F+2H6v66Hif2j7xZklwwn8Lt4qDtFMW2Z+ahX++Y9HfP5D4qKpc4S0R7xHPkoCOgx8d27HnCFLdntvmxZCx6IOqifwvQgcIWpED334eIhXAtoznx5UU0pnt4p2/uUUTKNuFdZzA2BkcQdwrkKHuXiwfSoAwag75BDpQIIOWQVvl3YZbszrXPCBPVcaeEqxf6cR8a5q6bacOWA+7JhiDZm/bV8CJf7kp8PxyiKkqJ0cdSKHvNb77SrPXxhtSi2nr5ZDeV4DVtKorC7EI7hD8yEVhaDnrv0OLD/+Re0huwHh/z4LSVI4jIE3T1huE06lCvIW+8JVglOrghUBrLmE+RQ0p1M6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6666004)(9686003)(4744005)(6916009)(186003)(85182001)(38100700002)(6486002)(83380400001)(6512007)(5660300002)(33716001)(508600001)(66946007)(8676002)(66476007)(66556008)(316002)(26005)(8936002)(2906002)(82960400001)(86362001)(6506007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlU2WlQxL0dHalZya0NXN0VHakRKamt5MHZhSmFtR0czbUJKU25WMWY1eVll?=
 =?utf-8?B?L0hMUVAvZ1BJaHNlak51WWpIbk1HZE1oaklhbUlTc3U1Ymt6aytrQUhGQy85?=
 =?utf-8?B?UHBaTnFkbDZ6WGtrY0FXRnFSOHR3Mk43Rkd1dUJxcGFsV2l1MDk3ZWdsd1Uw?=
 =?utf-8?B?MlRheU8xbWw1Ui96aVUyNmlHeW1aaUhQMTRJTi9nZ0V2WXBrRnBGcllTblhS?=
 =?utf-8?B?L1ptV3VlaDdwcHhmTXpmS0N4Zm82eTZ1emdDTXp1bndsRUNOTGlBQkYzN2w0?=
 =?utf-8?B?VGFxYmZZSUN6dHlsbTkrOW40bGw0dGZxOHRHeTdsOHkrQ2RjdTdTby84WFdY?=
 =?utf-8?B?Q2czSC9FUld3cXhyL3orZS9uVXJKbFJ5R1VSc3lrbk85MVB1bW1mR1RITFFZ?=
 =?utf-8?B?T0xWdFhaY21wa2RINEhVakx1UVN6VEptRmVUekFJVXRrMVVwSWlTZThmZzJX?=
 =?utf-8?B?MEwwcUR0SXVqRjhZWG1JUnBHR3pvV0FhV3phNFlET1UweEd2UFBuRy9hREVa?=
 =?utf-8?B?TG8zZmViVXBsWStVVHcyZ2doN3lZaWdjQTBYWFMrMnFQQ0hyd1laRExRaDNi?=
 =?utf-8?B?SHhiREJkSFZTODArYndEOG10alJoOGtabjFQb29lNTd3TlNuR1kxSVVyd2la?=
 =?utf-8?B?bUhjVzRuMkZGOEEzZU5mT3AxdU1kSW56dFpKdStTVXQyMHVmQUJMMGRCQXAr?=
 =?utf-8?B?c01VOVA4ek44c0FFWC9ueWZuS1U5VXFaeE9NL1Jjb2preEJHMFFXS21scnV3?=
 =?utf-8?B?ZHRxendsUUlCbHE2bUJ6cHlxcFRFYW9IcVFHNURBZkJKK1BuektuTlNCRG9n?=
 =?utf-8?B?ZWdFTHNWeitsaVBKcjNmaVZvVEpIYlFySTV1U3pjNHpTbXpQNHNubFBydkFi?=
 =?utf-8?B?NDhqSTRNQm9XbnVDOWd6VHZLbnJNQzltTHQ1dVpoZmRMRUNhNTYxc2JCTEZ2?=
 =?utf-8?B?aGg0aG9CdUFJaXQyRjFCRUpFZzlGbE1xbzJFb0xxdHVaZktRL1pVVUc4Sitz?=
 =?utf-8?B?bHQzempUdDBlcXFWb2JKT2NScDZmWHdaaTBib2kwNm51TGdja2puWFdLNkdF?=
 =?utf-8?B?ZDJHZ21SNmZwaWFQd0x6dnFzSnlDL3VhNXk0bzlwZkpVZHlTRUk5NWk2Vlhk?=
 =?utf-8?B?SWFOL0VTdjNMdyt5YXFvcHE4TGNaRFhvTWFaekMxcDB0dlMwblNRek4zYjVC?=
 =?utf-8?B?bHk0K3VEWmh1QUNZMHhDRXczclNlODZWYWl1QkRCSnQ0aXZOY3Z4SzQ2bXhV?=
 =?utf-8?B?LzBlRGRodjY4MDZvREloclA5alVPdFRIVm5MSG5BT3RJdXRpenFFMHpJUlZP?=
 =?utf-8?B?TE1FcTFnOTJOVXp3VHdlWHZ0aEprbTJZdHBXMGNrZEV5RjhBcDJtN2NWRjk2?=
 =?utf-8?B?MjdMaUdWWDd4SzAzNjRKYnBUc2NFWVNYM3VLTktUVm92VlB5aDlacmYwbjFJ?=
 =?utf-8?B?YWV0MjRIUFhtZkFCWlEwQTU1UDdaY01CWm1HWDBPUlhackozL2JEdCttSkRp?=
 =?utf-8?B?UlZjcWpJQjFPUXhlY1RpeFp1OVQvaHRDMnMvQVhhWTVaaEJCaTRZV2kvWWdi?=
 =?utf-8?B?bGxBdnlTVnRYdU00YWtBN1kvMGVjRTRHaUVNY0NMa0VtUlZyOG5wb29La3pX?=
 =?utf-8?B?ZUxGdWY0bi91cU5xMVEvandPMEQwRWd5Vlp0OXFMSEc5SGJ3d2lBRkVzRXJz?=
 =?utf-8?B?MFlqNG1QUVZ6TCtrY3Q2Ykc5bGlJWmpiTGNKdGx1b0o1NElSUkhTTXcybWdF?=
 =?utf-8?B?NURNSnlFNU5lOVQrU20rdGVkK1JDYysrVWl3TXdwazRpcVVnc2hGQ29kYzdM?=
 =?utf-8?B?MEJrTU4rb2IwQmI0NUVQY24vb1RKaVE4dk1YdTcxNGRpOWxWeDM0RjRTZDJ6?=
 =?utf-8?B?V3FmYTFJTHNPUnd1QjRCUFJHd0FqOTc5NGhXZGdMeUI3bkQ3TVl3TFFZL0dh?=
 =?utf-8?B?VTN3UzQ0RUFMOWRSeTJQVEdiMXlvdTRGYmFiclNDSTR3WUdYY1JPMUpTbUEy?=
 =?utf-8?B?Rk9ONENsbElKSWVDRzlLMU1sU0J0VjR5U2ZxK2pWVXd1Y1dyekZRdGpvaEdF?=
 =?utf-8?B?L1J6OCs4d2JmMWozZThGYkx3VDZSNWlOY2xlV1pncnVaQlhocmk1RmQ5akc2?=
 =?utf-8?B?SlNGakpFSGVVaXdxenljci91VzM2SmJqUXBMNW1iSlhXMmV6OWd3MXUyaEsy?=
 =?utf-8?Q?K8pl2rM8yFD4EA56y1hdpZw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdf7d78-3f34-4986-388f-08d9bfa6fd73
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 08:43:38.8453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Css71Z/+hFyENQO3dtZ6qc9USEII51XqwU6ZUqLvcmCSHNFV4ivFxB3Jw4efT/mskqqszaZ/2toaZGpfdPTUVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6096
X-OriginatorOrg: citrix.com

On Tue, Dec 14, 2021 at 02:52:26PM +0000, Ian Jackson wrote:
> Roger has agreed to take on osstest admin for the moment.  Someone who
> intents to take on the role long term will probably want to get CC's
> of these flight reports, but it's fairly noisy.  So for now, send them
> only to the lists.
> 
> CC: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Ian Jackson <iwj@xenproject.org>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

