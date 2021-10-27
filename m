Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C0543CA88
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 15:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216967.376778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfiuY-00079k-E1; Wed, 27 Oct 2021 13:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216967.376778; Wed, 27 Oct 2021 13:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfiuY-00077w-AV; Wed, 27 Oct 2021 13:24:10 +0000
Received: by outflank-mailman (input) for mailman id 216967;
 Wed, 27 Oct 2021 13:24:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ie0f=PP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfiuW-00077f-I7
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 13:24:08 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 293f06a2-3729-11ec-8460-12813bfff9fa;
 Wed, 27 Oct 2021 13:24:07 +0000 (UTC)
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
X-Inumbo-ID: 293f06a2-3729-11ec-8460-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635341047;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Zb6gF6I6P83yeH5HqUgwwsMR5qHmEktyMPeulOHwFBM=;
  b=D0wF6zox/E4+XJxEHGb0vKGHSoiUzBvH6VDUeLEMzIofqj7d8ZmkMdzW
   XRWVA7RjpfTKBd7e5xaX2jXuG8x4bN/AO9qTXxIvP/YS4EAhOejxjpvQi
   xpdhPBMA1cibxlvSMj3ZFahBoccgvljrHmAY9WcocvAzfA5OA5xOa2QjW
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cFF7Sw0Y+xlXo8KFiY59jOI52ASDPfYXUmhB+92C0sA9Rof9E6QF6ACalXsC7B/EXoFS09Zmzp
 /5m+x3aMVEQjlSbmI3M6J+1X78acoMm0UGHyMa/V1RDH+QWKKhlvQSgHRL+CeK08mQ6MxI0ETl
 nvhnIWfvJqEaqNTQmZIIvyQYUvlrhDNP4/GK/AAENZuxR17ZB6UDk3HJUfKjFa9SRrU/VYX0fW
 H35iP6eaBWPvmf3hH+yDwNPDjYK34bFretcOXS1VAfDA1ax9KzBCN2f12VQ2lx81yt0k6ul9SA
 qar3zus8nYrzXumcM7fRCsLW
X-SBRS: 5.1
X-MesageID: 56354113
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZNMCUKKotycgjmLzFE+Ry5MlxSXFcZb7ZxGr2PjKsXjdYENS1TQBx
 2BNWz2FaPiOY2umLt10b4zk/RgFvZLQm4NlQQJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eo5xLZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Thvoh5
 NpDkaetagsQZ7HOnsVBXklXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Xu4QFgG5p3aiiG96FO
 5EHdyA3Ry7sRBxvNHg8OatlzP6n0yyXnzpw9wvO+PtfD3Lo5CVrzLXoB//EddWLSNt9k16Ro
 yTN+GGRKi8dMNuT2D+U6EWGj+XEnT74cI8KHbj+/flv6HWRzGEODBwdVXOgvOK0zEW5Xrp3M
 UUU5y5otqk0+0yDR8P4GRa/pRastBMGR8BZFeF87QiX07fV+C6QHG1CRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BUgGaCwfRA0J+e7Kpo0pkwnPRdZuFq2yptDtEDS2y
 DePxAA8mrESgMgjx6i9u1fdjFqEgZzETRU84AnNaV609QNyZIOjZIuA5EDS6LBLK4PxZkKao
 HEOlsya7eYPJZKAjiqARKMKBr7B2hqeGGSC2xg1RcBnrmnzvS74FWxN3N1gDF1wGJYodjHNW
 1LwtToI+J1VHSenPaAiNupdFP8W5aTnEN3kUNXdYdxPfoV9eWe7wc1+WaKD9zuyyBZ0wMnTL
 b/eKJz2VS9LVsyL2RLvH79FuYLH0BzS0o86qXrT9B+gzaaFLECcTbMIITNihchosfva/m05H
 ztZXvZmKimzssWiPUE7EqZJdDjmyETX47is86S7kcbYe2Jb9JkJUaO5/F/YU9UNc15pvunJ5
 GqhfURT1UDyg3bKQS3TNCs+Muy0Dcwn9CpmVcDJAbpO8yJ7CWpIxPxGH6bbgJF9rLAzpRKKZ
 6BdEyl/Phi/YmueoGlMBXUMhIdjaA6qlWqz09mNO1ACk2pbb1WRoLfMJ1K3nAFXV3bfnZZu8
 tWIi1KAKbJeFlsKMSojQK/2p79HlSNGw7wasoqhCoQ7RXgAB6AwdHOo3q5tephdQfgBrxPDv
 zur7d4jjbCli6c+8cXThLDCqIGsEuBkGVFdEXWd5rGzXRQ2NEL5qWOZeOrXLz3bSk3u/6CuO
 bdcw/3maaVVl1dWqYtsVb1syPtmtdfoorZbyCViHWnKMAv3Wu8xfCHe0JkdrLBJy59YpRCyB
 hCF9O5FNOjbI8jiClMQelYoN7zRyfEOlzDOxv0pO0GmtjRv9b+KXBwKbRmBgSBQNpVvN4Yhz
 btzscIa8VXn2BErLsyHnmZf8GHVdi4MVKAut5c7Bo73i1V0lgEeMMKEUiKvucOBcdRBNEUuM
 wS4vquaiuQO3FfGfloyCWPJgbhXi6MRtU0Y11QFPVmIxIbI36dlwB1L/D0rZQ1J1REbgflrM
 21mOkApd6WD+zBk2JpKU2y2QlwTARSY/gr6ykcTlX2fRE6tDzSfIGo4MOeL3UYY72MDIWQLo
 ODGkD7oAWTwYcX8/iouQko0+fXsQOt4+hDGhM36Td+OGIM3YGa9j6KjDYbSR8AL3S/laJX7m
 NRX
IronPort-HdrOrdr: A9a23:DdPkoak37+x2fxnKLPdkQXMHM8DpDfO2imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIGtFdBkVCe36m+yVNNXd77PECZf
 yhD6R81l6dkSN9VLXFOpBJZZmIm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTuj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZsA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQvZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv0nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLVU5nghBgt/DWQZAVwIv/fKXJy//B9kgIm00yR9nFohPD2xRw7hdYAo5ot3Z
 WzDk0nrsAIciYsV9MOOA42e7rBNoX8e2O+DIusGyWTKEgmAQOEl3el2sR/2AmVEKZ4uKfa3q
 6xFm9liQ==
X-IronPort-AV: E=Sophos;i="5.87,186,1631592000"; 
   d="scan'208";a="56354113"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcN3noz0xxnCv1Hrh7HDDEwAucWOXw8Ysg6BbRkC+LUQsDsKGGPWii8enJOKx8IqX2ZGqt+7g0cUopeeUnRDIRw5yM2KcqoZQ8LSwkoU9TqGCJEaToZrSr/t5ecZA0c6II/P1aKvpEa1VAYZlVqqDOqSqBmtNEcCOmX4yKmVFnuJ59tOz7fBEiup5w1harB9aDVfhbPp8g0wtvtmYfB39PPvByaTsEZ8THRtvbHRlnRJcy7smwIRIeOP6yfjdn02eBgtoBMFW5wuDff4KzK9Q93RnkW/q5bgl4NhKPLdfOJq1/FG5/VR0TKPt3Q/G6NRs3apqcivvdfZRun2pAFeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JE5xfLqvEgTX7DCAiYY1bVSPmz+g5/It3HNMaqoeK28=;
 b=dQkSJXZeCUf/WarlFvJztbwO7K/m2ExTTOOTiolG07dOyTYUXYPVKKtoF8hXCp8ExqIsbTYSCfn6U9XYMM4BK7I1qeRv+J5QYdD5LPfDpImlwIezo5XNuRVKUrauEOEQM+lqd/eHuSIfPGG2VvhKiPK8XEwTSR5ldffKmDLZTyTVmj5Om1l/pHRi9BL6+Tc8/PSvrUBeokYPw4YgLc0ssDRtSq8jcwTsVczApzotFSZ8884kHqbi3neXbEW1E5RG/lZmharLUcLii+UKjxKxZEFKjX6Grre/R+NPilHY4p9OAD/XDGa9bAQbnedppIP9NGnwARo5bZseypqYW3Hvkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JE5xfLqvEgTX7DCAiYY1bVSPmz+g5/It3HNMaqoeK28=;
 b=TdMQboZ/I74CAcyOyS1SVzAzwzV04XFLUH+l+Kp4b1BzAvPtuoYCqqM0VSELCwzRLlwrtaSHWKBtOXAACpIGNkY+LccS39uX/kO58ENX2BVqUn2mu4SAZed+NP9uOa2EWH3VwMdOGoULuk5Ubd6viAvwP1OnpXkai+YP+MRGTek=
Date: Wed, 27 Oct 2021 15:23:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Move register assignments from
 init_bars
Message-ID: <YXlS68Ghrphi5dHB@Air-de-Roger>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-4-andr2000@gmail.com>
 <YWbkZ216FbV8lBns@MacBook-Air-de-Roger.local>
 <89e1f09e-c840-860e-e596-38fb141aa707@epam.com>
 <344cf880-8f76-1a71-d27c-e7ba10459d5b@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <344cf880-8f76-1a71-d27c-e7ba10459d5b@epam.com>
X-ClientProxiedBy: MR2P264CA0018.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7509a0c-e10f-462e-328c-08d9994d0a9c
X-MS-TrafficTypeDiagnostic: DM6PR03MB3945:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3945DF5D8680941CC6E27DB18F859@DM6PR03MB3945.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wpdq+j8d6/OBoNKaJs7f2dJ2g3OopKanH4yJOzR7XcKcPivTSKhwwVV2i2WVPh/csREixIlBHvpqXGUK32ERIZ9zLoTxE3Q1oCaAGMHImGtaaXAW70AG4NsunzYsYNOdmGqUr85mOTkkUvMFBTFjHH9RvNE+0hHYy8U74QxieELIisQTKKPbDN6LpC+vChCqaIEfe+bp6mX5GuOXoCyb/RaA3FmpyjY1byh5awKaSgr+HJD9HES2fwGCK8MWHktWKrFcTHEXnJX/esMxXqgoJ1EsQT2OfNkPb/CwtdK2h4htBIZurzEeqwlK/9W/+JfszUsd+l4IFBkd7dGQ7a4MuBw/XyWJEKBnVoCmnwvpvVX0KLfX93RbmN5Ft5rppQRFfymaHl4mcpwSLzAnWkJbW6g5/5Q6hwVFHwqSj0oZC2qAThTsIiT0ZHH9o609fAkKt585hqcBNarx5H4ZSHlGFA6G3cTKOaJCDoXFf7VOfbNf6X6+zLo7C22yWbJLmhYYdmm7oqgimBCCAwdrFolVeK1Oum2HeulhzsEcirDyQHmTgqHTp4qsawRz03go4nh6cFzxs3bf/1Sk/mZ1gtqtt77IgVO9d59ty72P81AjG3MiXIx/P6cefj3QHl1wpdPSBw+x/IuuTNDfby0QI00ALA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(26005)(956004)(66556008)(5660300002)(82960400001)(2906002)(508600001)(33716001)(316002)(66946007)(83380400001)(54906003)(4326008)(53546011)(6666004)(66476007)(38100700002)(9686003)(186003)(6486002)(7416002)(86362001)(8936002)(8676002)(6496006)(6916009)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGNOUnlyZEhkeFQwVlk2UmtxTmJnM3JGTWJUSjZaMVFrbkF0d2hUdCs2UzVv?=
 =?utf-8?B?RzRzKzZDM0JHZFI0OUR6V2FkRWtodllPWjM5MEVyVGJCSEhSSWU3NTRkeFQ5?=
 =?utf-8?B?Z215RFZCc3VvMC9wMWlIS01ZcmJLV2hmZjNpNUkvV1FYMTVGWUdiZEVpV0t2?=
 =?utf-8?B?emtQR2xhMSt3WE11L1B5eU5KM0ZneFVVSFFXcHVVZEV3aktTakJ1aFlhanYy?=
 =?utf-8?B?SUlNV2VyTXVqZ0J0NTRtOUgrL0xmSEVsTU9xOUhvMW1zL2E3OWc5aEcySExy?=
 =?utf-8?B?YnUxeXhmUmRsb2dMSHd2RElHaURMTEhYeVdYYWgwdXVtenB4QWdVaGVKNkM2?=
 =?utf-8?B?ZjJlbHlsOHRJb2V3b2E4TkhQQjRIMlNQa0M5STVYb1lEOWoxSkFvNVIraTl6?=
 =?utf-8?B?azhWdHc1MzdHd3U3OTJpWU90NEpBQUR6Q1lnTnFENVEyeEovQ2JlaUZDVE1L?=
 =?utf-8?B?YTJzRG02Rlg4MUlDU2ZKdzJYcFZVekJ2U3pQS1VoYjFxZ3BXRG5IYWNkUFB2?=
 =?utf-8?B?SExtOXY0b1VvQTJwcUhaVjZOZzl6ZE91VnZFRTlaWllSZ2kzai9VM0UxK0ha?=
 =?utf-8?B?SlZFNHdqOHZVakRWUkozRk1waVE4K1Y4dVY3Q2Z3YjFVWnpNQ3dyOTQyVXJp?=
 =?utf-8?B?b1ZKL3ZnUjRjYllJZ3Y0a0c0M2syT1N1eUNuOFlmV0paSzhhQ1lxZ0dkZ1V4?=
 =?utf-8?B?aXR0cUZPb0E3TU4xNDJoV1Fsc0RNd1JRa3RmSEw0TnYvTGVrWlBIZzRZb3NB?=
 =?utf-8?B?dlFiYXZERmFCRnlVajJJOUNtSWtROGFydDdsa3krT0p6bTNJNTdBN0VhSjY1?=
 =?utf-8?B?czFMZmRpSmlLSGkrRS83OHN0S0ZDZHF5a1BCNDJDTXVWTWwyRG9hWDZMNElo?=
 =?utf-8?B?V0tqZ2dBMGRmYnpvejJ3eGtMTmZTVVZqZmUvZEdRS05RaG5ZOUVFZmJ2Rmkw?=
 =?utf-8?B?VFZCRW96Y3V5OTFaRVhjUFRNL2FrNVdPY1VSeUpFbFgzVEpRRlAzZHQwc2pj?=
 =?utf-8?B?WHp1MWNlSktxUlpSRlVTT0R3N0RBamxWS1kzQVhIT1FjLzczUWhLSVhXRkFz?=
 =?utf-8?B?ZHovWkY4emd4SVhXSExyb2xsb1NtWjJDRVFvanFsT0krVDRjTE0vdVYxL3Jl?=
 =?utf-8?B?b3NsUFRveUE2TWNzeDI0ektYM0ZabzFnTmQxWDJHZHRhMW1nUXRsMVpqd2Mz?=
 =?utf-8?B?Qm5RVHN3d3h2ejB0dU5TYVp5Nlgzamp3dmtGeFlrSFZ1QWMwbkJobGtvQTRy?=
 =?utf-8?B?M0trRFdiQndMNWlBZGZvY05DYm9HZ2haYVFMV0prdUJsUFd1L2Y1MWZrclpS?=
 =?utf-8?B?VDQxa3hTY3RLTmN4N1BPMzZkeUJoejJrWm5oTm9EbGR5bENXMXh0bDhMb3Fn?=
 =?utf-8?B?OUhEUHdZcHJ3TEpWN1h3cWhWeHR3MDVLTGcvS1RLZzJLQXNOUnRQQlJJQmNI?=
 =?utf-8?B?K3BjQjJZMUVmVndwVDIyV1JUMW1yRUlacnlaaHZLR1Y0c1NSVHNTenRLYmI1?=
 =?utf-8?B?Vk1yeVBRVVk2anNFNjNHa2VEcnVMWDlvZmdnUDJhSDBtVlArUUFRVW5sdkhY?=
 =?utf-8?B?Q1pDbVc2ZmhrK2RtRjRyNDBXa2hSWWpKMGJ0QlJUNEtoVGVMbG9HeWVEbnBt?=
 =?utf-8?B?WXBxSFJ2QUZZWUNoejREa2N6WkhQTy9mbThVUGxKK25OaHROSFZTUmE4NUFs?=
 =?utf-8?B?aXZwMGNqcmxoSkdTemMyQ2hTa3Irc0dSUzcrMy9iU08vYnNybVJtSFR5TGFh?=
 =?utf-8?B?cGRpYWUrZlFwZjhFVCtPbTBFMS9wVUVwbDNOY2hiSG95VVg4VUt4TWtITC9o?=
 =?utf-8?B?bzVRcVFIWTV0VkxwYnpobVVaK1I2dDVTa0ZVaHd3Y2N4QTdNd0xJMUQxeDFr?=
 =?utf-8?B?ZWRCUHRzVVN6RjJqdnowODVzRi8rckplS3BjT21WRk05ZVhaUGY5anBUUkJQ?=
 =?utf-8?B?UEFXUGE2dWM1NmxGQ29mTkxocFFJQi96ZVk4TVR5Vlp1eTBLMWNoSFdyMUto?=
 =?utf-8?B?OXR1a0lJVnYvSS9oeXZjYWlkbzhDb3pSOUI1ZGxGa0V2bnhZR0MvemU4SUtO?=
 =?utf-8?B?WEZWbU5lYjVqSU53cm1xbXM2a2xDU3ErQVlpazNNWW5GYjFJRmt2SUlQbUZk?=
 =?utf-8?B?S240MFRWR21nRXZ4b1krNkNId2d5cFFHMU9JNm9mT2xJTUZCOGVlN3ZxWkFz?=
 =?utf-8?Q?iKukowtXMgZ7m1Q+rOsFN4k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7509a0c-e10f-462e-328c-08d9994d0a9c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 13:24:02.2620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WB5eHisXo9Gp5AtZqS9PDwXdX9aMHL4Q3iJcSGk+YCHW9rge/BJDzBPPJotdnUn89qEH4UaSgJ5kjEucSni8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3945
X-OriginatorOrg: citrix.com

On Wed, Oct 27, 2021 at 11:59:47AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger!
> 
> On 27.10.21 13:17, Oleksandr Andrushchenko wrote:
> > Hi, Roger!
> >
> > On 13.10.21 16:51, Roger Pau Monné wrote:
> >> On Thu, Sep 30, 2021 at 10:52:15AM +0300, Oleksandr Andrushchenko wrote:
> >>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>
> >>> This is in preparation for dynamic assignment of the vPCI register
> >>> handlers depending on the domain: hwdom or guest.
> >>> The need for this step is that it is easier to have all related functionality
> >>> put at one place. When the subsequent patches add decisions on which
> >>> handlers to install, e.g. hwdom or guest handlers, then this is easily
> >>> achievable.
> >> Won't it be possible to select the handlers to install in init_bars
> >> itself?
> > It is possible
> >> Splitting it like that means you need to iterate over the numbers of
> >> BARs twice (one in add_bar_handlers and one in init_bars), which makes
> >> it more likely to introduce errors or divergences.
> >>
> >> Decoupling the filling of vpci_bar data with setting the handlers
> >> seems slightly confusing.
> > Ok, I won't introduce add_bar_handlers, thus rendering this patch useless.
> > I'll drop it and re-work the upcoming patches with this respect
> On the other hand after thinking a bit more.
> What actually init_bars do?
> 1. Runs once per each pdev (__init?)
> 2. Sizes the BARs and detects their type, sets up pdev->vpci->header BAR values
> 3. Adds register handlers.
> 
> For DomU we only need 3), so we can setup guest handlers.

I think you assume that there will always be a hardware domain with
vPCI enabled that will get the device assigned and thus init_bars will
be executed prior to assigning to a domU.

But what about dom0less, or when using a classic PV dom0? In that case
the device won't get assigned to a hardware domain with vPCI support,
so the vpci structure won't be allocated or filled, and hence
init_bars would have to be executed when assigning to a domU.

Thanks, Roger.

