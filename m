Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462ED55B921
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 12:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356437.584666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lz8-0004HE-B1; Mon, 27 Jun 2022 10:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356437.584666; Mon, 27 Jun 2022 10:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lz8-0004E8-6t; Mon, 27 Jun 2022 10:28:50 +0000
Received: by outflank-mailman (input) for mailman id 356437;
 Mon, 27 Jun 2022 10:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVBH=XC=citrix.com=prvs=1703a0240=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o5lz6-0004Dy-Tc
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 10:28:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebeee391-f603-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 12:28:46 +0200 (CEST)
Received: from mail-mw2nam04lp2173.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 06:28:24 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5806.namprd03.prod.outlook.com (2603:10b6:a03:2d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Mon, 27 Jun
 2022 10:28:21 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 10:28:21 +0000
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
X-Inumbo-ID: ebeee391-f603-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656325726;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0mtFCpSFN/y+j75DWraDGSeaZQnH5YMUcsGF4jT/8zY=;
  b=gEF+eonxIkT5SRYpi1g4flven2cIklvTAJvUgdIc5MuhDycFDzdgN5v9
   rAjJCDu3tlEAXwATVDF0GO2o74jP+gZLWW+89XHnaO/IWz7OmD6HHdnuw
   3n11DQzoqsTulGlx2q5Aw4nwj3d1pC1kI8Mej8kzfH/bvdm8rUsH7thSo
   Y=;
X-IronPort-RemoteIP: 104.47.73.173
X-IronPort-MID: 74906291
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TNfAlayLDQjVhM1SCx56t+fBxyrEfRIJ4+MujC+fZmUNrF6WrkUAz
 WQWX2qBa/6NajfxLt0lYdm3oE0P75PRmIA1QAJspCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY224fhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npll6KvRCUyMof1se0cCUUAIQtdYYxf0eqSSZS/mZT7I0zuVVLJm6krKX5seIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtacGOOTuoQwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgL2wA9gjE/MLb5UDc41R+2ZHRFubcZ9+oSPtvw1iqn
 zjZqjGR7hYycYb3JSC+2nCjnOjUhgvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGSwVcX0VRC8pH+CvzYfVsBWHul87xuCooLW/gKYC24sXjNHLts8u6ceTzEwy
 kWAmd+vADV1qaCUUlqU7LLSpjS3UQArKmsFaT4BXBEyydDpq4EujTrCVt9mVqWyi7XdGzv93
 jSLpygWnKgIgIgA0KDT1U/DqyKhoN7OVAFdzgfYRGuh6itwYYe3YIru4l/ehcusN66cR1iF+
 X0bwc6X6bhSCYnXzXPWBuIQALuu+vCJdiXGhkJiFIUg8DLr/GO/eYdX43d1I0IB3ts4RAIFq
 XT74Wt5jKK/9lP1BUOrS+pd0/gX8JU=
IronPort-HdrOrdr: A9a23:2yZwta6FYeor3YNlDwPXwS2BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcV2/hpAV7GZmXbUQSTTL2KgbGSoAEIXheOjdK1tp
 0QD5SWaueAamSS5PySiGfYLz9j+qjgzEnBv5ai854Hd3APV0gP1XYaNu7NeXcGPjWuSKBJY6
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWiSw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYErhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqnvd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7kl6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklWqvoJBiKp7zPLd
 MeQv01vJ1tABKnhjHizyJSKeWXLzgO9kzseDlDhiSXuwIm70yRgXFoh/D3pU1wiq7Ve6M0mN
 gsDZ4Y5Y2mbvVmGJ6VV91xNfefOyjqfS/mFl60DBDOKJwnUki926Ifpo9FrN2XRA==
X-IronPort-AV: E=Sophos;i="5.92,226,1650945600"; 
   d="scan'208";a="74906291"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6vmPTIeJwOTEP7W53XZe3nlAmOBj69FX0eR9RmnKWJsSMB8Qk8x9IIwuZf6cvsUk0WQVlIuN99TNV1vbVMkWyqweEZVOghfiTWoSpzyKo04DrnPO3pRp9oDUA4VLUMIGUhBbadIiRAas/sHtooeZCZy0xY53KK+vfiB9YhZEdTHcIpz+vRqeVBmWdgueygKFzWpY9ODvyhRMosFaIhuNEYq4YaHNxtf9mGzPjlQ9rw1jbaOV77m9g4AhQ/NoJNSqb21JvaEttGAOIzhjj/io06ydbemM3iJTzc/ES/SfI4onRs9y4x9IBneUqYFCpds4KTZztTf2hHeTR8Pk4vFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxGVPXuC/atwh/Z9xRoEJ7fhFahrpsLfKel2SZ+3ZaE=;
 b=jSOjLWqnFFRylnbQLbYba/9g1FTmG2H47/QvwjvhuCotI5yFprHcdI6bI72kpo+tPrMO2F6jU5dRZ0AUdsN3s07vwGxoD0B9l4d6AmmPZTlP/O5tUuQoKQURVRyJfInZn/8ImRofzGZNOjVYQo3rk6+z/Hm8DM783IXgPJ8LsdChMlRki1RZ6NkKxVhtC7qpiw3U0n/4wZSijRUOLMKX4M6Lt9hFj7Qva4HoxRZCQYnaTr7yWf4QmQNvU2QgPlnPpnxYJ2+TWX5aGCoW9cob6U+lyYL1eoay1+gKv+TTUq8w/fVE9QVW8cHMozZP4wxVzYYYfVIngy1zuDDvWOII8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxGVPXuC/atwh/Z9xRoEJ7fhFahrpsLfKel2SZ+3ZaE=;
 b=PDdnljUdekmOpytJMeiXiP1FnYLzo+Lo/cKGSsuQiRC6Fd0irQS3VsrRTT57R6FsW+4C5lSiOdfX5Kf2H7CxNci3CeZlpii9wZdqQlWU+OAFHrEqZ+6X67s4uu/DKJSIgTxdj7Ubkl+PRyX2mLGUN5he228XjGy2PdgpE2naD+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Jun 2022 12:28:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v6 1/9] xen: move do_vcpu_op() to arch specific code
Message-ID: <YrmGQj/W7KTzJ1vo@Air-de-Roger>
References: <20220324140139.5899-1-jgross@suse.com>
 <20220324140139.5899-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220324140139.5899-2-jgross@suse.com>
X-ClientProxiedBy: LO2P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c25f0d1f-79c8-40eb-263f-08da5827c227
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5806:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gNXAgqzH+A3pwASiN6ND33KGXaQ4fRBTxBCJlbs5R7JftLn7vGOBgeMjlfsAMjQXK+6iHxH8XLmfwR2WP6RyewHXXqDCPs8tAtAbT50cKau0Zq8qnRKW8e+LCiUTN+vVtt4h11w+nK/WzwNynaaEE6vXtgtidu7m/lE/rtieffoaOLybVNXT2pA6eD9cr0WoBsAXZU+OnuBoClgRPcfRII1FIL17u019NwYG/P06L5muINA3+TmkyNY49+fA2iCTT8eQy9bA0qs4BP+yI9P2xRmNGhzSaPKY0TJCiaUeush96yW0sWKvNhPygnjyoHyzW38YREwTRGvly7MQzg7aQZs2HmnJQ5D0nlwuQs0IumE+ny5FUHrOOybZwfwQyQIav5+VjzoX0tfFNVOh3FE9xYg1XhDitAlgNeO/YiGaRlVUL1qEArk1LiF3rCDRsukZfhzSwwZzHz2U1J6gdR6hHk/yFLTHLUUHLI1snYmq6ZWaG0sszd0ZYd3Y/33kMG5W3OUTa5vRzliCERSHzeDt/tPNCVEgi6XCUTOlA5LfNjYcwciLPbyWs2b+QunR0/Gb3rKFdzQBgvhAhEdSp082lpJWMmSJyl8BQbaMDzVLmJo7qwwWc0Gn1/A2sd5Kz+e6lVNA+hOfGhn3CRmLRIczD5JnP7GzKLDvx2V7hlYw6fDb/muYtjqmCu7VoA2TqRKruTTbkeCpqzJmzEhhKGWu84ypwN17sypEBwj9JdEOjFH8vyzJO7l70/+5+RsZc/yR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(366004)(136003)(376002)(396003)(39860400002)(346002)(4326008)(8676002)(38100700002)(316002)(2906002)(85182001)(6666004)(4744005)(33716001)(5660300002)(6486002)(6512007)(26005)(9686003)(478600001)(82960400001)(8936002)(54906003)(66946007)(66476007)(66556008)(86362001)(6916009)(41300700001)(6506007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejNkVDVMeExwaU9KaXpINXZFanI5bWdKdkg5VjBzRVRXVkNIRjhQeEtyUEFu?=
 =?utf-8?B?Q0NMQ0lkNEM1eTc3Q09xM0REQnJENGhySGh3WGI1cnBRTXA4am1ieEM5L3lt?=
 =?utf-8?B?TEFsN0R0dnU5TDY1eW1nQmd4VXRPdnh5M1RyRzY1UXpVNmk5SldnOXd0M1F5?=
 =?utf-8?B?QUZPdTlvdk5nRWFxR0lXa2h6M2xoVGtlSU5YTmxCYVBuU0IyUklXeVJjNXFO?=
 =?utf-8?B?UW9reDFMY1c1cjRHZkVsRm9wSDZNL3dHWHh5RzNWOUc4a1hqSmlvYVVsUkZm?=
 =?utf-8?B?WE9XVWp5NVU2N3Axa2pOOE9WbStpYUtnbUxhQ0R0QzNBa1ErLzdlWkg1YkZR?=
 =?utf-8?B?d1Vqakx4MmpNWnc5cEVVMzNRUE9lK0ttOVhaTW94WGloZVFlNFNmdkhEUGNG?=
 =?utf-8?B?Z1Q2bkkzb29VS2xqK0Z6WTlPdnNzMEJ2WFUwdUZxSWtacHNhTml3TVk0SVRl?=
 =?utf-8?B?eHZoOFRVVjByRU9qdERqeC9QU21IbFh5ZFpGZTQwSVRuZGlGU2Vud3BkUWJm?=
 =?utf-8?B?dVlhY0FnSkxHV2s2TXVvWmUwY2U2ZFNoSkkybEVoYkVoYTJlN0lIdWJOZFdz?=
 =?utf-8?B?a29JMTJvZE12THpjN2crbnJVNGNSSkd3OGU5aCtZMXNrWnVTYXJSSk9FMmw4?=
 =?utf-8?B?VUw0d00ydUdkTUdOZHVtdmh5aFBhaHlPZy9ubHhTSE5ITlNUVFZmNC9UYVVv?=
 =?utf-8?B?VTFXTE9JZUdnSFAyZHpSVDJXMzIxYnRvS3FlVGMzN2ZueWUwQ3paTjNoanU0?=
 =?utf-8?B?cVNLY3BEZzVJRTVhTHhpNXhMOForSGxvRWg5NGZVdElteXplcDNyV2JjUE5j?=
 =?utf-8?B?T2gvRHhiRFk1TndUNktJaFB3bUxZdEVDNXFJcCt5QlZLR3pUOEVxK3NsWlZi?=
 =?utf-8?B?MG1RaDFkYVc1Q083SW5vaFZoNi9QRGIrNmNIYlZ6NWxab2wrSTltTElLWlVB?=
 =?utf-8?B?azV1MG9SWnhmbFY2RjdYTi9zajV1S05NRGRMeHlqS0Z0NU5lRElvcWdlNDFu?=
 =?utf-8?B?WFdBbFZxZnQrRm1LYVJzWUhlZ1ErZ3pFTW1FQUFaS2FMUGFXOTlrQWZXb2JI?=
 =?utf-8?B?Z3VDT0s1eXVXbVdHK1BxRGk1N2RZOStKS3hqeFJleVJjdi9xQ0dEOWpqV1VK?=
 =?utf-8?B?Q09tbStadUlhRTY5dFZEc3dRWjdaUGU4WVRnVlF4YlorZ0x1K1BtNldsNVhZ?=
 =?utf-8?B?Tzd4R0tFanA0N3JIZ3pjL3VQTGtMenVvZTVkbUVKM2YxaHM4ZXVDMFd6eVRa?=
 =?utf-8?B?bHVwVXlhR0JIeTM1aDR6TksvMk1nNityNXNlRFNFdFk4Rng5cEI4Skd4UThV?=
 =?utf-8?B?UnBEazIvYlJnb0h2czdKTlZhR0JqVXFLbWZXRUNEc0JwdWo2c3c1UUZZQ0Ux?=
 =?utf-8?B?SEk2Uk5PY1lJY0IzaGQ4a2Q1UCtSamlvcEg5NGpRQ3hxNUlYQ1N5MEFYNjVZ?=
 =?utf-8?B?TTJGT0NnekFBalNjRWVYRzMwdHl6K0lRVW81Slc4WHc1b3Vac0daSWVQM1p2?=
 =?utf-8?B?dmw3WDNnVkVyUGpxT2c0MDhGN05rMzA0d3pUMXBLdDVqWFczZFFKQzNldTI3?=
 =?utf-8?B?ME4xUjFvajFtdmFVcmU1RmJaWmRQYmNacW9BS3lDa2w4TVRHOWdsWm5WSldT?=
 =?utf-8?B?OUZQbG9tTnhnRWxOd0NmVFFSaTRvckJvQXJuVnE0K0RMQkxVVUVUUXRwVXQr?=
 =?utf-8?B?RkpGMnhtQ1dMVkMyckJvQTFoc3IxZkNpQWRHcHI0aEdKQ3RCNjlCVGZTN3l4?=
 =?utf-8?B?U0VtN3JuYkJaTDdudVpUbEJnaTVRZzRGTndhNi91c0NDTTk0eVlkUndNSjRr?=
 =?utf-8?B?ckNZd0pZYVJURkVRR2lodTRKK1UxVWlEcDNrWnRCZEtjK3Awbmo3bTU5NFJU?=
 =?utf-8?B?ZjJ6empEQnJrTTJ3L2s5VzI4UERjamdHdFZwb2xqVzZiMC9NVjU1dXJCTWN1?=
 =?utf-8?B?cXFyZXpYbXZNb0ZlUzVoUmlzbUFvVjRHcGVKY0d1NE5LTzR6azFxdlV3YUEz?=
 =?utf-8?B?cTB3UFVvRkZCKzI5aWdjYUYyRDZuVVhtL3M2NldFYVVNbzQzV3BzK1B4R0R2?=
 =?utf-8?B?MjJTbUhVYXlubHBFeXVtUnVkU0txb1ZvNXhZT2I5cDg3bDlZVUhXcHJGaEFk?=
 =?utf-8?Q?tW4or4XQveDucvJ9BSLyr8Zzx?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25f0d1f-79c8-40eb-263f-08da5827c227
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 10:28:21.2691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vNOGlPYCK0WRQ/4mn5g9h2VMjQIl8jZxIIylrPdBXBYPdZ1Ivi0/rPZ0VgiQNYd2Kt1XFvnLxrP0Ft5zco9Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5806

On Thu, Mar 24, 2022 at 03:01:31PM +0100, Juergen Gross wrote:
> The entry point used for the vcpu_op hypercall on Arm is different
> from the one on x86 today, as some of the common sub-ops are not
> supported on Arm. The Arm specific handler filters out the not
> supported sub-ops and then calls the common handler. This leads to the
> weird call hierarchy:
> 
>   do_arm_vcpu_op()
>     do_vcpu_op()
>       arch_do_vcpu_op()
> 
> Clean this up by renaming do_vcpu_op() to common_vcpu_op() and
> arch_do_vcpu_op() in each architecture to do_vcpu_op(). This way one
> of above calls can be avoided without restricting any potential
> future use of common sub-ops for Arm.

Wouldn't it be more natural to have do_vcpu_op() contain the common
code (AFAICT handlers for
VCPUOP_register_{vcpu_info,runstate_memory_area}) and then everything
else handled by the x86 arch_do_vcpu_op() handler?

I find the common prefix misleading, as not all the VCPUOP hypercalls
are available to all the architectures.

Thanks, Roger.

