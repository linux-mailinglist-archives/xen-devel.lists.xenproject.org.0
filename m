Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4248B40B07E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 16:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186790.335533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ9KD-00079s-EJ; Tue, 14 Sep 2021 14:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186790.335533; Tue, 14 Sep 2021 14:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ9KD-00077b-9w; Tue, 14 Sep 2021 14:22:17 +0000
Received: by outflank-mailman (input) for mailman id 186790;
 Tue, 14 Sep 2021 14:22:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1wc=OE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQ9KB-00077F-Hf
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 14:22:15 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5441d78c-5b15-47fa-b41c-0f106c12f905;
 Tue, 14 Sep 2021 14:22:14 +0000 (UTC)
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
X-Inumbo-ID: 5441d78c-5b15-47fa-b41c-0f106c12f905
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631629334;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9BmDetHKCQXTnm4i/GilQXirlKvyh5ZfduiM9Mo3+tU=;
  b=G9JWjHy5/5+P3pBDaX6tRi33MEkt1/yyCk/eTasB3VnYjh76+VpO8EDy
   AHxbRKkdshS2SbkJYvuEXN8VT7dtrtbyPi5CP9xWI9hsoxOkA+MDUlQUe
   KooOS3a4BWgxWPKUMKBOE7/O0ZS59xYmaiXRJzCZJZuXLP8OkS4x5ct7d
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rdj6xcF5TXdN6VUWrTJUw5+NrOS/HQVoAywAn0CynvTvLVRH3RAHeijlfGvVCaWYANbntBMpib
 b9oTXHu5kDjyhs5VCNu9RyI1kckZElh8eP2hlDM4NZRBG4sxIy5UB0PZVIEcEn3qDUY5CyYdeK
 Y8l9cBkQkdlX3FNxTbcs0eOzan8eExRLeeByU5AyDAMxwzwolYpJJM8pfdduIah/O3EN5gDvIG
 6VfbVLo/UxJUpQty3VzOmNrV1HLnJv+xMjm+4LFpQ5fJlZBTv4jmcUXaUD8RsHLbkxxEhisczP
 UAA+AuMVSBU4hCxHnlj0APTI
X-SBRS: 5.1
X-MesageID: 52702693
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QfTsGKLznZ0uVsKpFE+R+5IlxSXFcZb7ZxGr2PjKsXjdYENSg2EFn
 zEeWWqPP//eYWf1ctAjaYvn9RkC78PSzt42TlFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM6x7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB20vO507
 Il0uaaxEw0HAbaQwu0QFAlhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Xv4AAhmlh3aiiG977V
 ok6OSgycS6QSDpEAUowN40Rhcen0yyXnzpw9wvO+PtfD3Lo5Bx81v3hPcTYfvSORN5JhQCIq
 2Te5WP7DxoGctuFxlKt8Hihm+vOliPTQ58JGfuz8fsCvbGI7jVNUltMDwL9+KTnzB7lMz5CF
 6AK0hcNk60WqHWndNinVTOHuyLetxNbS+MFRoXW9zqxJrroDxexXzZfF2MQN4N47afaVhRxi
 QTYxIqB6ShH9eTPECPDrO/8QSaaZHBNRVLucxPoWufsDzPLm4g1khuHZdJqCqfdYjbdSGyon
 mziQMTTgdwuYS83O0eTpguvb9GE/MGhousJCuP/BDzNAuRRPtLNWmBQwQKHhcus1a7AJrV7g
 JThpyR4xLpfZX1qvHfWKNjh4Znzv6rVWNEiqQc3QvHNCAhBC1b8JNsNsVmS1W9CM9oeeC+BX
 aMgkVoKv/du0I+RRfYvOeqZUp1ypYC5TIiNfq2EP7JmP8kqHCfarX4GWKJl9z20+KTaufpkY
 snznAfFJStyNJmLOxLtG75GgON0n3tnrY4RLLiipymaPXOlTCf9YZ8OMUeUb/B/66WBoQ7P9
 M1YOdfMwBJaONASqAGOmWLKBVxVf3U9G77srMlbKryKLgZ8QTlzAP7N27IxPYdimv0NxOvP+
 3i8XG5eyUb+2iKbeVnbNCg7ZeO9R4t7oFI6ITcoYQSi1U88bNv996wYbZY2I+UqrbQx0f5uQ
 vAZUMycGfATGC/f8jEQYMCl/oxvfRimnyyUOC+hbGRtdpJsXVWRqNTlYhHu5G8FCS/u7Zkyp
 Lip1wX6R5sfRls9UJaKOaz3l17o5CoTguN/WUfMM+J/QkS0/dg4MTH1g982P9oIdUfJyAyF2
 lvEGhwfv+TM/dM4qYGbmaCeoo61OOJiBU4GTXLD5LO7OCSGrGquxYhMDLSBcTzHDT6m/ayjY
 aNezu3mMe1Bl1FP6tIuH7FuxKM4xt3uu74FkVg0QCSVNwymWuF6P32L/chTrakclLZWtDy/V
 l+L5tQHa66CP9noEQJJKQcoBghZOSr4RtUGASwJHXjH
IronPort-HdrOrdr: A9a23:d64gLak9pdlzOlSGaDxaC4J/H/TpDfO2imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIGtFdBkVCe36m+yVNNXd77PECZf
 yhD6R81l6dkSN9VLXFOpBJZZmIm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTuj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZsA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQvZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv0nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLVU5nghBgt/DWQZAVwIv/fKXJy//B9kgIm00yR9nFohPD2xRw7hdYAo5ot3Z
 WzDk0nrsAIciYsV9MOOA42e7rBNoX8e2O+DIusGyWTKEgmAQOEl3el2sR/2AmVEKZ4uKfa3q
 6xFm9liQ==
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="52702693"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aN9SdOWQBI7himeFWWuql3zozSG5OlxnxX3b1CzAhM6cZqKIxGEfw4JFAhAU8im8GPEnT54VpX0VnOe8An8LCwOiJpvm8ZggVp/Lnw5eOwUW2Fy5f+k9PkqESPSARP2R9Py3JWue60uj5puNfhRyk5zBKMFq1jQ2mTwiw17N1rTBKpsIYDGlOhl5PVwiQiGEKkf37JuOj20YmDzsG53fUZ/hkRDCNG1xXhLBMRAv0PiW0AwXANY2elQ+4BKOQ+P0fYXtUYZLrrmpxowZtdrtzbvsiIagViNWNqcE3oRf/oS1xjQTNxCL5DNR1bGxMZtW9GY8ngVx+RU68aoeaKEQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XicimkWAG4CtDkeE7vKpUgbHBafeFsFVkiFg74ln4wU=;
 b=R6BeZxWKraIWYi1AU4xHP3VdT2wNGJjEdgRg1ChQiMc1YC679FCedAcGY1EXW6LhUEOeVNqhNmhexnboUhTTy5ZXrN9dXvx/iRcAoTOIDHIrW1z8Zt3W4fCGWSaD7ks0MC/Y3gL7MsWljbnAhfYIoVd3UJXVXM37mgVpzHPkcpiIkNREI0NgfsFxXo77NQ1lQuee+S+JxvdkZI+iLpmd3fCXH/SfRgl4cVxQYaiAa9hE1JM4IEObol8ISfGTmwMkf37TO0d2czPPJBmNiGSYe1XXcu1HOzJUOKdZamCbEwgPaifAbuHB7C1dGQxYE4Un0489fTKd23yxz3SNh00hzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XicimkWAG4CtDkeE7vKpUgbHBafeFsFVkiFg74ln4wU=;
 b=svnySeXtcyWJ1HWOALxP37Tfrlrk/VTm0nGBxgQ0b7trnMFDErbc3IPiTWxOSeuKU+GokRiv6Q6ROHbmlKhLMn9gTCKLDIuPu5aI8dgrUpHuXVKjYG63bc+CQNxy2dhKGm15zgd7TNhEehbajsis/YVDRNR4hlcyi8JGBjYMEKQ=
Date: Tue, 14 Sep 2021 16:22:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
Message-ID: <YUCwD5RWj0WKZZUc@MacBook-Air-de-Roger.local>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
 <YUByvkKO+NlIjB2m@MacBook-Air-de-Roger.local>
 <45e8ef36-3f7a-5cd7-e640-61e1c6d63903@suse.com>
 <YUCFxJnDoaVNgHiu@MacBook-Air-de-Roger.local>
 <df432c93-b722-6006-c3dc-7f511b377bcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df432c93-b722-6006-c3dc-7f511b377bcc@suse.com>
X-ClientProxiedBy: LO2P265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d66fd560-d261-476c-2bc2-08d9778b0a8f
X-MS-TrafficTypeDiagnostic: DM5PR03MB3068:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3068F9238678611B493A6F738FDA9@DM5PR03MB3068.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Vg4aCD/Bn6kjBwxi0HWmDQ4Ro9z4Lgpk9IpzmJQRzDrnyjaQETYhsuJzipjo3wssr4YUFuhLIdybR7OWlqg7Vv/bWketCVvnVEBTXDl3rnusdZlz2Y3QnIYMyd7BBPY54ifL+dSLb1+jLCl5X1jgJ78VwOW4oq8oH7EXxDb6q80V2vVltXuJu1rURkZfNobAU36TsiTn8yYgOSIMPkBIEIKVQQHyQFXnU1oikhSBeXFqva9D/yDRPDMwxt82H9OcFFbXULT8k8xoQeDOj74BA7EFTK+2zPFx6IFHZt109YlkdwiNLtMS+S6l4aFpAs89f7F3JRGYR1FrkrJbIDDq292ytk37KW0hrfnAxvrp/uMZqQ/o5OjpHFGgJ0kEqAvu2qQ89G8ZfaWJ5QWQfca7wVvxpV5rQfcGHsR6IKZby+eSgr9QjsGw3zleOu+gdVREJMguhbCsl3Coovfb+8+RQwcjrKKSdXxCUYFlpclAOV9FlEtWUU2bpULd8zh6ZXYTjSc1Fq228G4+w1NTAFuHQ/+6HmBEIyaWFRLW+GSxixGkrnHR4bEzYT1Y4QXTnpwy0lqD1i1CSMc5igDckLWQPCh2kBqLM5SIYZA9FA+5uzAmngkHJkAn6FHwmoS21AdZHozQbudoMR06MhOmdoMQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(38100700002)(66556008)(2906002)(8936002)(66476007)(9686003)(86362001)(15650500001)(186003)(956004)(66946007)(316002)(6916009)(6666004)(6496006)(508600001)(85182001)(8676002)(5660300002)(6486002)(83380400001)(53546011)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmdSdDRmQmFTcVZOZERtcGNVeTI3WlRxc0ZvRlBLRXU4Sm1kbDlWRHF3TjZK?=
 =?utf-8?B?cytnZkJVTHExV1BGNkFId2VYanVKcXVBcVhkUE5CV1hXakNJSi9qV3JhYmJX?=
 =?utf-8?B?ZzdveXhJa29Ba2Fhc2poMUtkWGh3WXBaZjlJRWxlVllQSEdoZWQ2OGU0b2cz?=
 =?utf-8?B?ZjNDdkxsaFByN2NFdy9ibnpyYTY3MUhLdncvVFBsMjZwRFNlei9ka29YeGta?=
 =?utf-8?B?dHpBOXV2M1Yxc2R6WEduWDNRdnZmbU1aZ04xZ1FxeFBrempGN0hsWjVuRE82?=
 =?utf-8?B?V1RZTEpjTktISWllYnRBYjR5eGZxU0UrTFBIc1dVUXcrVDIrd0tZM003NmVh?=
 =?utf-8?B?YUdlR3Y0dWptVFBhaEpERml2Q1NvQzdRcHl2c2ViVnl0Vm0yTzV5ckhqOEpv?=
 =?utf-8?B?bVVKTnprSkltNkQxbkRHdWVURGVxa3ZTdS9ZNlduU1lVeE1MOGZ0OTF0Q1o0?=
 =?utf-8?B?Q1c3MGs2N2FSeWxEZzVzRUZEUW9vZGZRTGRBR054bEh1elpLaVNhSEJyT0tK?=
 =?utf-8?B?WmdacFNDeWFyRHRQelIxTDNDWGhVVkNsRjhwV2dyTVM1bmdBdHN1dXh1TndB?=
 =?utf-8?B?bm9rRVVpdzNLdUNQK20zSkl4TW9hQzFOREt2aXR5alV1SG11cFZReDRYZWpI?=
 =?utf-8?B?OXFLWk0wTnozTXUrdDZQbVF5R05UNEhZOG5yRnYzRlFVUnBzY0d5cWJHb2xp?=
 =?utf-8?B?M09IOXJza3JBYkkrNEgzaGp2clMrbDJIWitjekllWmwzSDRmZWxWYnZYUWMx?=
 =?utf-8?B?TFN0OFE2Q1FLOXl6L0VkMkRKR0tnK1FjWmRGKzFHRVhzWnJYOE9BOGVGcExQ?=
 =?utf-8?B?S3ZWZzlnU1BZdnVOU1ovb0lYb1o2N0ZONDM0ZUZhVEJ3cGVJVm5xODZrdVdE?=
 =?utf-8?B?ZzIzQzVlVnlYc1FXdzRTNHpTZVhHMXI5bVIyTUE5R0NlZmVCa0laa0lTVlQ0?=
 =?utf-8?B?N2V6WFRIbTdtWERwKzdtS0RTWjIxUEs3Vk9NbnI4M1M4SldYY3ZEZTZrWHBi?=
 =?utf-8?B?bTY1MUNUZmtLcEhYVTgwQ1JuTGJidUI0Z0NIWFZJclpsdGZ5bmtxZHdva3J4?=
 =?utf-8?B?TVFWQWlzaWk0ZWVsVllDUE1qNG9nM2VEdWlrczNWZWxZRFUvM3JkQ2RhV0tT?=
 =?utf-8?B?R0JPRDVab2hWeUZ3WFRMTVNqNDBybGZWZzhqT2QwMFRyQ0pZdW9UZUhTckkx?=
 =?utf-8?B?SzJNY1pOb2g2NVlNNDZka0tUcnJCODhwQlR4SnVMbzFUSWNhMzc0NUFGQWxh?=
 =?utf-8?B?Y1BPWWRzeDE0Rnh6NU5PVzc2N0xSSDFhMXFzb1RzQ29nYmQwaGlHRWg4d3ZD?=
 =?utf-8?B?TWphTHFSVlVFeXRVZm1ZS3FIZm0xalV4TUd6aFc3UWxZZnF2ZHd3L2pwUWFV?=
 =?utf-8?B?MzZpTGtwNUxYOUFNV29ndTNpSUJ1M1doaFUxZ2ZzRDhlbHJnUXpxSVV1WGhv?=
 =?utf-8?B?VDhJQmFMUnN1cmhPYjhmWWE4aDhKeCtIWWQ3N25xZTVLVWR1bSs2aFFXNE43?=
 =?utf-8?B?dnY5Yyt0a015SjFSTTNzOUYwdEdUbXo0NHY1bEFybTJoM2tQUGZCL05xSmZP?=
 =?utf-8?B?SHR3UDhodVI3TFZqUTROTDlNOEhDT1hyZm9zcDM3c2tMK054Rld6VUJza2da?=
 =?utf-8?B?aGFkMVNtV2ZYcnVwOTh3TkNXOHJ3c0lHbGpnTW8zU3FwVzlpVnQwbytaYU5Z?=
 =?utf-8?B?Ukh2ZFBnSytHQWZzYWduL29MdW44VXJzb1RsbE9OZ3Q1MlY1YWlqZERNeDJB?=
 =?utf-8?Q?m2bgVOYDUBpKmvqt6bi+m3LpCovPkCuWzqZeOAs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d66fd560-d261-476c-2bc2-08d9778b0a8f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 14:22:11.1826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBJJbnGKgqSBDTZCSnRA0tl+4OHDczxPdk/NZCk0N6QBQSshs4B4LyjARTlEkUMJz51XxnYMUCOkaLdqq/cE3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3068
X-OriginatorOrg: citrix.com

On Tue, Sep 14, 2021 at 02:05:01PM +0200, Jan Beulich wrote:
> On 14.09.2021 13:21, Roger Pau Monné wrote:
> > On Tue, Sep 14, 2021 at 12:12:12PM +0200, Jan Beulich wrote:
> >> On 14.09.2021 12:00, Roger Pau Monné wrote:
> >>> On Mon, Aug 30, 2021 at 03:04:55PM +0200, Jan Beulich wrote:
> >>>> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
> >>>> console) are associated with DomXEN, not Dom0. This means that while
> >>>> looking for overlapping BARs such devices cannot be found on Dom0's
> >>>> list of devices; DomXEN's list also needs to be scanned.
> >>>
> >>> Thanks for looking into this, I certainly didn't take hidden devices
> >>> into account for vPCI dom0.
> >>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> RFC: Patch intentionally mis-formatted, as the necessary re-indentation
> >>>>      would make the diff difficult to read. At this point I'd merely
> >>>>      like to gather input towards possible better approaches to solve
> >>>>      the issue (not the least because quite possibly there are further
> >>>>      places needing changing).
> >>>
> >>> I have a couple of questions, AFAICT we currently hide the serial
> >>> console and/or the VGA adapter if it's in use by Xen.
> >>>
> >>> I wonder whether we need to add vPCI handlers for those:
> >>> setup_one_hwdom_device will attempt to add vPCI handlers to the hidden
> >>> device because of the temporary override of pdev->domain done in
> >>> _setup_hwdom_pci_devices, but I think that for hidden devices we
> >>> shouldn't add vPCI handlers. We should instead block PCI config space
> >>> access from dom0 to the device so that it doesn't mess with Xen usage.
> >>
> >> The answer to this follows (I think) from the one below.
> >>
> >>> It's also not clear why does Xen want to have those hidden devices
> >>> partly controlled by dom0, as it would seem to me that dom0 interfering
> >>> with hidden devices in use by Xen can only lead to trouble.
> >>
> >> Dom0 can't interfere as long as it can only read from the device.
> >> Restricting accesses to reads is one of the purposes of "hiding"
> >> (the other is to make it impossible to assign these to a DomU). Not
> >> allowing Dom0 to read from such devices would lead to wrong PCI
> >> device discovery - some devices would be missing (which may or may
> >> not be merely a cosmetic issue). If the missing device is a multi-
> >> function one at function 0, other devices in the same slot may also
> >> not be found by Dom0 (depending on whether it looks at non-zero
> >> function numbers in this case).
> > 
> > Hm, indeed seems possible that missing function 0 the whole device is
> > skipped.
> > 
> > Maybe we need a special vPCI handling for those devices that just
> > allows reads but not writes, and that doesn't maps the BARs into dom0
> > p2m?
> 
> Not sure about mapping. They could be mapped r/o. And they may
> actually need mapping for multi-function devices, but I guess for
> such devices to actually function properly then there would be
> more work required.

I'm also slightly puzzled as to why ehci-dbgp uses pci_hide_device
while ns16550 uses pci_ro_device instead.

Is this because the PCI device used by ehci-dbgp must be shared with
dom0 for other USB ports to be usable, and hence dom0 will need read
and write access to the device PCI config space and BARs?

Note that pci_hide_device is less restrictive than pci_ro_device, as
it doesn't mark the device as RO.

That would seem quite risky, as it's likely that dom0 will perform
some kind of reset of the USB device and thus the console will be
lost.

> > Or could the BARs potentially be shared between multiple
> > functions on the same device?
> 
> I don't think that's allowed (or would even work) - if anything
> (like in general) small BARs may share a page, but without overlaps.

BARs sharing a page should already be handled correctly by vPCI.

> > This also makes me wonder why they have to be added to the IOMMU, is
> > that related to device groups and the fact that Xen is not clever
> > enough to figure whether devices belong to the same IOMMU group and
> > thus must be assigned together?
> 
> I'm actually not sure whether they need to be added to the IOMMU.
> With multi-function devices in mind, back at the time I though it
> would make more sense that way. But I may have been wrong, and
> hence we may want to revisit this. Problem with such changes is
> that they may cause rare issues on very specific systems, which we
> may have no way noticing even during a full release cycle.

I guess it depends on whether the device is to be used by dom0, see
my question above about ehci-dbgp for example.

Thanks, Roger.

