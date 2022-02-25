Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B14D4C4BB4
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 18:12:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279549.477284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNe8j-0004ws-NO; Fri, 25 Feb 2022 17:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279549.477284; Fri, 25 Feb 2022 17:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNe8j-0004tO-Jn; Fri, 25 Feb 2022 17:12:21 +0000
Received: by outflank-mailman (input) for mailman id 279549;
 Fri, 25 Feb 2022 17:12:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZUh1=TI=citrix.com=prvs=04827bf5e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nNe8i-0004tF-CV
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 17:12:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 154aa887-965e-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 18:12:18 +0100 (CET)
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
X-Inumbo-ID: 154aa887-965e-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645809138;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=x/GdCrGTBYXVKADzhTOUA4HbsusNoi9AZZ+DqQY6uWA=;
  b=XZgDvsFIh/6PLvEWwtN8X8ECBkqNEyvvwaCe/ZMloAfaYtTmXKUBm8Oz
   sOa6CXAWiGHEvKI2VJbn1YxK6yqMkx02ihES2Rq+Ueluj1MwL0geXBaOi
   scstJ2PawgBeWec5G5WqvgPLEnCnsTFRGkGUFxCcNNRg1zQPUcsOvJCAv
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65009921
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mthBEKmratUbZwjVRMRYaqro5gx6JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLWm+EPP3eZmSjeNF+ao/g/BwBuMPQy9dhHQtu/ns0FSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DjWV7V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYbQZqbvzBxvshCRgFGCtifpVG/bXtLi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHNGI3PUWaOnWjPH9MKbwCzfXwuEPzcgVUuFWNlIsT3UfqmVkZPL/Fb4OOJ43iqd9utkKfq
 WXL5Xj5AxcXLoW3kGTetHmrg4fnmCrhXYsIGb6Q9/h0gUaSzGgeFB0XU1SgpfCzzEW5Xrp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmOx7TV5UCFB2ECZj9HdNEi8sQxQFQC1
 FWEgtfoDjxHq6CORDSW8bL8hSy2ETgYKykFfyBsZQkY5Z/lqYI6jBPKR/5iFrK4ipv+HjSY/
 tyRhHFg3fNJ15dNjvjluwCc696xmnTXZio0pVWGUzy60ll4OYWve8+Q6V3Rx/kVee51UWK9l
 HQDnsGf6sUHApeMiDGBTY0xIV252xqWGGaC2AAyRvHN4xzooif+Jt4IvFmSMW80ap5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmO2voHAGia24hTmFfK0QfUcXY
 8bznSGEVytyNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXSM79ltf/Z+F2Nq
 76z0vdmLT0FAYUShQGNrOYuwa0idyBnVfgaVeQNHgJ8HuaWMD54UKKAqV/QU4dkg75Uho/1E
 oKVASdlJK7ErSSfc22iMyk7AJu2BMoXhS9rbEQEYAfzs1B+MNnH0UvqX8ZuFVXR3Lc4lqAco
 jhsU5joP8mjvRyco2VNNcSm9dc6HPlp7CrXVxeYjPEEV8cIbyTC+8P+fxup8y8LDyGtstA5r
 aHm3QTeKafvjSw+ZCoKQJpDF2+MgEU=
IronPort-HdrOrdr: A9a23:YDY6Aa9h5CUlksDAS9puk+F+db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYW4qKQ0dcdDpAtjlfZtFnaQFoLX5To3SIzUO31HYbL2KjLGSjQEIfheeygcz79
 YZT0ETMqyTMbE+t7eG3ODaKadi/DDkytHSuQ629R4EJmsGC9AC0+46MHfgLqQffngaOXNTLu
 v62iMznUvYRZ1hVLXcOpBqZZmnm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k7Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXUISaCUmRIXee
 v30lEd1vdImirsl6aO0EPQMjzboXETArnZuASlaDXY0JbErXkBerR8bMpiA2rkAgwbzY1BOe
 twrhGkX9A8N2KxoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIZLH6uJlOM1GkLKp
 gkMCjn3ocdTbpaVQGugkB/hNi3GngjFBaPRUYP/sSTzjhNhXh8i08V3tYWkHsM/I80D8As3Z
 WKDo140LVVCsMGZ6N0A+kMBcOxF2zWWBrJdGafO07uGq0LM2/E75T3/LI27ue3f4Fg9up/pL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GS/gz8lPjqIJ8oEUhICbeBFrZGpe5vdI+c9vcPEzc8
 zDTK5rPw==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65009921"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JICo6OVbANMR5UI3P+8PzWsYOB22Z9Gf0n6Ybd4b2d5CfxWkB+aKXUULayxIs8mWL1s67xvza9mgGUsvphZmaddp2xuZmMj0ynbQPJRWuQtIAdLIWSbOeZUOOjLWDWHgSzjcSIDpAtv+lLoXdG2o2OCxrCNMGNyWnjh2pdyRmBVjcNaVHcom/qnQp/qQ5/UcoQIXhX29ZtAgkJuzBuyWXGT7L9m935ZOCwP6wTJDXP0kkOEq6sKBq9Rgft05EfGANaLPjmvcO73AzUWZ4qbLeOLpwtYihDzNn5n1fvg8DybGy0xfHtWq6Stae/xNVCpsPFzK0lYy7D/0EJ8empBw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/GdCrGTBYXVKADzhTOUA4HbsusNoi9AZZ+DqQY6uWA=;
 b=Sbd7DpMurB1VezpfyFsJhDFnTiSSKlYB2qcmFywWBA+S1FUPHtB0Fi6jsHEyzpHVOYBK7ZO9/zUbPU9DrRWZbTboR1bzvgASZhc/BURHZNA/5bNg12TawwTsEGUm0lnIfeMODgrNnYc8D7CDrcT5+xyGvB8bhzQilW1vxj1nZfG5OduftX/uC7AhfrD+8j6lZn8/92viWO6HXtgnhMAThcQ6yD+VF5IqLCnhwC/aHpKXM8v0aejY8ax5IwjLY45weMBinwl9b750ELgY4CY6cxXB7CNcqqS/4laOb/QilzI7rU3Dn9C1sREEoRxoY6tcrhHUrquHIYaK54YwkquZ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/GdCrGTBYXVKADzhTOUA4HbsusNoi9AZZ+DqQY6uWA=;
 b=ZGqrWrUvyGCBtXK1rep8LxkR01ThD+nyZLiJvHGQI171LUCMhMPJkeH8UiQI4TlAN/bZplrGcyFJpfDifsnTOIWiMopXWMLZ44PNjPN4/OBGqAE9pHmeOP9jMzWxn4Qsi1gZgt8FJaTHrslP7+MRVQkL4SQNEu39318M9L0MbPs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Thiner Logoer
	<logoerthiner1@163.com>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: x86/vmx: Don't spuriously crash the domain when INIT is received
Thread-Topic: x86/vmx: Don't spuriously crash the domain when INIT is received
Thread-Index: AQHYKben+W9NHlmgjUe5tEPatIDj2Kyj9FgAgAA+noCAAA5JgIAAQNgA
Date: Fri, 25 Feb 2022 17:11:45 +0000
Message-ID: <965e91fa-1f1e-7c57-5a71-a09b170a7d9f@citrix.com>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
 <20220224194853.17774-3-andrew.cooper3@citrix.com>
 <12d8b90b-15b0-c094-71e5-35cfdbfe72b4@suse.com>
 <51ef6bd1-bcd9-9a3a-e902-887d42d7dd7e@citrix.com>
 <bb4b4106-f49d-2b50-1eb9-eb450f6b24fa@suse.com>
In-Reply-To: <bb4b4106-f49d-2b50-1eb9-eb450f6b24fa@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b60f35d-bb87-4f2c-df01-08d9f881e6d2
x-ms-traffictypediagnostic: BYAPR03MB3688:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <BYAPR03MB36881637D80AF0CAF27D63C0BA3E9@BYAPR03MB3688.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8SLncy9PrrUKmi64TFLZuPJK0Mt5MLmuDrV+IRa79c2EYUNBW0hG/kpdf6WvRgOVgtGtyofVfWN74Gc5orij1Dnm6VGjh6YfCSfofQMkCcK93qTB+VUVkUQIpvc18kdvYnX3Qu2wodjlS6M2fSXKYbVoxlFGAj2I7Fe7lLApghNc40F/UGozD8k74BapuyYBAnsXp+1YzM0uXNPzFfNaq/YI0/RU3YS9smrP+l9pFf81SyRprJq192fFDb5wohzgUD8ifyyivIQIt8MCXVDk9pZtS9xysQOEN3k/XK/c7G0zJ3LkL2qeU/QXu5DiXKYm6ELL2W4lsllprNE7DdkYeQ3OWOaGUI6AqTl4GE/YelvhXGcCBpekVH+jCavAJGUK1rtzw+PIm2WLY987Tq/CjZhISCtijrPYDkoD0mZvCooGtsVCt83WJp8qcR6e87jg8bNBCdmpCnrlu0AuJACD567lAA/hLonnE0zWp3CNGdXvj3RKZPqNUvZgA/skLwg8/22UJRjp+6AFpVA8ZzybCcy59Vpl1oP9GQVPMU6aQMdhn3sWHek8MbgxxZyxYxBkjeOEnVXaRMX2ctRQaoNeGzdJTeryoX5Yprs3Bgy0m41A8WtYZJbCtsBj49a8bRQiHd6Xae655dZeYwJNo0RKTrPHAccOUPdHqexGrrqvLcO4RWQ5mIoDwF+a/otWJW8fBb7weYkoLcI/FZ+SG+Wi23g1HvjZ2mNP/UvY4SwCu3Hn7mzmcIWpKhkMcVTAdv2selhfXNS/D9rsCkRYbABQjA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(5660300002)(86362001)(26005)(186003)(83380400001)(6916009)(54906003)(36756003)(31686004)(91956017)(53546011)(66476007)(122000001)(316002)(66946007)(6506007)(6512007)(76116006)(508600001)(6486002)(82960400001)(4326008)(71200400001)(8936002)(2616005)(66446008)(64756008)(2906002)(8676002)(66556008)(38100700002)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWQ4R1l3L1IzeW0rTDA1WC9VMFNsajR1NkE0MS9JTFIyZElzS2YwRGd4VWta?=
 =?utf-8?B?WEw0ZmsxZEV6WEpsZEFHWXVwSjU1ZHNrclNUODlrRG5EQngvSTNtbENpRXZK?=
 =?utf-8?B?bU1nZnp2dGlhY2hKU21HVHpWL1M4T010cVRQYllyR1VXL2tmdm82b0ZyQWhl?=
 =?utf-8?B?YkV6K2VNWXUxMHR2NEc1Rm8wTmZUa1pEZ3VzR05qR3R4NGdQSnNERFdSNVQz?=
 =?utf-8?B?Zkk2eXBTOWZNUkxsMzV0UG1hT0h6WURQSkVBK0taendGS0hveUxZNTBMclhC?=
 =?utf-8?B?ZzFTTDNqL0U3bG9IODIyZjdnb3VZQXJhWFV2V3ZlaUxHaHEvdGxGakNTakFo?=
 =?utf-8?B?dWtxQWdtQi9EV05tcVk2MDl5SCtLQkhtNm5kaFlmcGw4K08xLzFVWDJaOTJF?=
 =?utf-8?B?eHpwWkx0ckFncnZCT3ozejNLTUh0bmtIemRDM3U4aUp5T0dpSmxYYklhZkUx?=
 =?utf-8?B?MXc5elpMaGFiUWMvbzNHTExURlNjVWNiUTgzRlcwYjc3bERTakt3eWVidW5R?=
 =?utf-8?B?cTNrSFI5WFBHTVdCbVFlUVA0WTJodlJvRlJwdU81MWFvTFhBazE5STV3MzFH?=
 =?utf-8?B?NG5QQldJM205aEgzNDFGZm80Mk51Tzd3UU1ueW55OFNaYzdnbXRjVEJmU2ww?=
 =?utf-8?B?S091TmtEWlM2dVRCM21xU0oveXkvTkl4eW1xdkFGdUVLSWVIY04zeGlCMmQ1?=
 =?utf-8?B?M09QVUU0a2J3d0JwYzJwOWZwd2NtZDVvNU9xRUs5Uzh2YzRCcGVSVzhRTll1?=
 =?utf-8?B?WEY1Q3RsUEpRczN0eFFFQTZnUjhMWWRuQ0NNQnZ4YXBwZWlQY05oYW1QSHVr?=
 =?utf-8?B?SldUY2tiYVc4cTNSUktCdldXQUE0ZVhJZVJqWjZsdlp0QmNmaWk3b3ZFQ3JW?=
 =?utf-8?B?K2pPZ3dIN1ZlbmVOcWhJMC9DdGhMaUU5UzlzQXB3M29zcnpLTmxnbWZQZlBj?=
 =?utf-8?B?cjYrZXhFUjFnaWRqM084THB5VEV0aVJBZEVkMU1iL2hCY3p2bmEyeXBqUFBi?=
 =?utf-8?B?dXJjNXY3UkZxaHY1ZmpISkROZVNvSzVqMVphd2VySm5tbHIxM1k1QmtldlFr?=
 =?utf-8?B?QU5sNzNYcTVSM1JiK3lLdGNqYW5pYWxwTEtIdHZjOFlCTnoyVDVBdTBLOXc0?=
 =?utf-8?B?bDdFeUxZVWtBSjU5RGszeS9MZTVjZ1NKL29iQldYWkxYaWNRMjEyUXRkU0x5?=
 =?utf-8?B?REN6eWFrYUtlNTNmSzJMNzY3RStqcHhVRUsxa20xejczd0ZCUC95SlJyOFBj?=
 =?utf-8?B?dnBsNEFuNS9xN0R5ejBBWFZrYStNazBXRi9YRXlwb3YrWHIwSmZQc3M2dkZJ?=
 =?utf-8?B?UVFGTkFUZ1N5L1NwRGVqOUlDKy9iZEhBTUNiUjAxcjJBQWhTV2ZON0xXL3ds?=
 =?utf-8?B?cUZJVVR5cmZMVnJFRnBTZE4yZEtQcW5UMTM3ZFdqWmtjYlVpRzdVMUtVRTNq?=
 =?utf-8?B?OURwdlFLeTl5ODZoZTcxcFM3N0VSRG1USEZmQXhJN0ZjdmVZUnJ2a012TXRD?=
 =?utf-8?B?d1FsZktjOUJBWHRFeDNQQ0NYY2lDVXAwQ01XQjFENjFHZTVJazFKbzlWbnpI?=
 =?utf-8?B?MEsyVVYxemhUQ0psYjROUzB0WngvZWRmWEJRL3VuTktQRVBZdkVqMjZZUGo1?=
 =?utf-8?B?NXUrU1VTQjJnNXpUOEtEQnlvUkVHNHRTN0hZL1lhSW1YZ0sxWC9naWpuVzc0?=
 =?utf-8?B?MVVENHdvRjhUTzROT09OVUI2Q3g0RGQ4cmplNC95VjhRRHpkaXBxYnBhN28r?=
 =?utf-8?B?N3FpS21aN1hKRkoyRHp1dEZSdzVZYnlNeklFczR4aTR0V2grZWZKSGhuQURs?=
 =?utf-8?B?YzVxQi9WR1ZCMU11WXp3U05icDJKR1pCampKUWF4TDl4Ykg5bXp2ZkhMK0Qv?=
 =?utf-8?B?eDc4ODJOTnRNcTVSSUdxdjhIODdVa2J2TzZhYk80Q3BaTk1jWldhZGtkQzd3?=
 =?utf-8?B?ZmtGNEVydTdEMnBGbTVuYnFxNGpBd29VYTF3T203aGRhYXdQeElwakcycStL?=
 =?utf-8?B?UGJCMVNOcTlpWDFqZEU4YU9Ta2lwZWszZkFLcjJoTTR1NGREUXR6aHljS1Zn?=
 =?utf-8?B?VEVTRzl2K0lPcjUvbXRzTTBEQ1U2YTQ5VE9wU0t3d1RuMlBUSEt2U2p1TEZ1?=
 =?utf-8?B?TWk1Y0tXMTBFeUpCOHB3S1NHc1AwVjFVV09wMmRjaFVCV1FhTkdoU1FVNXNi?=
 =?utf-8?B?NTdleUhvNGtrZTR6U29NOTliZERnMk5BaUFpMnF1blJQMDNicVhFSXNGOVVa?=
 =?utf-8?B?cjlTREk5NDE5Zi9KdERJRTFqUW13PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40ED024FD7376C42BEAC46AA39763A4E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b60f35d-bb87-4f2c-df01-08d9f881e6d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 17:11:45.5747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j0ClOWScRMxu4Yqb2lzP+A8MN9TgYwLuY2ltBpthdWxQBM29Qf0kqW3dsiavZZ6DCso0rGbQYdTNyCh4nj99raGG+reVuw1ceCYET4aJYN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3688
X-OriginatorOrg: citrix.com

T24gMjUvMDIvMjAyMiAxMzoxOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI1LjAyLjIwMjIg
MTM6MjgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyNS8wMi8yMDIyIDA4OjQ0LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAyNC4wMi4yMDIyIDIwOjQ4LCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBJbiBWTVggb3BlcmF0aW9uLCB0aGUgaGFuZGxpbmcgb2YgSU5JVCBJUElzIGlz
IGNoYW5nZWQuICBFWElUX1JFQVNPTl9JTklUIGhhcw0KPj4+PiBub3RoaW5nIHRvIGRvIHdpdGgg
dGhlIGd1ZXN0IGluIHF1ZXN0aW9uLCBzaW1wbHkgc2lnbmFscyB0aGF0IGFuIElOSVQgd2FzDQo+
Pj4+IHJlY2VpdmVkLg0KPj4+Pg0KPj4+PiBJZ25vcmluZyB0aGUgSU5JVCBpcyBwcm9iYWJseSB0
aGUgd3JvbmcgdGhpbmcgdG8gZG8sIGJ1dCBpcyBoZWxwZnVsIGZvcg0KPj4+PiBkZWJ1Z2dpbmcu
ICBDcmFzaGluZyB0aGUgZG9tYWluIHdoaWNoIGhhcHBlbnMgdG8gYmUgaW4gY29udGV4dCBpcyBk
ZWZpbml0ZWx5DQo+Pj4+IHdyb25nLiAgUHJpbnQgYW4gZXJyb3IgbWVzc2FnZSBhbmQgY29udGlu
dWUuDQo+Pj4+DQo+Pj4+IERpc2NvdmVyZWQgYXMgY29sbGF0ZXJhbCBkYW1hZ2UgZnJvbSB3aGVu
IGFuIEFQIHRyaXBsZSBmYXVsdHMgb24gUzMgcmVzdW1lIG9uDQo+Pj4+IEludGVsIFRpZ2VyTGFr
ZSBwbGF0Zm9ybXMuDQo+Pj4gSSdtIGFmcmFpZCBJIGRvbid0IGZvbGxvdyB0aGUgc2NlbmFyaW8s
IHdoaWNoIHdhcyAob25seSkgb3V0bGluZWQgaW4NCj4+PiBwYXRjaCAxOiBXaHkgd291bGQgdGhl
IEJTUCByZWNlaXZlIElOSVQgaW4gdGhpcyBjYXNlPw0KPj4gU0hVVERPV04gaXMgYSBzaWduYWwg
ZW1pdHRlZCBieSBhIGNvcmUgd2hlbiBpdCBjYW4ndCBjb250aW51ZS7CoCBUcmlwbGUNCj4+IGZh
dWx0IGlzIG9uZSBjYXVzZSwgYnV0IG90aGVyIHNvdXJjZXMgaW5jbHVkZSBhIGRvdWJsZSAjTUMs
IGV0Yy4NCj4+DQo+PiBTb21lIGV4dGVybmFsIGNvbXBvbmVudCwgaW4gdGhlIFBDSCBJIGV4cGVj
dCwgbmVlZHMgdG8gdHVybiB0aGlzIGludG8gYQ0KPj4gcGxhdGZvcm0gcmVzZXQsIGJlY2F1c2Ug
b25lIG1hbGZ1bmN0aW9uaW5nIGNvcmUgY2FuJ3QuwqAgSXQgaXMgd2h5IGENCj4+IHRyaXBsZSBm
YXVsdCBvbiBhbnkgbG9naWNhbCBwcm9jZXNzb3IgYnJpbmdzIHRoZSB3aG9sZSBzeXN0ZW0gZG93
bi4NCj4gSSdtIGFmcmFpZCB0aGlzIGRvZXNuJ3QgYW5zd2VyIG15IHF1ZXN0aW9uLiBDbGVhcmx5
IHRoZSBzeXN0ZW0gZGlkbid0DQo+IHNodXQgZG93bi4NCg0KSW5kZWVkLCAqYmVjYXVzZSogWGVu
IGNhdWdodCBhbmQgaWdub3JlZCB0aGUgSU5JVCB3aGljaCB3YXMgb3RoZXJ3aXNlDQpzdXBwb3Nl
ZCB0byBkbyBpdC4NCg0KPiAgSGVuY2UgSSBzdGlsbCBkb24ndCBzZWUgd2h5IHRoZSBCU1Agd291
bGQgc2VlIElOSVQgaW4gdGhlDQo+IGZpcnN0IHBsYWNlLg0KPg0KPj4+IEFuZCBpdCBhbHNvIGNh
bm5vdCBiZSB0aGF0IHRoZSBJTklUIHdhcyByZWNlaXZlZCBieSB0aGUgdkNQVSB3aGlsZSBydW5u
aW5nIG9uDQo+Pj4gYW5vdGhlciBDUFU6DQo+PiBJdCdzIG5vdGhpbmcgKHJlYWxseSkgdG8gZG8g
d2l0aCB0aGUgdkNQVS7CoCBJTklUIGlzIGEgZXh0ZXJuYWwgc2lnbmFsIHRvDQo+PiB0aGUgKHJl
YWwpIEFQSUMsIGp1c3QgbGlrZSBOTUkvZXRjLg0KPj4NCj4+IEl0IGlzIHRoZSBuZXh0IFZNRW50
cnkgb24gYSBDUFUgd2hpY2ggcmVjZWl2ZWQgSU5JVCB0aGF0IHN1ZmZlcnMgYQ0KPj4gVk1FbnRy
eSBmYWlsdXJlLCBhbmQgdGhlIFZNRW50cnkgZmFpbHVyZSBoYXMgbm90aGluZyB0byBkbyB3aXRo
IHRoZQ0KPj4gY29udGVudHMgb2YgdGhlIFZNQ1MuDQo+Pg0KPj4gSW1wb3J0YW50bHkgZm9yIFhl
biBob3dldmVyLCB0aGlzIGlzbid0IGFwcGxpY2FibGUgZm9yIHNjaGVkdWxpbmcgUFYNCj4+IHZD
UFVzLCB3aGljaCBpcyB3aHkgZG9tMCB3YXNuJ3QgdGhlIG9uZSB0aGF0IGNyYXNoZWQuwqAgVGhp
cyBhY3R1YWxseQ0KPj4gbWVhbnQgdGhhdCBkb20wIHdhcyBhbGl2ZSBhbiB1c2FibGUsIGFsYmVp
dCBpdCBzaGFyaW5nIGFsbCB2Q1BVcyBvbiBhDQo+PiBzaW5nbGUgQ1BVLg0KPj4NCj4+DQo+PiBU
aGUgY2hhbmdlIGluIElOSVQgYmVoYXZpb3VyIGV4aXN0cyBmb3IgVFhULCB3aGVyZSBpcyBpdCBj
cml0aWNhbCB0aGF0DQo+PiBzb2Z0d2FyZSBjYW4gY2xlYXIgc2VjcmV0cyBmcm9tIFJBTSBiZWZv
cmUgcmVzZXR0aW5nLsKgIEknbSBub3Qgd2FudGluZw0KPj4gdG8gZ2V0IGludG8gYW55IG9mIHRo
YXQgYmVjYXVzZSBpdCdzIGZhciBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gSSBoYXZlDQo+PiB0aW1l
IHRvIGZpeC4NCj4gSSBndWVzcyB0aGVyZSdzIHNvbWV0aGluZyBoaWRkZW4gYmVoaW5kIHdoYXQg
eW91IHNheSBoZXJlLCBsaWtlIElOSVQNCj4gb25seSBiZWluZyBsYXRjaGVkLCBidXQgdGhpcyBs
YXRjaGVkIHN0YXRlIHRoZW4gY2F1c2luZyB0aGUgVk0gZW50cnkNCj4gZmFpbHVyZS4gV2hpY2gg
d291bGQgbWVhbiB0aGF0IHJlYWxseSB0aGUgSU5JVCB3YXMgYSBzaWduYWwgZm9yIHRoZQ0KPiBz
eXN0ZW0gdG8gc2h1dCBkb3duIC8gc2h1dHRpbmcgZG93bi4NCg0KWWVzLg0KDQo+IEluIHdoaWNo
IGNhc2UgYXJyYW5naW5nIHRvDQo+IGNvbnRpbnVlIGJ5IGlnbm9yaW5nIHRoZSBldmVudCBpbiBW
TVggbG9va3Mgd3JvbmcuIFNpbXBseSBjcmFzaGluZw0KPiB0aGUgZ3Vlc3Qgd291bGQgdGhlbiBi
ZSB3cm9uZyBhcyB3ZWxsLCBvZiBjb3Vyc2UuIFdlIHNob3VsZCBzaHV0DQo+IGRvd24gaW5zdGVh
ZC4NCg0KSXQgaXMgc29mdHdhcmUncyBkaXNjcmV0aW9uIHdoYXQgdG8gZG8gd2hlbiBhbiBJTklU
IGlzIGNhdWdodCwgZXZlbiBpZg0KdGhlIGV4cGVjdGF0aW9uIGlzIHRvIGhvbm91ciBpdCBmYWly
bHkgcHJvbXB0bHkuDQoNCj4gQnV0IEkgZG9uJ3QgdGhpbmsgSSBzZWUgdGhlIGZ1bGwgcGljdHVy
ZSBoZXJlIHlldCwgdW5sZXNzIHlvdXINCj4gbWVudGlvbmluZyBvZiBUWFQgd2FzIGFjdHVhbGx5
IGltcGx5aW5nIHRoYXQgVFhUIHdhcyBhY3RpdmUgYXQgdGhlDQo+IHBvaW50IG9mIHRoZSBjcmFz
aCAod2hpY2ggSSBkb24ndCB0aGluayB3YXMgc2FpZCBhbnl3aGVyZSkuDQoNClRoaXMgZGlkIGNh
dXNlIGNvbmZ1c2lvbiBkdXJpbmcgZGVidWdnaW5nLsKgIEFzIGZhciBhcyB3ZSBjYW4gdGVsbCwg
VFhUDQppcyBub3QgYWN0aXZlLCBidXQgdGhlIG9ic2VydmVkIGJlaGF2aW91ciBjZXJ0YWlubHkg
bG9va3MgbGlrZSBUWFQgaXMNCmFjdGl2ZS4NCg0KVGhlbiBhZ2FpbiwgcmVzZXQgaXMgYSBwbGF0
Zm9ybSBiZWhhdmlvdXIsIG5vdCBhcmNoaXRlY3R1cmFsLsKgIEFsc28sDQppdCdzIG15IHVuZGVy
c3RhbmRpbmcgdGhhdCBJbnRlbCBkb2VzIG5vdCBzdXBwb3J0IFMzIG9uIFRpZ2VyTGFrZQ0KKG9w
dGluZyB0byBvbmx5IHN1cHBvcnQgUzBpeCBpbnN0ZWFkKSwgc28gSSdtIGd1ZXNzaW5nIHRoYXQg
IkxpbnV4IFMzIg0KYXMgaXQncyBjYWxsZWQgaW4gdGhlIG1lbnUgaXMgc29tZXRoaW5nIHJldHJv
Zml0dGVkIGJ5IHRoZSBPRU0uDQoNCkJ1dCBvdmVyYWxsLCB0aGUgcG9pbnQgaXNuJ3QgcmVhbGx5
IGFib3V0IHdoYXQgdHJpZ2dlcmVkIHRoZSBJTklULsKgIFdlDQphbHNvIHNob3VsZG4ndCBudWtl
IGFuIGlubm9jZW50IFZNIGlmIGFuIElOSVQgSVBJIHNsaXBzIHRocm91Z2gNCmludGVycnVwdCBy
ZW1hcHBpbmcuDQoNCn5BbmRyZXcNCg==

