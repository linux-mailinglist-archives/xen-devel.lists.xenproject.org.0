Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867F460CF72
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 16:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429879.681200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLAo-0004J3-Co; Tue, 25 Oct 2022 14:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429879.681200; Tue, 25 Oct 2022 14:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLAo-0004Gc-8t; Tue, 25 Oct 2022 14:44:58 +0000
Received: by outflank-mailman (input) for mailman id 429879;
 Tue, 25 Oct 2022 14:44:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bJBo=22=citrix.com=prvs=2902c4af2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onLAm-0003SJ-7l
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 14:44:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96f48f0d-5473-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 16:44:55 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 10:44:53 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB6118.namprd03.prod.outlook.com (2603:10b6:208:31c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 14:44:51 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 14:44:51 +0000
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
X-Inumbo-ID: 96f48f0d-5473-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666709094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lK5sCkafKTg60/tnmYLI+7xQSzr6OWS0/h/M8T5Wwd8=;
  b=MfiHlO+c5Li3mT3kQY21PgNmtnZLKiQ7PedNBrMJRhltf+Xl2avlV1BM
   KVoMfH7OOfT6SExN+cm3UwZt1z57oYJd5ARFEGBt0qqYpRLfqVsGfPMFk
   moE5ioo9TzbH3fd9hCH9meMSg3zY/G+/47yyMVQHH0svDANC4/XHPTVo6
   I=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 83085569
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LuUh+6NLkB4Un2bvrR2GlsFynXyQoLVcMsEvi/4bfWQNrUongTFRn
 2oeWjrVM62NMzDzcohyYIzi9UMDv5CDm9VgHAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayo5WtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eJ44cxsxtG2ty0
 9MUJS4wYkGZn8Gq+efuIgVsrpxLwMjDGqo64ygl5haASPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF9hTM+vJfD2v7lWSd1JD3N9XYYJqSTNh9lUeEv
 GPWuW/+B3n2MfTPkmLVry/y14cjmwv0eYZNM4eZ3MRajQaS3Eg/VEArSEGk9KzRZkmWHog3x
 1Yv0jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8wwufHHlCcTdHZ/QvrspwTjsvv
 neLld70AT1ksJWOVGmQsLyTqFuP1TM9KGYDYWoPSlID6ty6+YUr1EuQFpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPeRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:tZdbLqpaqphIasjB9ksx3REaV5uhL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXcH2/hqAV7CZnivhILMFu1fBOTZslrd8kHFl9K1kJ
 0QC5SWa+eARmSS7/yKhjVQeuxIqLbozEnrv5am854Hd3AJV0gU1XYcNu/tKDwSeOApP/oEPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+wA+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRhuerRfb8xfT9GA+cyzpAV74RG4FqewpF491H3Wxa3u
 UkZS1QffibpUmhO11d6iGdpjUImAxel0MKj2Xoy0cL6PaJOw4SGo5Pg5lUfQDe7FdltNZg0L
 hT12bcrJZPCwjc9R6NkOQgeisa43Zcm0BS5dI7njhaS88TebVRpYsQ8AdcF4oBBjvz7MQiHP
 N1BM/R6f5KeRfCBkqp91VH0ZipRDA+Dx2GSk8Ntoic1CVXhmlwyw8dyNYElnkN+ZohQ91P5v
 jCMK5viLZSJ/VmG55VFaMEW4+6G2bNSRXDPCabJknmDrgOPzbXp5v+8NwOlZOXkVwzvegPcb
 j6ISNlXDQJCjzT4OW1rex2ziw=
X-IronPort-AV: E=Sophos;i="5.95,212,1661832000"; 
   d="scan'208";a="83085569"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXC1HwZlbb0htukKNOx1rt5In+5eddZUigIsEz+JkeRzbwXG8h1zQ7DI+ZLjF6v10m94mQXGEizXqL8NNUtupTOxYb7FnkscPK3VhIEJfodW6A1Sp2Jy9cBwSSL7LsiWt+Xv9+ouA3TrsSB7qW3PX3K3RqzycDrZ2/wC7pI44qYNxFUvLhbke8pPl+WP1riiHq0FD4DIL0cXPMLvl2Z4bpyy9/ClM8Agf0+dNpZoO+Y9BCB79IONEyJhFpCrm3+oeNuMJdXmtocVXQ8X/0cq/5+n60mFJzb3jzi8VShRL3CMQe/JjUXJlM03M2HfNsmErEt/V6ek6l2Rx8kWJQ4nGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzCg1pMR0cq2iQiX6KNWMZbBy7hPZyi/638lZv3TX6Y=;
 b=PER7v8ikKMrvr1BOAo7Uh47RuN64KzzULnayJHmFtD5dzCMPogdtjQRhOypdgZdLZRCgp6gSZQhqimr/0lMOhqTNK7SdD7wY7zyHmg03mg5Tfb9SPFxEV0F7qvJ9PAwsnaNSe3KHU+HoWiIsSNYlZIntWP1ZaLxzYxjDC5LRpxS1EhdUYvQNvNgsVdCBzRc+GpnpU8lrsOz30lFgv4MXI4fM6XbzEi1zSPQUgJnolT4cf49dGPLgBdBeeZkWGLGFq6y2S9dxHWEpOEAfgugUZIgisrG/zkiyhcupHDAnIgKHy35U/1gh+XhiV6lO1RFqIB+TEv0wD2PAKo14uf4TYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzCg1pMR0cq2iQiX6KNWMZbBy7hPZyi/638lZv3TX6Y=;
 b=PB4fpUKo3sL3ap9klgZgUl+Rkif6jTUN2VuzEk8pgnUpPehkZQASi8H+OfbciVwWb0oKq8tm0ecmynSq3Q071ulP0zg6U65XC0cRX3g953EeZTPy0oYCoZ5NTxKVZhkW89AcIFYDgtJhZ5XBsiUMFwh5QJv+do7doIkE6kGXh9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.17 v2 3/5] vpci: introduce a local vpci_bar variable to modify_decoding()
Date: Tue, 25 Oct 2022 16:44:16 +0200
Message-Id: <20221025144418.66800-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025144418.66800-1-roger.pau@citrix.com>
References: <20221025144418.66800-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0427.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::31) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: 678bf55e-af45-4dd2-3c56-08dab6977929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LuDMlMCi9vJI9bN0Rpq/wYtD4xp0RMgI2jemhjmM/L6rxeo5Y4AHY14+s6EE0na/T7cS1ugSK6Qk4y41Tis8I0K2PNdqwSSqI+Q5ujagfFeU63hjxKBoJLfYk66mWGKNYsiGfaiYbF8cnaj+Yxf3I3O80yct+xum8I+nusQc7HDhfRNqdMdX3+BzQVIzNvIUoybrTHA2nnryjHrWVqx4p9hiRS+oFO3PfRetsnd2iw+/N3hSrrUzcbd1E0waWyt51YQG2UMvi6jK9Rs2ygsLUn7MSwWH2/yxbPibqZWHxPDt4j/2ECOL+7BA3EPScR1CE9vD33WWnQAft7Q8jxWCq11l6Eow8jI2d+bkj8zvg0vmqFWnvTMpRPlwGrV2UmyXk3wsoV/WV1ClOiTWrYamzDL1yrtnEQ61TYL3/BqBXFvXjUON4l+bU+TQUwmwI7kshKfMtLrSU+gisCnK0asmzmFhuw69DbYaQL9ZVPsNmCpUSm18yd1mAp4BjTyOeESwLrcUQP7gRvbp383wapAnnKOckh+I/ssG7l6oA4jZ5TNTk8DAPLanQeaBJ73D8Yzm+YsaJRcrACVl2wYhJFWFmHnTGFfMQPHoLZBhyiDZa5HJEKGjshPxvgLcZ6d6/pUBaPtTmx8bZNManJJoL4yQ9jXxCr+fToJo3jWboKqmnc034PQstoVCqBTIDaxHzDWnSgSj33YDqz76aoN0oJLjiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199015)(36756003)(66946007)(83380400001)(316002)(4326008)(66556008)(6506007)(66476007)(8936002)(8676002)(54906003)(6666004)(6916009)(2616005)(1076003)(186003)(26005)(86362001)(6512007)(5660300002)(41300700001)(2906002)(478600001)(6486002)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTd3OEREUVg1dFhSc3M2VHlNcHNObmZGUmQ4bWs3YitqRE1ZdUwxaDhib2dT?=
 =?utf-8?B?Nnhjb3cyVVZuOEMzTVhpVE1zcnYvRjdDdG5VMUZ4VFFldmFETnRLdFRob2ZB?=
 =?utf-8?B?V01URmpDOUJrZk1oQnd5VXlkcldqK3NwYzgzZW1GUEluTHdhL29ISWZTRFFp?=
 =?utf-8?B?T3N5dm5xVng2bFJzL3dsSzlOelR3TjMzaGdOQzlqby9xS3d1S2pYTlVxaFF2?=
 =?utf-8?B?cGxjSVNIQkdlYUpSczRFSyswais3L2xZcEdVK0l4Y0hEWVZRRkZZMXNGYkt5?=
 =?utf-8?B?dFF3T0JacUhUa1RDWU5YRkJoWENWaW9wY2V5b3lEbHBnK1JycllkUHZ6c1ha?=
 =?utf-8?B?ZW5uSzVud1ZSV2RxV2puNEdvbVhjdVhYdWxBTlhSVCsxVUduZGxGL01RSG85?=
 =?utf-8?B?eHVxSWNsMFRSRG95R01nc09NdjlvcHpob0IrRWdydko0QkFzY3B4ay8xa0RD?=
 =?utf-8?B?eDFNSVBSbVdnN2dIZFhMQ2VhNUFIRHhYTnpVY0FpUXZLekFmWElVOVc2dzl1?=
 =?utf-8?B?UGJCay9CaDlQbmNvbkJUaEFWTW5VNTN2c3QzR2kwdUhBZzc1L0dLOG1PQnNq?=
 =?utf-8?B?SVIxZWRWYWNCYURzZEF2SDJOZUdvNk9wVS91OXdsYWNmdjhXWFVhSjk5bFd6?=
 =?utf-8?B?MEkzbkRjUlcwY1NrbkJ2VkxxQVZIVjQvTHJIclRnTm1sNUVhbGRKWE9USTN3?=
 =?utf-8?B?dS96YVFqeDJZTUlpbGNYbElQam1JSkFQeVFLWkVVRmkzMVVyTE9tdlFRL1dL?=
 =?utf-8?B?RkFodjBEOUp5d3ZZbHFjdVhDOFFHVzRvOEE3ejF5ZjQyQ2gzM2tycFd3anpI?=
 =?utf-8?B?L2M3a0k5OHdxS0k5bGdVWnlOWE1LRWFKOFlRdTBOblhRVXdyOHNtZ1k3cUo4?=
 =?utf-8?B?ZVVSZFNMNFVtY0M3WVB3WTdtaDlkZHF2U1dYdWFiUTQydzBXUG5yWmI1MUsz?=
 =?utf-8?B?T0N6Q2s1UlNxbk9kYmNnYU5Wbi9EZlcvcXM5UGh5M01SZnVlNnozNytIY1oz?=
 =?utf-8?B?bkxlY1BQNlFWN0JUTnIvcXczVEY3TEVUUUZmMnNIV0hsZWhFY0ZVZXJjY1lR?=
 =?utf-8?B?VyswT2FxdkhkM09HRUY2QWQxNkQ3R3pJSXZOWUxiZXFJYW5HdHg0RmxFYWFI?=
 =?utf-8?B?TkpGdk13VytlenM5M3pKbjhrSXdsQjd6NmNZVEdPTERtUGV3ekU5ZjRGSDJF?=
 =?utf-8?B?WEE4NDA4Z1lWSVZ0WDVvUXdHQ3dxTUtXN0JFeEZ5cHFtSEhrLzBUVnlMNmNp?=
 =?utf-8?B?eXhtOENlNGl3anI2dGl0Z1dLYUJVT2I4VER2RDJJTkN4a1dQODdpNTl3bmkx?=
 =?utf-8?B?a08yQ3JRUTBIUXk2Wm5Lb1Y4WWdjRlZ4UWZhUW9Dc0I2aGFOR2RRT0F5Ni9a?=
 =?utf-8?B?b25NTEl4d2UwTUZpcW4wczZKQjhFQnhieVFQWXl0VWtHZktuUzJab3Q3anpi?=
 =?utf-8?B?Z0dUelFmMk5FOW1vS3M4OWVNNUFXM3ZoTndMa3pjbW1sQmRPYkpUbUQxZnlU?=
 =?utf-8?B?aC8vWmhhbWEyRUEwUUkzaU53c3ZPZUh5RVIrUEU0cWNTZ0EzZXJ0OHBQQi85?=
 =?utf-8?B?M3RxNFRVUzVNUFNWdytpS1Z1U1Q2L29FNVBoZktVeEEvR2FCMCtXajhNUVFY?=
 =?utf-8?B?TUpLaWpvWXY3UlZSVmJjMUdvM1ZGeFhTM2s0OW9rMzNNNUhSMkQwb3FvVjJB?=
 =?utf-8?B?bllyV09NYXV0WVdCMGVrRDcrbDhYUkUxcVdGVUVkOUtXVCtlbllUUlJGNFZr?=
 =?utf-8?B?Rk9oZkNzQ1lPV29Tbk1SVTlQRXgraXNrKzBLeGlFVytXU1A1dCtxYWcvNHN0?=
 =?utf-8?B?dkV0eVVKVEI5QURZZnVsS2xkaWgzM1dSdkZUT3BOODdScnZBUXRSRmxGZitx?=
 =?utf-8?B?WDhxd3BPQ01zRFJJTFl0ZXByeHFLZWkrd0dSUjRQcTdmZENMeXdPcXFaZFpo?=
 =?utf-8?B?NFJsUlZKUHkwN1NCZFZxNGs1bTNVb2hIRElSVEhnMFovMVlFaFRXQ0xDVFhl?=
 =?utf-8?B?ZmFQcUxWdUNtV2MwUDFTcXM0dkpRbFpGY29sSzNzOUhsWllGbGEyaGlBQnBI?=
 =?utf-8?B?dWkrRDJUZE5MSVNrNHJua0ppVU5ENkZPakNzRkxFbXY5QjFwZnZVemhVMlYx?=
 =?utf-8?B?aUV4cEROdG1yaWcvYlkvcmkydkNBcWJZUW9OYU0xTmNYemE3UGN5S1dDbXov?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 678bf55e-af45-4dd2-3c56-08dab6977929
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 14:44:51.8377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqasveXXwllgnazI6Mup0IB/B9Fuv0O2O11Pqz6kP6Kc2QbZlsf94zq6D8QzEOH00pLM2eHsG26pA6lDIkVPBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6118

This is done to shorten line length in the function in preparation for
adding further usages of the vpci_bar data structure.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/drivers/vpci/header.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index a1c928a0d2..eb9219a49a 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -103,24 +103,26 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
 
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
-        if ( !MAPPABLE_BAR(&header->bars[i]) )
+        struct vpci_bar *bar = &header->bars[i];
+
+        if ( !MAPPABLE_BAR(bar) )
             continue;
 
-        if ( rom_only && header->bars[i].type == VPCI_BAR_ROM )
+        if ( rom_only && bar->type == VPCI_BAR_ROM )
         {
             unsigned int rom_pos = (i == PCI_HEADER_NORMAL_NR_BARS)
                                    ? PCI_ROM_ADDRESS : PCI_ROM_ADDRESS1;
-            uint32_t val = header->bars[i].addr |
+            uint32_t val = bar->addr |
                            (map ? PCI_ROM_ADDRESS_ENABLE : 0);
 
-            header->bars[i].enabled = header->rom_enabled = map;
+            bar->enabled = header->rom_enabled = map;
             pci_conf_write32(pdev->sbdf, rom_pos, val);
             return;
         }
 
         if ( !rom_only &&
-             (header->bars[i].type != VPCI_BAR_ROM || header->rom_enabled) )
-            header->bars[i].enabled = map;
+             (bar->type != VPCI_BAR_ROM || header->rom_enabled) )
+            bar->enabled = map;
     }
 
     if ( !rom_only )
-- 
2.37.3


