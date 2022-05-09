Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBB952013E
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 17:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324650.546790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no5Pj-0006fZ-CN; Mon, 09 May 2022 15:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324650.546790; Mon, 09 May 2022 15:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no5Pj-0006dQ-7w; Mon, 09 May 2022 15:35:11 +0000
Received: by outflank-mailman (input) for mailman id 324650;
 Mon, 09 May 2022 15:35:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xCc2=VR=citrix.com=prvs=1217d4990=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1no5Ph-0006dK-3m
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 15:35:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9948effb-cfad-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 17:35:07 +0200 (CEST)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2022 11:35:03 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by SA2PR03MB5820.namprd03.prod.outlook.com (2603:10b6:806:114::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 15:35:01 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 15:35:00 +0000
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
X-Inumbo-ID: 9948effb-cfad-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652110507;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=jFUZginQskNjPnmtkncsklCnP5tc+S/vTS+tOD5YSHk=;
  b=SkSvSCo45qDkEhIeUl8OMD+g0sny7PMcYgb4gWAzdA8NElMy7MDDi2KH
   X7Uiv2x/Q9+xTEGJUWQRL2UYQM9KbsXL3xHDidbbpF7XTzKSQk6+txU38
   LypD9n/d57wXh6yYnHoEAdTUc98+IQwlOKZqhLLTX+LI0UKXhvuxQ2lg6
   k=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 71304678
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FFM6qKD74z+ifxVW/z3jw5YqxClBgxIJ4kV8jC+esDiIYAhSlGxQk
 DNbHCvTJK7JMVJBSKlzYNy08hgP68Pcx4MwTAVkq31mEyNE9prOCNiUJ0v9ZnPKcZCfRR8/t
 ZoVYICbfJxkRC+A+03waee49XV3ha3RLlaQ5JYoHwgoLeMzYHtx2XqP4tIEv7OEoeRVIiuD6
 Iz5/5XRZ1X9hGQpPzNKuq6P8Eplta6v528W5QVjaaEXsAfSmUdOAcNEL8ldDZdZrqq4vAKeb
 7yepF1s1jqBp3/BMvv8zvCjNBdirof6ZWBisFIPM0SZqkUE93VaPpoTbqJGMx8K02TRxrid9
 f0W3XCOYVZxVkHzsLx1vylwS0mS6oUfpdcriVDm2SCi5xWun0nEmp2CP2lvVWEswc5lAHkmy
 BAtAGtlgiZvJQ6B6OnTpuFE3qzPJSRwVW8VkikIITrxVZ7KTX1fKkljCBAxMDoY36hz8fjii
 8UxSAR2dVfjbCF0F0oTNs8Ckrm1gWjHbGgNwL6VjfJfD2n76iVUieGoHP+LP9uASINSg1qSo
 X/A8yLhGBYGOdeDyD2DtHWxmuvImiC9U4UXfFG63qcy3BvPmSpOV1tPCgbTTfqR0yZSX/pwJ
 ksO9SdogbU08EWzZtL8Qwe5sDiPuRt0t994TLRhsF3Tlfq8DwCxGWgEEABKYYYfnugLFQAr8
 EaxgM33Gmk62FGSYTfHnluOlhuWJCMca0ELYyQJSQ8Yy9D5pcc4iRenZsZuFuu5g8P4HRn0w
 iuWt24uirMLl8kJ2q6nu1fdjFqErJXTUhQ84AmRW2u/9x54f6asfYnu4l/ehd5fIYffRVmMu
 lANgc3Y5+cLZbmPniGQROQGHJmy+u2IdjbbhDZHHYQl9jmr026ue8ZX+j4WDFxyLs8OdDvtY
 UnSkQBc/pleOD2td6AfS521I9Qny+7nD9uNfs7Tat1Cc51gbjit9StlZVOT9231mU1qmqY6U
 b+Xf8+jAncdDaVP1yetSqEW1rpD7iIx32TIXrjg0g+ql7GZYRaopawtNVKPaqU16f2CqQCMq
 tJHbZLVllNYTfH0ZTTR/cgLN1cWIHMnBJfw7ctKauqEJQkgE2YkYxPM/Y4cl0Vet/w9vo/1E
 ruVAye0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:kp/K06vH9+s0ZuDQHBR8whDb7skC2oMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKdkrNhR4tKPTOW9VdASbsP0WKM+UyGJ8STzI9gPO
 JbAtBD4b7LfBRHZKTBkW+F+r8bqbHpnpxAx92utkuFJjsaCZ2Imj0JbjpzZXcGITWua6BYKL
 Osou584xawc3Ueacq2QlMfWfLYmtHNnJX6JTYbGh8O8mC1/H2VwY+/NyLd8gYVUjtJz7tn23
 PCiRbF6qKqtOz+4gPA1lXU849dlLLau5p+7Y23+4gowwfX+0SVjbdaKvi/VfcO0aWSAWMR4Z
 rxStEbToNOAj3qDyeISFDWqnTdOX4VmgPfIBmj8DTeSIXCNUwHItsEioRDfhTD7U08+Nl6za
 JQxmqc84FaFBXagU3GlpD1v4EDrDvKnZMOq59ks5Vka/pWVFaRl/1swGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlJhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OGDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowlLau3ieffFm8Kc7giwlGl/NLAgF4vsulKRRq/n7WKfhNzGFRRQnj9agys9vd/HmZw
 ==
X-IronPort-AV: E=Sophos;i="5.91,211,1647316800"; 
   d="asc'?scan'208";a="71304678"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2CXBphqbPUDWF005CHglklJDzfviSIjePQBmDJIMIpZVm63MLTwLmVfCDFS6NrhATp83JWozn7iPG/nrS8qcpkkGOLTDuV5DSVyEPi6pq5aDe2xLhBEsdD4w1mdTALikkbBA8o49FgY/ofZEmmRzjZKUIi23EpOjnzSNSOAfS7tt1G6I+LRdDx/zK5c7vF7npd+T3fzYQ5najDOpVz3d859sYHLAeKKiZT+qlr2rqMQVocOPlRx3FLOgpjgdAJJ7eaDMlm/X8WfsSqMxkhFckBCN1F3jmWa8IDEeFNx3ipOISi7L2LHHnRxOAaETXyYih5Ysjpy8ejxdz9oDVna+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQloM8hPI4fMtoJMVnArrw57I8qAMa/XGbQPEd9+IVk=;
 b=Ef71g8suOYTUr4GGnXiadPDoWq7zW+bm1T0t+iQPauA0anAbv5C9SuBimnDUdAMXvlfj4nIJb+Wyanra4BZv7HfNjF7IVdJiRTsTiuBGKgr38ge9wAWlMiu1s6+61xx5danXgDNnN1WGvqxEK5txDCDG6po9/hTbKA2LWj91B9esmjQChYDmzYSO5KNjHSRW/Pxl0j2nPzl89xhqvGVlKv+mCfmi/4NPc9JVOmQPt5lO9BFKm28yqngggCiutTfTB6Wnig7dw7AJZE4bShgWWHwdO/qAxbYDW4Z2GR2ulOgPFMX/hTjn02hGOHJMGtGF46DjQ5tignOh0ef+3bpqEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQloM8hPI4fMtoJMVnArrw57I8qAMa/XGbQPEd9+IVk=;
 b=AR8NYfm7IAtEKgni7eXbxC2jta5PqgaFHYAfX6vU42abJxat0AJAMSjxivwrUYz0EHylmSq8B606r3k8ySSASW/lEcjJmRlU7CkX80heJv6T28KoTgFW4fYScME+QGU0aI4s6zLm0ovE8DpWa6TCPBoL78iNN9CCTwOdMNTUuHQ=
From: George Dunlap <George.Dunlap@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>, "wei.chen@arm.com" <wei.chen@arm.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v8 4/7] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v8 4/7] xen/cpupool: Create different cpupools at boot
 time
Thread-Index: AQHYYUDkkyUfpJQf80OfJO0ylO5+mq0WsiiA
Date: Mon, 9 May 2022 15:35:00 +0000
Message-ID: <71190A8E-EC33-4A72-97A2-CE9EC69EA0B8@citrix.com>
References: <20220506120012.32326-1-luca.fancellu@arm.com>
 <20220506120012.32326-5-luca.fancellu@arm.com>
In-Reply-To: <20220506120012.32326-5-luca.fancellu@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81ff1508-a0d4-4c28-02c8-08da31d17af6
x-ms-traffictypediagnostic: SA2PR03MB5820:EE_
x-microsoft-antispam-prvs:
 <SA2PR03MB582061157CFA31F3EDDD0F3F99C69@SA2PR03MB5820.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NoAZVkkAER6PrhSI7gBg22MZFPAoAUh5hqaIwcEUH1By/890uQV2p1ydtiCXm70ls+8U64iRz2YAC5UkSXmUlwB2LC22k4cPUR1IsDMhqJUZv8uaEIjI0jPBGJxK5mudr1OKZRRg2sgttAbZJAm63dluvvBkAdNDzHBn9xgIrE0KDxEDFxHIe3NTAtLBEOGR/Um1bCsnJYk7IfQ766x+QIJq7E/Q2t7F9V/crH2Nyy23jcRJ7OF1710QTO8Mmcq0q7qGPfQmo+nfou+Uyujp0kev2SavqfUt2CRMmP7hYJCzca+w4SBvBK7sUJVLVwV2tZalcJhmx/UzzL4/TxL4oK22t2E2xzEuk3T8GJbexso1Uo14tyAHGCpjoVwF4946WjC6aWWASPL0NY9DTNG6vCSCyo18NLwdNWLOkVG8Iw0Pv66MMv06jVCjt+2wlyMnYRAH0sI70VUNDM27nnwFCaO+d5UnPNURHtK0oAnu8k0XQPfgS8MoP15wivAPO4/JOk0UgTVZm52ijSfbQH7Zps4dqUxcNL4XsNrf77IDHT7RfQrtqE04uU/LUIUbqegNNnFf8cKcTLE3CNUqbAkpQoTC50oIgZPzC+t/dqCgXXAlhQ7zDJ/bB3LFBFPpq8RK4iFZt0MxixBt3XN2gWqv5rYL3L/Kfuql9UjO5ukWZZZy4KV8HoIO8WgKlv1LRzQULgUIWvUNOPWXdJUpwmuiNY6HnPcl44KQ5vhfDZdd/lbBnQTtjob5CRMAPtg1CMEd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(33656002)(2616005)(38100700002)(82960400001)(86362001)(91956017)(26005)(5660300002)(36756003)(53546011)(38070700005)(83380400001)(6506007)(8936002)(7416002)(64756008)(66446008)(4744005)(508600001)(6512007)(66556008)(316002)(6486002)(66476007)(66946007)(76116006)(4326008)(54906003)(8676002)(99936003)(71200400001)(6916009)(186003)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tNGmZOlgJrWXJa/Mum1jCYBSZH2yFcvblQlVC7GTKtI/Up8jDkM0yJdMr3q+?=
 =?us-ascii?Q?5XnKu/vS3lhyanbIwrcNxiTUbZCxpwhia2H05fLQIcsKQH4jjsgd3ppYGNvw?=
 =?us-ascii?Q?cnArZg2Q+cNc3YXIQ49HbUwt1g+MAuj8DjvqmDUskJGT9JkiAYzpdLBt8aMW?=
 =?us-ascii?Q?gbedxaDKyy8ktssvZ++s+X5NNQ6zP6U3ucovJoP9ftExtpQeyWN9+SDicejv?=
 =?us-ascii?Q?tG6fE4R8qpThRuOjVmAaHZ4chftQ6hArlHnSlUCyNIUpThGGBqtOP+czBgGb?=
 =?us-ascii?Q?pc3Px6b5c4Ty3ItkCIR1XsMRm6H5G69Fd352rmPqglBxk3/Ix6PdMcTkqjVC?=
 =?us-ascii?Q?SedvZJEPW2iOo+4KNunFz6p6tW19iKNV/Y41eXPrmcq6Cl+C6oWhreWsPxug?=
 =?us-ascii?Q?UEW2HfA1+jJjPG4RXXmpokfqH12/L2og9vT8dhRGnvGR9VX0UtILZKNXTRlW?=
 =?us-ascii?Q?mpvDKkiZYYTQR6mn2/o2gPd5WU8MmQUwvd1d0d24JzZkwAv6vDZ5B6LXYvaz?=
 =?us-ascii?Q?rrK7VdHlxPyJ67AwF+cHFCnx4VRKoaAid1slkfQtpp7jjqsN+O0lISNFEXxW?=
 =?us-ascii?Q?8zi9d5AXl+AZXx1FQXJ3FM6FevBB07C3QSyC5LDSAKYli6xID5colFQhdHPK?=
 =?us-ascii?Q?p+ATCNvVbBu/JXtkzHZ+SS+2VKf9lrZnAE4tLU9eqUdaIt4vx4NtAKzOI4e3?=
 =?us-ascii?Q?GpBqpci+FxZzX+KxKykFTBu6MG8O7bOJYG73ktC/YrSa4XhnTOSpxqqN12/B?=
 =?us-ascii?Q?YEE/xMkFYUqiNMf3lnoJG6CkiKO6VMbtHUcMmH55YCGK4rE59c7UYNVGJgiT?=
 =?us-ascii?Q?+8jTLqLxC8U6qVdWcS1OLfA4DKpbPEd4ctr13UqPzvQCa6Q0TCTI4usc8/rR?=
 =?us-ascii?Q?LzGlFzHKmdJddihIcCrTVgAMHetBJBAatv09NQ0ftuG5zUUBfjAvlSUcG1IM?=
 =?us-ascii?Q?f7zJopCLfoHjtQeVqyG3/kFlZHN4W75wxNmtLNXx4X4aIOQUKUOGSwSaCtst?=
 =?us-ascii?Q?GVrv8nkCpDHsWNE/AP78YriwGO+GbtZgU0l56KVnpP6qKLHyxWhdt0SnnXlq?=
 =?us-ascii?Q?ptPS4SEp+d7040dPUWkWMaRDmm8wl83TnRpeherQkc9hvZganJeJUYJ0jL+o?=
 =?us-ascii?Q?PyZPlukBCSulU4Pwq5UI3GlnpZozGcOeHOZHo6TFgTGjdjSvymjIljCtyfVW?=
 =?us-ascii?Q?SuRILhtESZjoPuN89SsyE5RezITZCwRdHb9S9dYbf/zWesc/EsPxo930cefM?=
 =?us-ascii?Q?GXpDg+X3u+EeNjDTEG4MEYoTHocTXLGUYYqZZjh3rQSEPIXcOQftiBWsCwBe?=
 =?us-ascii?Q?EKaSdHoRzuj4bXJtOC7WwX4oL+x5ay2uPKgZwqPY8pvZ4PVCpsE+Qqr14E9k?=
 =?us-ascii?Q?6HaKhEKLWpJArbagIeAwVg1gGlGW4TSGXXm6CIGgt/3oZmDWrmjIX3/XWEyB?=
 =?us-ascii?Q?csJzTRWWl5zBhcG29+k2l4CuqEars7voTelTmh6iflhpSa4YIxMgA11ncnpe?=
 =?us-ascii?Q?bjTDElgWwiT/dKnF5YonHTtbOeQGjvIuA7tlPM37DlAg3KNRTIomnmmKO2XG?=
 =?us-ascii?Q?2rVDNsOIAVrf8rigj8eDVJlAgyvwVDchiLFbpK+LTddOR6n0aiAn9b+rkP0h?=
 =?us-ascii?Q?WYBtHjg4ec4Psbtgp0ynh+B9oWV3JO/6a9oKvbsRNdmK9VEbhEFFpdiZ/tNz?=
 =?us-ascii?Q?CpeGr23OGIXvvky+E8ASAOtqkC0w35YBfijWIbW35VaWbffs4it9VDb9MUWW?=
 =?us-ascii?Q?EVkCOrjTHEYcET2COoY9V88UmrOmOKU=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4E702316-1A38-4A59-99D3-F06F9063C5B1";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ff1508-a0d4-4c28-02c8-08da31d17af6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 15:35:00.6590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yc7510TmwaOZ6F1sefqjbIbjQG6G+Uerb+CjIYwo3WDlq4v+/nLFRF4SobkvcK0rKQLoHyCgBdcqZx3DMzGh/E7CJ15eLrEhn197ZyVmENM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5820

--Apple-Mail=_4E702316-1A38-4A59-99D3-F06F9063C5B1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



> On May 6, 2022, at 1:00 PM, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
> 
> Introduce a way to create different cpupools at boot time, this is
> particularly useful on ARM big.LITTLE system where there might be the
> need to have different cpupools for each type of core, but also
> systems using NUMA can have different cpu pools for each node.
> 
> The feature on arm relies on a specification of the cpupools from the
> device tree to build pools and assign cpus to them.
> 
> ACPI is not supported for this feature.
> 
> With this patch, cpupool0 can now have less cpus than the number of
> online ones, so update the default case for opt_dom0_max_vcpus.
> 
> Documentation is created to explain the feature.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Changes to sched.h:

Acked-by: George Dunlap <george.dunlap@citrix.com>


--Apple-Mail=_4E702316-1A38-4A59-99D3-F06F9063C5B1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJ5NJ8ACgkQshXHp8eE
G+24YAf+L+4wYaAeh82FUYk7g2UnlV/xSWFU8i8FP8XLc+ogE5dSaVtskvnZ3J7E
GHbQiaYIz8fjF1d3FuSDTTV3+I+nGIszaVEPmZLz21nM9OyEAhZmLxYT0ZF6ZQhu
mPsLfVQYS0V0pju2tOjrvROAAFLIy5Ya9f04ROOrdQu70TiAIWy0AfEEgfShCjgU
iMLpjqUNoPBgdlv4zRh+lmMohzfAWx6vY2lZUE2yVhwUQ5HReL1RavAfl+Ip3UW4
IxKCwnYTPEZvKn9yCdzQPV4xr/U/b9Vt1srTNTZf/YublVVhoW3ZCsO6E8wZEFZH
HUdZQu6+OBU3K3eLFs8XfMGk8jwnoA==
=znIE
-----END PGP SIGNATURE-----

--Apple-Mail=_4E702316-1A38-4A59-99D3-F06F9063C5B1--

