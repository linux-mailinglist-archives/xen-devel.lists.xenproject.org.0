Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1E442C4F0
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 17:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208682.364908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magLp-0007El-2f; Wed, 13 Oct 2021 15:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208682.364908; Wed, 13 Oct 2021 15:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magLo-0007C3-Vl; Wed, 13 Oct 2021 15:39:28 +0000
Received: by outflank-mailman (input) for mailman id 208682;
 Wed, 13 Oct 2021 15:39:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFKL=PB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1magLn-0007Bf-KS
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 15:39:27 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d1d6b57-631c-46c8-b9d0-9425c95999ff;
 Wed, 13 Oct 2021 15:39:26 +0000 (UTC)
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
X-Inumbo-ID: 2d1d6b57-631c-46c8-b9d0-9425c95999ff
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634139566;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CmtLkR6rkul89lMj6oQLuOyrvDamw+xd+ZeK+D6SyZ0=;
  b=SJ3mluirVeRwFvkiyZ4AldhyW4prci1ocIX4UiFXpYMVuq06iD7TQazA
   4EPjpk7S1NtGYKF8cCC4xKHokU/1FSXmefNptMySdpivp++ySVh90oGN8
   kMqhcToCE1bhkcQxH1hbuJq3qJad2ryGahbRTDXrpm5g6OeSAkTpO10MV
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 749edZJFVCMxSqJndnrlsAS047YU1nHiDVQ0gu8chpxkYe0EP+6owse4lSsiMj9PQS5Y1ww+vw
 zP5ochPcsHdaKa3Jw/SCDgJch5xEuqRL+lfFY6TiU7dTpaPJfLhRknqmjllUKtGGwq6YdwTCLj
 tLJXR/TG/16y/pq94cxhijUeYnGODaF0fVfaGaa9dVPEfYlo8rDqqPo/uAm1Zntt/rksDu+mDM
 eqSFH4XUUZMtBCFY7MYIg5ZlNP+yvVDq3Oexmd1Q1FIlKtnEY1DysQ5a6qZtm6lokwwfKw4bJx
 YEA2QfehrbIEe2GxUeEBzoS2
X-SBRS: 5.1
X-MesageID: 54674701
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XWyCRKommodg7Md2FH3N7lSOBwNeBmIDYxIvgKrLsJaIsI4StFCzt
 garIBnSMvmKajejfdl+YIiz80kB6pHSnN9gHlQ+qyxmRilD8puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncx2YHiW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbfqSlksOfDApOY6fBxGQxtjA7Z/wbCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0SQ6mCO
 JJAAdZpRASRRkVMKw04NIknrsaKplPeMGMCiGvA8MLb5ECMlVcsgdABKuH9U8aWSMBiu1eXr
 2PL4Uz0GhgfcteYzFKtzHWogePemDLhb6gbHra46/1CjUWawyoYDxh+fVG2u+Wjg0iyHddWM
 VUJ+zEGpLI3skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ8vc8rQXox1
 1mGn/vgHzkpu7qQIVq68rqXtjq0NTIiBGkOfzIfTQAF7t/gp6k+lhvKCN1kFcadjNf4BDXxy
 DCitzUlivMYistj/6em+VHKhRq8q56PSRQ6ji3wWm+m9Qp/aJSSW52z6VPb4PBDK66UVlCE+
 nMDnqC29/sSBJuAkCiMRuQlH7yz4fuBdjrGjjZS84IJrmr3vST5JMYJvW84dBwB3ts4lSHBS
 xXQ5wZWuZNvPlyFaLEnWZ+PEP0Twv21fTj6bcz8Yt1La5l3UQaI+iByeEKdt1zQfFgQfbIXY
 sjDL579ZZoOIeE+lmDuHrZCuVM+7nlmnTu7eHzt8/iwPVNyjlauQrAZLEDGUOk96K6VyOk+2
 4cCb5XUo/mzveuXX8U2zWLxBQxURZTYLcqvwyCySgJlClE5cI3GI6WAqY7Ng6Q/w8xoeh7gp
 xlRoHNwxlvlnmHgIg6XcH1lY76Hdc8h9i5jY3B2ZQz0gCRLjWOTAEE3LMRfkV4Prr0L8BKJZ
 6NdJ5Xo7gpnG1wrBAjxnbGi9dc/JXxHdCqFPja/YShXQnKTb1ehxzMQRSO2rHNmJnPu7aMW+
 uT8viuGEctrb1kzV67+NaPwp25dSFBAwYqeqWOTeYINEKgtmaA3QxHMYggfeplWd0qYnGfGj
 m57w34w/IHwnmP8y/GQ7YispIa1CepuWE1cGmjQ97GtMifGuGGkxOd9vCygIFgxjUv4p/evY
 /t71fb5PKFVlVpGqdMkQb1q0bg/953koLoDllZoG3DCblKKDLJ8IybZgZkT5/MVnrIJ6xGrX
 k+v+8VBPenbMs3SD1NMdhEuaf6O1K9Il2CKv+g1Okjz+AR+4KGDDRdJJxCJhSEEdOl1PYopz
 P0PoskT7wDj2BMmPszf1nJf9niWL2xGWKIi78lIDIjugwst61dDfZ2DVXOmvMDRM41BaxB4L
 CWViazOg6Vn6nDDK3djR2LQ2ed9hIgVvEwYxlE1OFnUyMHOgeU63UMN/G1vHBhV1BhOz8l6J
 nNvax9uPayL8jpl2JpDUmSrF10TDRGV4BWsmV4AlWmfREi0TG3damY6PL/Vrkwe9mtdeBld/
 a2Zlzm5AWq7Ipmp03tgQ1NhptziUcd1p1/Ll82QFsiYG4U3PGj+iai0aGtU8xbqDKvdXqEcS
 TWGKAqoVZDGCA==
IronPort-HdrOrdr: A9a23:FB71s6op569/akxIEM6IDBEaV5u3L9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NCZLXXbUQqTXftfBO7ZogEIdBeOk9K1uZ
 0QF5SWTeeAcmSS7vyKkDVQcexQuOVvmZrA7Yy1ogYPPGMaGJ2IrT0JcTpzencGNTWubqBJba
 Z0iPA3wAZJLh8sH7qG7zQ+LqX+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+qemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lsdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNzN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wqJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABKnhkjizytSKeGXLzEO9k/seDlHhiXV6UkZoJlB9Tpa+CRF9U1ws67USPF/lq
 352+pT5fdzp/QtHNdA7dE6ML2K41z2MGDx2V2pUCDa/YE8SjnwQs3Mkf8IDN/DQu1+8HJ1ou
 WZbG9l
X-IronPort-AV: E=Sophos;i="5.85,371,1624334400"; 
   d="scan'208";a="54674701"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=So2Prlqsh+zUHHG9R41Pu3tA1zJk5EShub5uH8QarMVNgHdKak4aZT+DXHka8LRFhtDbzdpZsPNv9l9Z7CoxhVpirdGnKlYSIwbcuz7Uhpxpt2YtKe38j9KWY2Wy0DhOZ48p4zuyCI2c+EufdhW3lUWDDwsHr4v7fec7eYLQeAOpQRAV6D+cEUsQ/xyVwKdY843cX3tpTlAGXP26fZEQzvce1dDaDf9ohs6mGC4ZdOcHo2iCR75C6JR1mazKFyFpQqnpv/dGm84zoOjcwYPv06DE/gfofZj+UqB1hNOgTmtOkuO4v8AAC3Dolb548/0XYgZwl9CO+zXXgfJ4oNpHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+JNnufgiK5AL08zA4CP6OX/9w2Or/DdvDM7ylSGL20=;
 b=GmrgI6zMyIuHjAWggYi0NuKK0ycWm8S5uh/uqS7TtiBxkZlD3WN6kb70JM0f2QAvk9bO0ielNNCa4R97eyZTC3+U6vhDBHV2zzVr/eA8VZnaVcnw7Rd+ATHCaeaOw6KdtlftlFMYSasm3zBr1moasgN7eYO81jTl78PnmF/x+GV0h8ciLOLrr6S3adzfe5FRhTTT9uJC+gXj0o3KhYr8T+3Hws/LWLf1el5ZHOCAq/ldbS+k640dSq1IBSJKIrfVd8vtOSGlU8Y5NlvI2c5dcsm1II7pHWgA3KsHpSiAEDD9v3DDFICydAU5P1d4/3c2VV9n7pMjqzYjCbNqi0Sxbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+JNnufgiK5AL08zA4CP6OX/9w2Or/DdvDM7ylSGL20=;
 b=K15QLjP3Yrp/VtNSfOqPee0VSxMfeUQ+tNXxmQzZJMi1WP+7NBO5dndZWsNdvJ9LE2efQv1Z+4aAHeqgtfOYtwRkAmiyn8mP3uJ5b+3eJ7U1TtUfTNDNS7Zd+4NxriwO0s4J2a3N5iMznOlSmTqfJkG7PdbkVqdvKUOdpNkQ6uE=
Date: Wed, 13 Oct 2021 17:38:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 04/11] vpci/header: Add and remove register handlers
 dynamically
Message-ID: <YWb9kgON0krr5lp9@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-5-andr2000@gmail.com>
 <2b575750-83a5-588e-fd6b-dd9cdb9500dd@suse.com>
 <e3730616-c51f-c453-3f74-584473313e54@epam.com>
 <672f00b2-3065-34f1-3dda-430edd8eb463@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <672f00b2-3065-34f1-3dda-430edd8eb463@suse.com>
X-ClientProxiedBy: LO2P265CA0438.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2cd4f7f-c06f-43e0-5782-08d98e5f9612
X-MS-TrafficTypeDiagnostic: DM4PR03MB5997:
X-Microsoft-Antispam-PRVS: <DM4PR03MB59977E3A3F43716AD2F5B18C8FB79@DM4PR03MB5997.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T9TuqtVHr+qngnaAw9v+MWWs8G/O4TQP72pRU7HUupW/0zJ5tGsNS4Sbz7x46nPpguB7ybiKk6FAV0E6bJsPPAC4zPmc/0pXVRup/pC1VsoYxZbNliwEHJ1onCLfbIKwMngoj9cCCVzUwLiZuVYJZp1it9ER5nynSQWJsmnMLG/zvn394iStslEF6c475sSqGtCRNn7R3vIoe4wahVw8a8gUUwFZFNYLrcAFWvbcN2Ye7Shgi+qpIJR8jqS3In4uysP1RnqKDBIrT3Eb1CLjM4Vb4OPEM+zNG87wCYzcGLHU+0t8rM16j8YJbeI2F7aL1Nmechl0Qut9HYTa92RkP5faK6556eSUp1Io+lb8Km5dZivHWjckDCR+H/e652GSZ+7BoJd4qgTt3umuxuGMJ7Ryzdl67BDZ/z+8U6d3J0KKY2og+NxTms2967BVe4Bfw6mvei4c7uNmme5getZIFOJW9kReZacD6I8L5cPJ3Vz8uDRy3G8naNbgNs2gskFuYhsY8eHGDSMnJ8Cj7bQ2rkelcshzgx+A9I+TL/QOi3EJEY0Lh0EOD2HSk79WdQ89/EZHyXeZXys0GXQ+yLXxVhwLtG1XuM/RgCwpXWJmNDxBaE1J5PzOVKqfHk8tx9iuAoVSnsgLvo/R6G+u3OWeXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(8936002)(9686003)(186003)(8676002)(2906002)(82960400001)(54906003)(86362001)(38100700002)(4326008)(6496006)(85182001)(6666004)(66556008)(5660300002)(66476007)(508600001)(7416002)(66946007)(6916009)(26005)(6486002)(956004)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjFhTkFZLy96OWJUSk5tazhyZWQxVFEwTWFlT1lacTZmZEVrZGU5enpBUVVp?=
 =?utf-8?B?VHdLNW9lMDExZmp3OFdqOWpkTVNOa1lhc3lNUFlFVFpvNDJmK1ZTM2dtcG9v?=
 =?utf-8?B?S051Rm9lWXpWM0gxdWhNSzRLTmFSbWxmMTNHTkIrVG4vTFpTYVJydTRhZEFu?=
 =?utf-8?B?Y3JyOFVwcWlxeml0Wm1xTHRiazhnOXVJUnpPZlludHJ5MURDK0l0ZUk1Zjh5?=
 =?utf-8?B?V0FZeWpwNzlONVBPZzhVWUlDZUpPN2gzL3RsV0NRejdac1F6dGczKzRRSXl0?=
 =?utf-8?B?a28zZ01kQTlOU0FKWHRPSlpPMEo5aEZnSU5ja1VHbzhOVlU4WDlMaVdPN09u?=
 =?utf-8?B?L094WUhEVUVHYi9ZQ0xFeEUzaXJpZGpab3gvTXNFL2NlSnRqS1ordGkvQzgw?=
 =?utf-8?B?NmNqd3lpM3NidVFtVkxZMmUySVdscENsQmVjU2pFWExvVW0xaE9jOE9PZGkz?=
 =?utf-8?B?UC9wQVRXcitDOVBSMi8zaEdQMVBXYWVicWZ6SFUxK0NhZlgzOFR4YzFoQXJw?=
 =?utf-8?B?LzJlSjRHbk90eUswVVh3d1QyVkpUWkVzNVQ1Y1Z3N1dGb0hOcVhEWSt4dXVv?=
 =?utf-8?B?NVZscVcvWG5IdGpQSFdqUWtaMXRpQjR1bkhrRCtCMUx1TWtTdTZ6T0VkVUw5?=
 =?utf-8?B?NHZuNGFmKzA0VUtyVHNkeFM1NFUzS0lhWUNYTU1rOFBFWHhIeStuTWVSRndu?=
 =?utf-8?B?TElwODR5SlFXbzF3ajh4Y25LN0E3RDlhb1RmYVNDcDhGY1BSR2szNGxROVVL?=
 =?utf-8?B?dFI4anRhdWVKUFRNR0ZtU2hPOHh4bkZXTHJxOUJERGtHaW4rWXg0OElZRmdR?=
 =?utf-8?B?NGx4Z2hzQ3ozc21McUFhbWhyOTBmekdDTlRHY2FKb1pOSHkyZzRraGRxaXl2?=
 =?utf-8?B?dGVZRG9helIyTWxYUmd0SU5PZloxdmxTdmNOenFqaEgrZnVKUW01eUlBa296?=
 =?utf-8?B?bW9zQjFhOWhFWHdHWVlEbFBKRnBEQ0RWVzV2N1grcGp6bUpkdHEwZmxuSTFw?=
 =?utf-8?B?Wmx4aU9KWlJkOVFoYUhsNnFFdXpEUHc3RXlUeitJN0hNb3J4TUN3b1l6SDJN?=
 =?utf-8?B?cjZMTmlCWWpOOHB2OW05QlA5T0l3ejNXQ1NVSzhiOWlneXJNb3ZnMXlKN2s2?=
 =?utf-8?B?VnVLUkFnMjRUanJXdHFwQW9aKzgyWk5DU25JUUU5MlluNmFVa2VwYmVrbnBT?=
 =?utf-8?B?M2FlZjdiN0gvUEVLMHlJRWJYTVdVR3FtNnBFZjhaZ3pqWHF1M2pUUi9vdmU0?=
 =?utf-8?B?NVBKQmwvUzhocE92eVlwZ1VPWlYydE1rTU1zWGpYSUtjMkpKL1M3Y2dwazJu?=
 =?utf-8?B?YjRoOWhOd1dtNVZYMHdjdFFrdFk5TDdoZnpjSHAyTnVtUjFOUWoyWUpac0cy?=
 =?utf-8?B?cGdVeHpkY2Z3UTdheUFKRHAwMzBJdzhTSVo3bjhiMHlmbWlWajFBQUxUenlG?=
 =?utf-8?B?SXlVU3M5RytNbWo5L0dUTk5SdmdzL1phc0xneitEL0EzWnZ4Ymo0dzB3TWsz?=
 =?utf-8?B?OFlDVHdHb0dNbURIWEFSdW5jVk1reEJBT1BnbGtKYmhaTGpqeWZETjd0TkIr?=
 =?utf-8?B?L1BhejNUMjVzTGlWRlNsdmwwTGJGSURwM0drQi9oakxibnBWYlVqZTN6dmhi?=
 =?utf-8?B?YkJqQ2QyTW9JaUNVMlZ4RWNWaEdVWE9PMTB2WWZCWktoV0wyYjRhSmMvNUdo?=
 =?utf-8?B?anQzemJXVy8yUjh5azZ4dW5jYVhxY3hMc0I4aXBWc2ZUQ1RzUnJMeUhWTUZr?=
 =?utf-8?Q?zwh+YnbZ3ajl+D64CCRxW5S3z9dYs/xpI2nBMHk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cd4f7f-c06f-43e0-5782-08d98e5f9612
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 15:39:04.2608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bc0ltS8rAndrQRWV89qtr/CUUMoThqYUG3L4gIR5Zw/qWPy1NHL0ssmf0rs4DNtW9pJou0QpukhAPbF1aU7OJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5997
X-OriginatorOrg: citrix.com

On Thu, Oct 07, 2021 at 09:22:36AM +0200, Jan Beulich wrote:
> On 04.10.2021 07:58, Oleksandr Andrushchenko wrote:
> > 
> > 
> > On 01.10.21 16:26, Jan Beulich wrote:
> >> On 30.09.2021 09:52, Oleksandr Andrushchenko wrote:
> >>> @@ -445,14 +456,25 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
> >>>           rom->addr = val & PCI_ROM_ADDRESS_MASK;
> >>>   }
> >>>   
> >>> -static int add_bar_handlers(const struct pci_dev *pdev)
> >>> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int reg,
> >>> +                            uint32_t val, void *data)
> >>> +{
> >>> +}
> >>> +
> >>> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned int reg,
> >>> +                               void *data)
> >>> +{
> >>> +    return 0xffffffff;
> >>> +}
> >>> +
> >>> +static int add_bar_handlers(const struct pci_dev *pdev, bool is_hwdom)
> >> I remain unconvinced that this boolean is the best way to go here,
> > I can remove "bool is_hwdom" and have the checks like:
> > 
> > static int add_bar_handlers(const struct pci_dev *pdev)
> > {
> > ...
> >      if ( is_hardware_domain(pdev->domain) )
> >          rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write,
> >                                 PCI_COMMAND, 2, header);
> >      else
> >          rc = vpci_add_register(pdev->vpci, vpci_hw_read16, guest_cmd_write,
> >                                 PCI_COMMAND, 2, header);
> > Is this going to be better?
> 
> Marginally (plus you'd need to prove that pdev->domain can never be NULL
> when making it here).

I think it would an anomaly to try to setup vPCI handlers for a device
without pdev->domain being set. I'm quite sure other vPCI code already
relies on pdev->domain being set.

As I said in another reply I'm not convinced though that splitting
add_bar_handlers is the right thing to do.

Thanks, Roger.

