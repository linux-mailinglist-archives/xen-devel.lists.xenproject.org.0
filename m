Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2FE43B539
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 17:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216485.376114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfO8J-0003fY-Iz; Tue, 26 Oct 2021 15:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216485.376114; Tue, 26 Oct 2021 15:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfO8J-0003d0-Ex; Tue, 26 Oct 2021 15:12:59 +0000
Received: by outflank-mailman (input) for mailman id 216485;
 Tue, 26 Oct 2021 15:12:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0pl=PO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfO8I-0003cu-8X
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 15:12:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 329162be-366f-11ec-8434-12813bfff9fa;
 Tue, 26 Oct 2021 15:12:56 +0000 (UTC)
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
X-Inumbo-ID: 329162be-366f-11ec-8434-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635261176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=+xnslZQGsSNnOetL2xCHxv3OHja0pt4Qnqe7WDXaqks=;
  b=M8R88nsqFcAs/Fzp1RELetM4rgmypuJKl2SlrozPwLsEswNXwqs+Ogq/
   mG8B9M00jdJfg5kwAVYmT+is19B6P3HVzYYg21muRjt66Rj0PalXHI7Kv
   tTkDxr674M8IFH2mtaAEQ6o8a0DWyH5fRGocZahO9R26YmquG//bKGCwZ
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AunLTUCF7wooD42Hyc5vxgng4D8++FjVQKvc6nTwP1+ss3TwqLw9kqcoGH+2VAtLcubmh+1onw
 ypCbI7ixzUhnHIpmh6WzMRAlkkQxwHiwIaAnowTK5MH1eRrkYai+iNFHmXBomOY0/3iptl84t7
 43vGc6/p5fsOFat33FFOBJN7Y0sbkZ40oxMz7trzWCLmISLqxN8EAwsA2gqNnAqsPrRRwnRkRz
 zU6zxN8RrKS+1L1PtA0lyzLOVwbweoEA97jg6vJSHrLXeuRQj5JFFQEAoFIY1LUi3Sz5c/vAJi
 2A7aNiK6x1aMFFqYlMOKjSJF
X-SBRS: 5.1
X-MesageID: 56108758
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RAvE0Kjafct+xj4M3GJbTr2EX161thcKZh0ujC45NGQN5FlHY01je
 htvDTyDbPyDMWegKo0gbd619xgBu5OBm9NqTlRvqCw0Eykb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Yy34Dia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1U6JufSC0bEZb8nac9cD56UC1cM/xvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2JkWTamDN
 6L1bxJkTwnjXEMRIWtMBYkmtuGxpmDQLidh/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDM8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalgdBXPVROd8V0zGIiYr3xCTaCkoKHxcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNKdTFaNEfoWSNAuoO5+Nhi0XojW/46SPbt5uAZDw0c1
 NxjQMIWvL4UkdIQn5uy+VTKklpATbCYE1ZruG07so+jhz6VhbJJhaT0tjA3Dt4ade51q2VtW
 1Bfw6CjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sNuWEufRY4YpdVEdMMX
 KM0kVgJjKK/wVPwNfMnC25PI51ypUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4FZ5fWkk4EALOlCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnjMqOB4Fag13DBNyuQbXVvNOHmUZpl9CppNi0wJ1e4nXMkZN/3vqsYcpI2e5gh9fBikqEoH
 6VUJZ3YD6QdUCnD9hQccYL58N5oeiO0iF/cJCGiejU+IcJtHlSb5t/+cwLz3yASFS7r59Amq
 rit21qDE5oOTghvFujMb/erww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSU+t076tjEg6yAvryFKeomExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6taz9b9XygNoQCfCY1ixU+4yJ3CH2Y9Et7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZymvI8PA4AETm/ysmrrOIXHJbMwSIlCEAfqB+N5kow
 Lt5tcMbg+BlZsHG7jpSYvhoylmx
IronPort-HdrOrdr: A9a23:fffZearYgUDiGTbvvj+R4kgaV5u3L9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBThHPlOkPYs1NaZLXXbUQ6TTb2KgrGSugEIdxeOk9K1kJ
 0QCZSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IWuvEuFDzsaFp2Ihz0JezpzeXcGIjWua6BJcK
 Z1saF81kSdkDksH4mGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 f4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRoXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqqneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpj1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYDhDc5tABGnhk3izyxSKITGZAV2Iv7GeDlNhiWt6UkUoJgjpHFog/D2nR87hdsAotd/lq
 L5259T5cRzp/ktHNRA7dc6MLmK41P2MGbx2RqpUC/a/YE8SjnwQs3Mkf8IDN/DQu1+8HJ1ou
 WZbG9l
X-IronPort-AV: E=Sophos;i="5.87,184,1631592000"; 
   d="scan'208";a="56108758"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8FrI25K6VN7YawKz6Aypq3Q3prGB1ftbqs41JojcenYdl7nPa7xjTlckLJo2LARtLwlGIk6XBDgfvQ7I36fBxV2qXAJGPwZoWYS1VSjKp1BIn4xjZAx5m6anaVDMNEQN/5PlmBL4sfdn+QizyTKD4FjFNBaGtP6fe8LvHR+GS9t/x+urDeLb+oveSwH6gAgy+QLthS9T1bgVZApFNW6LeZeSBGSVK85UVR8etYtAVmuORSLqfp9EfPba5GLgjtzLifUugHqwws6ADVk5XgHKEk0EkPqSixHE5olzZf1svi1GPHKL1HMsmqqNa5/KLLwU7dcQqAeDg3evrggmQjx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPWJh6qs7ggJoWdqKmPe85QWZtBPoSDuYY1GiEa4V8U=;
 b=jgVuFlKMfIWi2zi2Nw9qGSo4hauztSk/J05F58arQMzg4lMp1UkUrtWdDTpHdHqGK7nTJL5rHZvDBaiXMRp3LB6cp9n7dm4nzQfUtTgLkjW93ZuZrS+AYfyebEteG2T+6SCTclW+2/7DEA3Sw0Upa43oiev3/J8qLs8IXL08/yUb1ouWb90xKk5du/N60N3XxYBcqo+uAa4sVJyGY8qzZcTfhZZ+OI7HzAnzt396bOGCm955yQNCXOAbcaWg4TynxwBosoebjYxGse5DyeDBA3+fO8euvmzSLJawLFV1g+7mnx/n0taLujrgzOeSF3lJtEf4uNvZTMdD1r2JfKo5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPWJh6qs7ggJoWdqKmPe85QWZtBPoSDuYY1GiEa4V8U=;
 b=rcPba+XylS6Oo/oJMOdT3rJOcPRJpVUebxgdMervTeQj122Nw5DMmRufHgUJUjMM14+ZOuOA5j7M+gJ3v6PP6HMH9loyImOrOOQtyKxFND2TN1hypQqmZX11Tuf1Ab+1VIvTraFfOSv2wFWQTq11+kD5J1etkWUe/BTFbnZFpJ8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hpet: setup HPET even when disabled due to stopping in deep C states
Date: Tue, 26 Oct 2021 17:12:33 +0200
Message-ID: <20211026151233.57246-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <68352fc1-9ba0-1081-be50-065b212f96a3@citrix.com>
References: <68352fc1-9ba0-1081-be50-065b212f96a3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4841d98-48a1-4fdf-d776-08d9989314b6
X-MS-TrafficTypeDiagnostic: DM5PR03MB2716:
X-Microsoft-Antispam-PRVS: <DM5PR03MB27162BCD9AB6A64CF335AE718F849@DM5PR03MB2716.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZKYq2GHo1eRt6jeo+9CJEm8juqo1ZoKTGC78nNZAaZIDmK2rqsUNtJLNbV8Okm3Zv6Q5x1uJfOhGZK+gA99w+jBTKNmu55pKHxra3lIAXau4kg32AYsAShHj1B/t9pfJBXX8QLpHFoNfKmYGqHoEkVLB92izf663hu/zv83dH1odWLUA9Ye/hh9J6aDDN/aIsQTDxv267sQGAGCrLBfexp0f9nJg062F+NICBo7EhJUYRXL2gjAp2WsRQ5z/e1VdGUJPUSsNQ7yuNtpbmPxyp/GzWKvSPgT/YdDk/3XyM9r7GGq869V6md4vv8vd2UVEmgWA+qCsZaA6oamYcJ2u6aqLr/vtMIJB8oXq0Vn2oQfQasY8VpbjBRviP9siDBHxLJQDlfJZEkbVMpR7gKOxsDBZE5CpKSVRxmPWszsNm+pl23DA+4TDncE9rdPxbNiughpFfthrvMQ3zZkUnCx1OEMwIG2rc/5LMiaaSCxyPZgO3fLY2dPsBYJ+z/QJSZ71p3zWIx3i5yJwek3X8A3TY43ND3atBUAHdtv1NX5/CNcZSvXRrvq4DYupL+MVOa3lHhU77Z/Y4ykMaOcwqbhg6endoWmWq21JOqEgVQYOur71KB763aWL0sgg2rrkxLpd88pEP7UaXLk+441xh27sUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(83380400001)(6666004)(66476007)(66556008)(2906002)(5660300002)(2616005)(66946007)(54906003)(4326008)(38100700002)(36756003)(316002)(1076003)(508600001)(82960400001)(8676002)(6496006)(86362001)(26005)(8936002)(186003)(6486002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXpXRGdMclV0NVhCQklqODVGR1ZKeHN4OFBPT1Vycm9JNUZRNWticEpWaVRH?=
 =?utf-8?B?WnVQNm5ISlMzRldCR0VDRlpJR041SXNBek0ycTJ4OWtUOHZjblZ5Rlh4R2gr?=
 =?utf-8?B?ZzdYWmFJVnZXNk5hZllZNXBRSDZrdmdZU2l4b09TVG1ZRTdFcEhVWGVrRTdX?=
 =?utf-8?B?V21UZ0R6T3NxRTU1Mk52WnVTRnlHWERVa0hEVlhhVGdUdWlaZjRJSHUxZmRj?=
 =?utf-8?B?RlRITkJCVyszY2l3OTgrRnFWaEs1RFVOaHBLenN2ZFd0WE1KRExLUlcwbm93?=
 =?utf-8?B?Znp3SXhqLzZSelNnUjk2bmdDSW9KZmVpUCtZRnBaSGViWmVlQm43NWdYOGlt?=
 =?utf-8?B?MFppZUFjRk5XZ0d1SG9FaVZ0Q203Sy81ZHc3WTdNQXRWQklFNzlyV1lvVnhm?=
 =?utf-8?B?enJ6Q0Fhc2ROUVpoeUhPQk9sNUw4S0h6azhKWURUbDg4R2FiZVQ0S1VkYnl1?=
 =?utf-8?B?Mko2a3VLMWdXa0VNTVVydUd4ZWpJNVNmSkg0Vnd2cHJ1dzNBcDFVNzlQWHhj?=
 =?utf-8?B?dFZlUm81OVl6SjNOWWQ2bXZKMndHZVQ1WmlsRG5pTU9rODNsTXoxd0J4Wklm?=
 =?utf-8?B?Z2ltRFFTZE1NelU3Z1B6d2JjZ0QvYkhsWE01TkRXbmR5S2xzeXN0WTB1Rnpj?=
 =?utf-8?B?WlQrdkw2T0RkZXpQcVMrTC9SbTk0cXZPSzhXalNTd3drOUVPck5kUCtDYXZm?=
 =?utf-8?B?cUN3SmpYNVRYWUN5ZHBJNnB2blBKdHRQb0k3TDNQL2EzL0FOeDh5b0Mvdjgz?=
 =?utf-8?B?Mm9DTXVlR2JEZWRZVGFpZjAvTjBZV0Jqb2NGZDFCRGFGYmFUaUh2dVk4cUpW?=
 =?utf-8?B?elArZm02SW1uYTB1WWJ6TjZiSlllMERFa29wWDhyOS9tbUsrWWxJTS9md1Bx?=
 =?utf-8?B?cFVYTjBkT01tOVdKVDdPQTZ3cFU2Qk1NdXFiWVpoWi9RK2NWcmVRVlFBQmgy?=
 =?utf-8?B?ZS9IZEQxTi9PNEI5Q3VsVk1oZFlUQjNZazlkOGdmRlZmaGFCbEh4QjJ4Zm9Q?=
 =?utf-8?B?RUdUZFVRQmVrdUVYT0U5ckxiU2tLZE5nbzArUndPa1BqbnhYMFFRMjFQMFFX?=
 =?utf-8?B?Si9KOWhhd0JSYnJmUGVqK3pMVGx2QXJyZGcyV1d4Skh2L3pkNXhmK25QSmNP?=
 =?utf-8?B?ZXB6UVpFU3lvM0Q2NjBMeUxYZ3FEcy9XV2J5c2VSdzdNY3BIY3c5SHlaeDJa?=
 =?utf-8?B?dVNpSHQrSy9QWGkxM1NhdnJhMjdVc0dWMU55R2hDeWpuZHFFK1pzYU5SanBW?=
 =?utf-8?B?R0lFUk1aSDRYNzhIN1l6M2s5aGRIVDFzUitXOEJoelJKMDlTUy9IcmlxYmZq?=
 =?utf-8?B?bk1Rem1aSE5CVGIwaEJQdDZpQ3NGTEI3d0Rod3NkdWVLQXI1NXh5SndLb0RN?=
 =?utf-8?B?NnZnc1huNmNXYjk0ZWt2enlhc0VJL3NwWWg0OThvTzZ2Z1VVVm1JRkdua1d0?=
 =?utf-8?B?SjQvS1hXbWV5QUNPMENSaDRCZVFLcGtXZFlybmY0VW5KNlQ5NXFya0hnMjl2?=
 =?utf-8?B?bWtUVmozQVJQbXd1cFhXdU9CM214WENEUEk0d003NlluZUdTMXpCSTk4ZEVo?=
 =?utf-8?B?MU5qRVhxUmZZWHk4d0xnOHpmTHY1K1NqU2RXbFpIUUdBdWsxbVB6dkloYlZr?=
 =?utf-8?B?bTgwcERNdFFjY2txNXByRlBHN3BXZlBVYkFEQnUyTTl1eEQ3Y1FPc0Fqck8w?=
 =?utf-8?B?K0tPVmZqNGtnc2h1akpvRjlSR0NDTUlNbEJlbGhqUzF0Yk1wQkVHSzNqM3di?=
 =?utf-8?B?TzFlc01IN3lvdmhWbHduY3N6TXhGUDJ1b0NGOC8wTWJ4SFY1QUVQRTB5anho?=
 =?utf-8?B?ZDBvdDRZUzFQKy9jVXZaaTFJbVZBcXc2YUxlWWNKd1o3SGVLWkZDdGNWTVpo?=
 =?utf-8?B?emoyMjBoQ0J2UFc5aVFwRURIaXFEVFNvclJWUEd0R3hXZjF4WmpjVGwvaHpY?=
 =?utf-8?B?TFlhZzVoQXNwZXFRV3VJS2hMSWtka0pTYVVxa0pTWHNFdmZiZ3lwTFd1SVdY?=
 =?utf-8?B?bmNLV25zQjVad0FmZGRRWlRPTW44VWd3WXA0Wk1lakc2L3dCNnFFK0pGak5Z?=
 =?utf-8?B?ZUh1c3dyV3dWaDFhOXc2R1JYOURaME1qTW5oMndONGxjNDh2NFg4OWVyWnpu?=
 =?utf-8?B?d2RibWV1N000Ymo2bThRMnNvK0llbHFhejJrR2thaDR0MXh4MkJpMUswb3Fq?=
 =?utf-8?Q?yP9vFiFzlrMuLhrTETbcsPk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4841d98-48a1-4fdf-d776-08d9989314b6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 15:12:52.6898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoKFnl9NUdvRz5lPPxPho3gL4sx+CbR2IyMR4h1bs4VAiGAnhS/soRSG2+MXGT/9f40lTRwTEzy1GJF3BLXW1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2716
X-OriginatorOrg: citrix.com

Always allow the HPET to be setup, but don't report a frequency back
to the platform time source probe in order to avoid it from being
selected as a valid timer if it's not usable.

Doing the setup even when not intended to be used as a platform timer
is required so that is can be used in legacy replacement mode in order
to assert the IO-APIC is capable of receiving interrupts.

Fixes: c12731493a ('x86/hpet: Use another crystalball to evaluate HPET usability')
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/time.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index cbadaa036f..a290aba3e8 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -379,6 +379,12 @@ static int64_t __init init_hpet(struct platform_timesource *pts)
 {
     uint64_t hpet_rate, start;
     uint32_t count, target;
+    /*
+     * Allow HPET to be setup, but report a frequency of 0 so it's not selected
+     * as a timer source. This is required so it can be used in legacy
+     * replacement mode in check_timer.
+     */
+    bool disable_hpet = false;
 
     if ( hpet_address && strcmp(opt_clocksource, pts->id) &&
          cpuidle_using_deep_cstate() )
@@ -391,7 +397,7 @@ static int64_t __init init_hpet(struct platform_timesource *pts)
             case 0x0f1c:
             /* HPET on Cherry Trail platforms will halt in deep C states. */
             case 0x229c:
-                hpet_address = 0;
+                disable_hpet = true;
                 break;
             }
 
@@ -431,14 +437,14 @@ static int64_t __init init_hpet(struct platform_timesource *pts)
             else if ( !strcmp(opt_clocksource, pts->id) )
                 printk("HPET use requested via command line, but dysfunctional in PC10\n");
             else
-                hpet_address = 0;
+                disable_hpet = true;
         }
 
-        if ( !hpet_address )
+        if ( disable_hpet )
             printk("Disabling HPET for being unreliable\n");
     }
 
-    if ( (hpet_rate = hpet_setup()) == 0 )
+    if ( (hpet_rate = hpet_setup()) == 0 || disable_hpet )
         return 0;
 
     pts->frequency = hpet_rate;
-- 
2.33.0


