Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A31473F62
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 10:29:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246473.425068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx47d-0005Qu-To; Tue, 14 Dec 2021 09:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246473.425068; Tue, 14 Dec 2021 09:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx47d-0005NQ-On; Tue, 14 Dec 2021 09:29:21 +0000
Received: by outflank-mailman (input) for mailman id 246473;
 Tue, 14 Dec 2021 09:29:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzzU=Q7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mx47b-0005NF-CL
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 09:29:19 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e1be04a-5cc0-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 10:29:17 +0100 (CET)
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
X-Inumbo-ID: 4e1be04a-5cc0-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639474157;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=W8Ompw5YQI2LpVIzSI8Qr3AaasH0F6+6KuonVK3reuA=;
  b=HpcyGkoQiKUfe5b6JKXpT93bO3zBaB9AQcYD7yRDoo9m1zKUiCDglE6u
   od3U/jXmbGA0/jbTg7+6z2/JIYBMjKNgll2DIu4EAwhQ8OdG5OFEK7gjy
   uEMSKZPe7oTHwxBureRqHhKXqHPHGlh2drENkCgVMvrQkzCBgx+xCa6tp
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2LlqvlCY5w5qpHElsxJGOkpAjcwZg35e+Tpz3x5O2F4YoFwBe1FagfGLTA9VuHonS/1XLwxQ6J
 jVlwtfCLKsaujDH7TMG4KTsiecvMn4oEWlQ5T5c68vFa4z1suJQGoTFgL2kKsz5uSO0lOGHE2Q
 +sFu5rP9sADoCsC29iz56T5nHB6TnsMe0HySfc0YOVwdNBaLcPRxScb3UNU3SZSFvRxzxgP4XC
 Cc+Lpbgs2h/Wt82kDLsH6vYZN1oJsxCBoiNEK0ep0vZThjF23y5FAmj/d1hYkdq7Ch+9ltrVO2
 sgK0Vr0l+IZeoqF5w3chdJy7
X-SBRS: 5.1
X-MesageID: 60358071
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CN7NU6wfhGoNeiJbPO16t+fowSrEfRIJ4+MujC+fZmUNrF6WrkVSx
 zMcWmGPMquPNmDxKt4gOozl8UtTucDWzNFqQFM/ryAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500s6wbdl2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+1xx
 8V9rcTvdT0oHraVofUGXDUJKAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEAh2pg3p8XdRrYT
 8YzRWp3SDHMWQZSA15OKbY5xtyHmXaqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJW6/PN3hFyYxkQIFQYbE1C8pJGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQnX6Lri4EA4VsKewa81i027Hbz1eiLz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpkuXFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNslMRiG2NPdXABb3nARBodtnxor6p5
 idspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD4LNwKuWkjehg4Yq7onAMFh
 meJ5mu9A7cJYxOXgVJfOdrtW6zGM4C+fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ6nkgWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPWkUgCC7OnPXGMmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcBoLYmrXGYewiMdF55b7bjAcR2oX4hZHR+Nle0wXkzJ42o6f5HJZcweLAm8s1lzOJ1E
 KZZK5nRXKwXR2SV4SkZYLn8sJdmKEahizWRMnf3ezM4ZZNhGVDEo4e2Ygv1+SASJSOrrs9i8
 aa43wbWTMNbFQRvBcrbcty1yFa1sSRPke5+RRKQcNJSZF/t4M5hLCmo1q07JMQFKBPiwDqG1
 lnJXUdE9LeV+4JsqYvHn6GJqYutAtBSJEsCEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iqrIGnARpGHLHMwaiBr96eyTU2MBOsutGx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHfvaYvPUH3xC5r577WA0xdMi6FhDFZMLYoYpgux
 v0suZJO5gGy4vbw3g1qUsyAG7ywE0E9
IronPort-HdrOrdr: A9a23:VOx1NassZovqjRa7NznfOifO7skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P7wrhJRGdZM8qPuMexzwqC33QRCvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="60358071"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQJVrMZZi46j1zQ43hC4fJvYwJqdwmECh96tLH2U3flSUr4QvMimOo75ciNGY8Ev1xLWvfExVycJRrcUsjmHWfXI/Q6felskPdvKsM6ch3VNQZxwvrptRccMdJed0VK9ALMHRhTivJufJvLXwK9rtsqFXgDsJbcSV+MupmKyNGeqZ2lJJmvmF+UZdM5JRCRmLf9ErmoDF1I72aCiuFlxgdrV7hMwRW+RzsguuO1ftlnLw534z0bgNzLjT/D1P23ah+PzE1LAd3v8jhPbTPNCQg/3QyVoexYIi/+oHlcqb6el74IDRFW7kcPHCJqQHpTzHzeZfdg6igR+MXUNWFiC9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgXEJ/muvv6MRCqI5WLbvWNUsIw2pTZ5Sa76qgTjs3g=;
 b=ObWGhcTUGBFi3knUE+6cr3GvMB5DD0Y0epIWuevSK1jLSFA98og8gV39SfHygszxoD0NOBezpqSBTdpmZIxdEDdJMbjU5L0rMgauaR2HZQPI2FgDGPaiVBuxyq0Wld+axwwtDIVtJBhfS7tuLgYMRUeHR4RTJdGF+Yu6CedocGrkBOgIcR0KQrEbF0JlXlYktYIfcWsKvG2sprgk1eB1u2RLvMg1dsh/ywHgN8+Iezth2we6ACuXvCSmLME65kM8nNrXwwbUnMKDnNgxbMcKkMssEBCPSjBAgVA3olrSySZHuFSvKV8iiEJVUFJ66IySqVObhWCTIn7y2rN4plhInQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgXEJ/muvv6MRCqI5WLbvWNUsIw2pTZ5Sa76qgTjs3g=;
 b=TFZBzXsj6oM86AvNJ3AM9V787IZsN8WYU1HBxAR6+IPwjE5NqQQehSloiWo600GnF2l1C81v12JWk5cec+qUXhNMPQey0WJX5d1bMSz+YBV92qJ1FlS/f8jL0LHEjTjvS7Ho1owILikAP/0Mm+VkFK7mcwJlPtR72aEjI/Yl400=
Date: Tue, 14 Dec 2021 10:29:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5] x86/PVH: permit more physdevop-s to be used by Dom0
Message-ID: <Ybhj4dlwnblDRqfD@Air-de-Roger>
References: <05eeb76d-3aed-f543-f0c0-dcfe4e2bcb6e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05eeb76d-3aed-f543-f0c0-dcfe4e2bcb6e@suse.com>
X-ClientProxiedBy: MRXP264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac9ce34b-2b3a-4f88-dc0f-08d9bee43040
X-MS-TrafficTypeDiagnostic: DM6PR03MB3673:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB3673717974C037B2B3762C4F8F759@DM6PR03MB3673.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s97ZMdsW4usQyX3UI8PMU074xB0KYSLro+jz7qIcmkscL48VnGbgDRTw9lpnl1OMYRhbxdsLq5eVp71b0XRivUUHRnwuikvEY8FcpfP7U9d83vcm21DJZmADpfUeK/Rce//MrQi46bp9lPRdWvM5uYxMZjtEs+qfA2XyneWaTY88st6UIeU7SiJ181kgzw2NgDVA8plk9XLRGPTlv9BUUrswt3IpL/IsRF/5IFJzCzD8uWdQC0PwcG5ImNGJ3bHEze3i/1VCDnIEAIKsyXtFJ+7aqJDylYf6boNoM5WXl72LiTpe6MFf6MC6b6g2PdxoG7D6PrVsCPojT5QYKOpV2c1eiBvboRxPnd4rm9O4b9EWKUBj396DL3u4gTUrcyxgvQJgVhFQqrhLSH/hfTrbFYTVUu5STr+5kBJJv6eUTDWC3N/xNQA7+DUKNwAGrYgSLSiYC9x3aYgucqpoZSw99HeNY5qwREDj03WGrDsn3UWBo5MegP/k3dgdtho8Olqx4jT/KKpa6Roek37Tqu1Zvc3twMIQ1xPGAoiyvewri2tW+xHVXbdRQPMa3eeE8oz64AlnE1aq4Dbr/p2nq529xVJlw6hR7jofMkMGBfbRWalQZihOJXe9Cyvmx1MCbGxUA0iI7tuD0yP2i+DW5CRRmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(33716001)(508600001)(66476007)(54906003)(6666004)(316002)(66556008)(6916009)(66946007)(83380400001)(82960400001)(2906002)(38100700002)(4326008)(85182001)(6506007)(86362001)(6486002)(8936002)(26005)(186003)(6512007)(9686003)(5660300002)(4744005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW83VStpNFFJMkE0Y3R6cHhJbnY0bDFFcmpOUXpqcmlZQUt1L1lDZ2FpU3R3?=
 =?utf-8?B?WHVLVHJmemZKcFQ4bUU0dUlDV1FiVXJ2ZTBzMmJIMjlPd3hhRGFjb2tBWkpU?=
 =?utf-8?B?cjZsMGVhTS9vWHI5M1BwOTRjUllJWnNOKzFaZ2p3UE9qL2xNOVhYMWFJc2NQ?=
 =?utf-8?B?VzdTK3c2eGVhU3pxY2F2S0xXQXlpaDQzOU16ZkdsRWYxcU92QW5WeEFIVU1J?=
 =?utf-8?B?c3VaS1VPK2lqbjQwaHBOSXl5Zk1IZm1PNVpCcHRWSkFIWDVqdjhUTHd4SDFV?=
 =?utf-8?B?NlIrWCtWdjd1MWE2YytRcVJNK0lkbzVlZVMvL1B1c0N1SnFaSWV4MnFMcCt4?=
 =?utf-8?B?cFlGOFJYZjllZkY3WVlHbVIyelRrWkpsNnNWQk8zbVBNazN3cFk3bFpvRHUv?=
 =?utf-8?B?MDFTOFJndWJ6UVk5Y2Y1ZWlzTzlvalNzZis4VkRMWCs4cGJEVDQrT3NNbEJr?=
 =?utf-8?B?T3kzemUvYzQralpHYmR5SUJER0RrTThyUzByMzN6S0RXME8yby9xanplVGk0?=
 =?utf-8?B?cFNFdDZtdFFHTWNrOHpFd0ZwNDE3d0tmdi9iWWorS1BIVCszSStvWjVPb2Yy?=
 =?utf-8?B?UHFscVRlNytzL2w5QjhHRVZCWThMV0kyMEtuMFM4MUp1SkJjQVNaWmxGK2ZN?=
 =?utf-8?B?RFlxQkhGQTFNYjFGZldQNXVITFJLSGR0VXBBKzQvUjVuS3d4UHE5TlVaVW53?=
 =?utf-8?B?Z3BrSVdyT0xreUdqalhCSVhzdGFYckdTc3I4RGlTT0I3dU4yeDJFYjFUNU5W?=
 =?utf-8?B?VnR5VkEzcjh2dHlrZ0x5N3BQUjRNNHpZTE41UHIxcTF2NUZUaE80ejhKWmJ1?=
 =?utf-8?B?NzYzTHdFYmliTjVYVnhKdW1JOVV5am12WUxCdXpTMnNUVHhLTktzQWMyc3RU?=
 =?utf-8?B?ZFl3WnJzZ1ZaMFJ5azJ0Tkt6OG5hMUdpK3NGZGFHVkRsdjZJdU5IQXpOdVBn?=
 =?utf-8?B?MEwwcWZDMWY3aVJUUnkwa3JFdFdMc0JVZDMySzcvUm91V1dUWjkvSC9Vc2JV?=
 =?utf-8?B?cEZaUWx5MVZmb043dHorOXd2TVJzVGNvRFdZRlUyLzM2WUx5bG42THhOeVNK?=
 =?utf-8?B?d0wvS2pndm1PQmZkcTYrZFMxOGFFNFAxY2M1dlFzbVJmcXZJOXA1OEorcE1T?=
 =?utf-8?B?NUlOdS9iaU5tc2pCOGgyUkJiblV5QS9rQlFUa2Q2dHpBQ3ZGN0VDL0dGWHAw?=
 =?utf-8?B?bDJsS1N0ZGhEeDV3bFdtSVRRelhIQVFYdVplWXEzM3lBOHlIbGMrTEV4Q00x?=
 =?utf-8?B?OVpKbk1ReFpiV1lwU0Nva1ZyZnFiYWdtdWJ0OHVRTzU3cS9IZHNMRXVwMFpC?=
 =?utf-8?B?K1dUUUpGQWFuNU0vcGV0SXdiaWtHOFZTYW1JMWdUMTZRdUliNHR3a3RhQnMz?=
 =?utf-8?B?dTR4N2h2N1pRV2VxSitHRFJFQkdKK00vK25EY243QU5IQUZOMXZyNVliVzd2?=
 =?utf-8?B?VUs4STBCSXBhdE96SkR4MnFRU1l2UHNhMGc1ZTIwK3o0cWxEYWViOVhhNGlZ?=
 =?utf-8?B?MHppQmVMQVFvNjcvMnhDc2QwNGpZK0N1VklncUtTRDZsM043VldrNWZhNjU2?=
 =?utf-8?B?c0dQY0UyM0lLalVYa29za0JpRnFnbHd5TGhwSThsRTlrSXNGa01iV2w1RlJv?=
 =?utf-8?B?RC9TRDFINk1xS1JZOGQ5NlFNeXZqRFJQTDhWelRQSGlMWnh0cVNieExJd1VM?=
 =?utf-8?B?a1cwWjFUT241eWZ6eVcxbnBFaWMxWUs0dUZ2SXFqb2dXY1dNTHdLcmhjRFFB?=
 =?utf-8?B?TlZRRlNRdUF1M3RIam93ckZLTVRxTmlvMHdqTU14c0dlc2dTTGN0MEVkQ1Jh?=
 =?utf-8?B?Sks1czhDS0t1YkxlYkdyVndIN3d4amZPR2kvblNVLy9VNW4wWllod0w0V21V?=
 =?utf-8?B?SjM5RGY3WlhLK0VXMnZjckdKOTV3MmU3UWJhK0Rxb2dXb2pPbTFodGx6SnhR?=
 =?utf-8?B?RjF2S1NoZlRONkxLTmxRcnduczBkZXV6UjQ1MnpxVmlmemdFRzFaMmNadUpM?=
 =?utf-8?B?TFA0Tk1NRGZqci9JRktuTzc5YkU0andPYVpqZ0dyZVZyOVJUa2JBOW83Uzc0?=
 =?utf-8?B?WVBFOXVXSTBWcWZmVlljaE5BSDBnbTFSa0VoUXJmQ3B6Q25iVGUrb0IzSjQv?=
 =?utf-8?B?ckpKeGtqVkJ5WXc3alRFNENxMG52V0hXQ1NsZDY5cllNQXlvamhWOFBHVWR1?=
 =?utf-8?Q?Sp0cHhvlL7JxnmkPQcOC7t8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9ce34b-2b3a-4f88-dc0f-08d9bee43040
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 09:29:12.2288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7HHXM2KHPIXfLksdBhalpft0B8mqmnmOTQZA1Bm/yL64hY3wu+FBC1iHh+01/nDXVIVujVPZ1Pv2AnsIKr0wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3673
X-OriginatorOrg: citrix.com

On Fri, Dec 03, 2021 at 11:28:39AM +0100, Jan Beulich wrote:
> Certain notifications of Dom0 to Xen are independent of the mode Dom0 is
> running in. Permit further PCI related ones (only their modern forms).
> Also include the USB2 debug port operation at this occasion. While
> largely relevant for the latter, drop the has_vpci() part of the
> conditional as redundant with is_hardware_domain(): There's no PVH Dom0
> without vPCI.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

