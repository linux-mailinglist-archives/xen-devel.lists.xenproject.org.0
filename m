Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B0E776BDD
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 00:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581396.910074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrJR-0004CY-5K; Wed, 09 Aug 2023 22:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581396.910074; Wed, 09 Aug 2023 22:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrJR-0004Ak-1E; Wed, 09 Aug 2023 22:05:53 +0000
Received: by outflank-mailman (input) for mailman id 581396;
 Wed, 09 Aug 2023 22:05:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkWR=D2=citrix.com=prvs=578b5fa55=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qTrJP-0004Ac-3r
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 22:05:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e468d388-3700-11ee-b281-6b7b168915f2;
 Thu, 10 Aug 2023 00:05:48 +0200 (CEST)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Aug 2023 18:05:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5580.namprd03.prod.outlook.com (2603:10b6:806:b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Wed, 9 Aug
 2023 22:05:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 22:05:41 +0000
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
X-Inumbo-ID: e468d388-3700-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691618748;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4PNHQ3QIFvXym8exbv2duveRtPtQM96yFsWD7UI869o=;
  b=TZhOz3vuMQ9rXYHY8MW8Qhdelrlo/u8eOubyDqBuh8ownvS0jovzm42s
   x6j8toU89GKFLaptsyGTkxiWMzRISTQO1DNeMsnGRX7syphtQpbNEJh+7
   bizm78gWcT5/haCIHQ5dH07bFUuW+yQTZITNCC9bB75MGznTXWXcgEuNi
   4=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 118924847
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ywmgHqo+d6dk2ev3niyYAnLNlwFeBmKJZBIvgKrLsJaIsI4StFCzt
 garIBmDb6qKYjGkfNB+Po7j/B4G65fVyoNgTVFoqyg9QypEpJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weOzyhNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAB0pcg/ap8ub/IOQacU0p+kkCdvkB4xK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6472gHDmjN75Bs+SUKe4qmkoXCERZFGD
 kY/5ScLtqto6xn+JjX6d1jiyJKehTYHQMZZGeA+7ACLy4LX7hyfC2xCSSROAPQGucksVHoV3
 1mGt9rzAHpkt7j9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5LG6mwi8DzGC3hh
 TWDqiExiq87ncMNz7+8/13Mn3SrvJehZgw/6xjTX2mlxhhkf4PjbIutgXDZ8PJBIYCxXlSH+
 n8elKC2xu0UEYuEkiDLZewXBayo/N6MKjiaillqd6TN7Byo8n+nOIpWvzd3IR4xNt5eIGe4J
 kjOpQlW+ZlfemOwarN6aJ6wDMJsyrX8EdPiVbbfad8mjoVNSTJrNRpGPSa4t10BWmB1+U3jE
 f93qfqRMEs=
IronPort-HdrOrdr: A9a23:oanwGq2I7vpbOdaF3CkQkgqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:htX+D2O3eIcEru5DdQ176xc0M+0ZQ1b+4C/xDkidG2lSR+jA
X-Talos-MUID: 9a23:NmHCaAXnBQhE6+Dq/CP1oXIyKexW2brtEWUHuooLntKHbzMlbg==
X-IronPort-AV: E=Sophos;i="6.01,160,1684814400"; 
   d="scan'208";a="118924847"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcfpDi53g7l2eThGuyl4KaTRZsGZ8lg3TyxgbLpSAVr4hZABa9nLGbY+a3gpwBj0q6Wr6+7F1EskTwx0N/vlp78gsvM06B2wwvxlCHTKjQexvRFbcFlg2u+b0KRbCsZu4ZSlB5FARD3UyrlzQuN3VqWTjHdLa4ylYnMIQfZxNHZhROuKgsZT309mG/umt8Y2O0+uBcdFR7zFwOC/Utw6ttD5Zd9HZjg6ME5pL23cuflCvNRpxKSRQsguXY/Je8cQ2Rf+ImPp9G+28kiSGG5TtQF2h+8P63vVhLfL7CRPJ1SnXyKLB+ILmjTQ7zT8jNlOYcyVLTQIgetLOm9i6rI1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PNHQ3QIFvXym8exbv2duveRtPtQM96yFsWD7UI869o=;
 b=kBeIJ2duSB6/Cl+WyzUiNzR4g3Ma23doJCIL1uT4Dxn55+Md7Nax/ZzYfBZ4j4L6V4qp5eHCKZILI8bmX4sCKJedKJBGHMY9eIyAdTdQsRH6XHpVsWWdsQbxSRff/UFDxz9Dpfe44NFZKMoXA2Gm1zJuPIv+65lk7VEc6cYgUd7LnUa3nk00rwNy+Bz1uzX0G4wMJqxmU9wFEDKx7zqaE4Ux7+p2MtWrK1O52NhYT1nEZxF0s46tTOu8YKXmavxE44MkOWzX39cWWztqBB7oe0gcNlwnOgEHSw6MJuWJn3kD9r8or3Jk9hGWIZQe9lViQULbbTIflVHV4oFD5sI3JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PNHQ3QIFvXym8exbv2duveRtPtQM96yFsWD7UI869o=;
 b=bm2xXN03NgoYqtGSsOdKlGzkCB0ONMXOJ2AHdsLJof2OmQ7FfxjuHXDEPiZtfYAl/o05M8xxAJ14d5v0p0WfUCWpuW/uYQAvCLWFjDstJobWVcsy791H+S5XLfYz6bsa1d7g0cQAPKGzDnvuO95vY4oTxHeS7ZqUo10lxujMUHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1ac14ed0-d489-0efe-0b0c-200792a50fde@citrix.com>
Date: Wed, 9 Aug 2023 23:05:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen 4.18 release: Reminder about last posting date
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <AS8PR08MB79911746BC3D82A6341EDA6F920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <ec8e75da-743b-50dc-4665-854c446c974e@citrix.com>
 <alpine.DEB.2.22.394.2308091437200.2127516@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2308091437200.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0412.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA0PR03MB5580:EE_
X-MS-Office365-Filtering-Correlation-Id: b1782737-f5bf-4955-de41-08db9924c54c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/kOn0vrcUk6rBzMiIbPgxUb+jc4911v0lFnDkIuKDWz5Bm7jPzxUXSxlECf654v9ZD9eoibaz2Fez9EAMnn3xq4gX60/zPs6x0U80T/OyWOSFWoU5m9uPkU6EPBPtjxRtfsurWHUgQYHHeE0oiMGAWSamOoiDiiH9O6Wlj7n7xwT57Cpgq6EyPnKN7k/OmT6CMBkA4A/celExUlFSd4jWHjslbgvWehaY2uD++nAzf4OrGPi0twXHCsurJhrn0YLPVydInJrGfGACb6FK+2TJXYYRNS7XB3H9izFVwa0TTp620g653Krhk4afHyYkuv/QMuvK6mmXR8GwRgFTPCUl4pCJbS/jcs+AXYRjVUndD5tieNr4gkzFS3uhYWu191nuLJqrEwjc1m/jTknNV3qNaa+bAyeBq0JTYwsRxn5dGgIhaMLwRj3PBItfZ7DlTtcrRdmZCPQr7oYEnJFulE7i0h77vCyjmAN7DTDhFYOxyErGPyVablTSh7BS/KKxaeGsbePvRKyweeStO2ikGfkXFDpP0Y1DbjwAlE/pWz2smRe3lhZNPDiWZjgDdxxYMOw6/hItGZJzSsMdz77ODyp6tg9IucH+Ud8m1UkYP//AqtfxozbUzS3wpsVnWVCIOL9IFaE+0JsBUgP66RI7xpTig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(1800799006)(186006)(451199021)(31686004)(66946007)(66476007)(6916009)(54906003)(66556008)(6506007)(53546011)(26005)(45080400002)(6666004)(478600001)(36756003)(83380400001)(2616005)(41300700001)(316002)(6512007)(966005)(4326008)(6486002)(2906002)(86362001)(31696002)(8676002)(8936002)(82960400001)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1ZHYVFMOGZ5QVAzbFFLenJ6UTBUWk0zSElqWFNOL1JCazFHOURhTDBLUVpD?=
 =?utf-8?B?aUxzZFNGSDI4bVpOSnlGNTQrTVZhSitCOWtYNExKa2pYYzJ0YUpyVDVZSXNl?=
 =?utf-8?B?SXB2NFdlQStnQmFIRjJ3bnQvVzIvalpFdExXK0duZXFpUWV5YllsY1RKdzR1?=
 =?utf-8?B?NFJFb0ZWajREZm9FMHZRTEl2UUUxWHRGNTZ1ejlMY1RjUUsrMWNlWE0xMUFO?=
 =?utf-8?B?Z3d1WlR2VmhJTzQ3RUc4YklBQW11LzVZRkc1clg5OWpUOUJjSUoxL1U2alNz?=
 =?utf-8?B?cmRjbnhXdjFnTW5iOGJRZUphVjZnQjZFSExFK092NHpBbU1DV1JJaU9QUnJl?=
 =?utf-8?B?R3luZ3RLR3BPRkFocU9LYkJIMGhDRDlpWFgrMTh2ZGdyMVpVMUZpbkI0L2xI?=
 =?utf-8?B?bnE5QmVVTXRZNDRldytURFpOUXp0VWYzUkxMR2gxcy82eTZPK1JXRm1zNFJ6?=
 =?utf-8?B?UnVqZUU3YVl2SFpJeWZGdlhLQ0xicjJ1RERuSzdqMllQU3pZa3ZTWklJSDh3?=
 =?utf-8?B?SXR3eU1lU3JTMjh6bG9VQ1FXUlF4bXhiOFpiRVRvNFV1MDdrbmNCYW54bGZ6?=
 =?utf-8?B?WmRJQm5zeDJqK0tEK2x6bVNkWHJYSkhJTGdVRkdEeS9kZWlTMG5NdklpV1dG?=
 =?utf-8?B?dUhrV0MzTUd5UFJyNHFGbUVCVjBOTnJRNTlZSWlkM0t2MjdHay9EUkZvWDBJ?=
 =?utf-8?B?eVloa3c0SU1GSGtpZ2VYY2pQL1dQalFSaS9wUFVBS3FSSFZPUEl6a212M1Ny?=
 =?utf-8?B?R3crZDE0Q3BDZExRblJIVDZjVExSbzB1NzE2dFRKWEJRVXRtanV2Y3lPT2dX?=
 =?utf-8?B?WHlYQ245WllJU3RCWUxybmxaMmJpaXFIVTZ6MTlpdDRCR1Zxc2lBTHNVSTFW?=
 =?utf-8?B?QldRYVU4clZXYWtzaUI1TDJkR3JZV05hdDhqSUdBM0NON3J3RE9XQ0lTVE1Y?=
 =?utf-8?B?Q245NHBQRmdXekN5dmlpSjhCUEhKbHNvRU9ycjljWXNsYmI3TDFUczhBZXho?=
 =?utf-8?B?MksrQVhFVHA0cVE1aGk2cGN0VWJpTE1ubXZ5OTJoM01BRSszYWlWYjU3RWVQ?=
 =?utf-8?B?aHl3clJKVFBKWk9PeSthdUZZMDhSbUJReWp5dmxHSGZML2JEUnY1VU1jZUNu?=
 =?utf-8?B?a25VNWIrZkhpa1cxejFFS0o5V1JGbUtsOWdLWDRzYWtVeHIrblVYT0w3TEg5?=
 =?utf-8?B?MWdHZlJtK1RSVGpZVFlvOUtvL2d1TVMyOGlYdGQyV0RiaHMzS0dJdnlBQlF0?=
 =?utf-8?B?czZTNzhtTTMzMlFCNHROR3VlVjdMRmxDWWJLUklMeVZxRTAzOXY0THFhbUZi?=
 =?utf-8?B?aFpyY0JaeW9VNThjRVg1SmM1b25JOTlFbEJxb1Z5Wk1rUzVsTHFpVlUwQlJY?=
 =?utf-8?B?S1NpV0txSXZtdlZvQUdqakxQNlJ1dnlBdHBJZXZ2VW1MTTJCdjFvZXhhTUJm?=
 =?utf-8?B?NTlDVjFwU0VScEpBS2J1N05XSnMrc3JGK1pqd2l3K0wvVGlQQ0ZXQzZrejBz?=
 =?utf-8?B?dkM1a0hqck1CZld4M1dtbEJ0Skp5WlYxRFdjRVpBeVoyK2tpa0VjUGhiVElF?=
 =?utf-8?B?a20rWTFrd05pWVA4SHpIcGhKcWhQV3JvZDJUcmg0MVk3WmNEWlZMTVNzYjVr?=
 =?utf-8?B?TlhWZDcyQ1NTU2xaZWZLUHM4ZlVvbEhoRWgvdnBFZkxHZyt6Y0lGQ1FLU0FT?=
 =?utf-8?B?QzZOT2hBWWFMS1l4eWZzdy9CbElndWFyTjBSNTRCQjNFcjNuYkNFeStZVHJ5?=
 =?utf-8?B?WlBSM1FDY01ibmczcndzcTZJbFoyZ28rMHp0anJvRUk5OW44d3NnMXhoeWt2?=
 =?utf-8?B?V014VkthUWJvVis1Z3BXK0NpTlRzdDBFNnloTllMdG9KNVozQ0w2dXZGRHBF?=
 =?utf-8?B?M1ZmY09RMVprbGdpQUtobDlSd0J6UWkrZjVqcloxTFRsc2lCQ3N5T3ZGRDNw?=
 =?utf-8?B?VGYvRlRiQjZPZGNsK1Y2UkxRdWJNSlloMWJJOXVzRHdLT1I5bnhybTlPNEI1?=
 =?utf-8?B?d28wK0U3ZXlzcUQ2NVlvenRSSlFya2UzU09ha3Q0dzJHbDViNnU5d1VLMFdp?=
 =?utf-8?B?bU9rUFA4MkJrRVVIMWlGZnlFUzV1RVNPaHVxTExZcHVTdFNRS1B6T0ZoVGwv?=
 =?utf-8?B?aXJGV1NkNFF1Vm8rTEU2RnNVQUJ1aHI5V2ZkM2hYYURBOU9JanFGQm9WWE1q?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XUHWlxCwKtfTPMzt3yZi+BnfcykH5th2DDa4Q9QJOArWN1/ObjyEuxnSL+agQIiSGz1sUTtV8ynTpOR10WkRlL1a2jK7H6mnfrWSX/wohz6KHqWrSMDRqphNyjOCgj/UuJH2/GpyT4tYiFVdomSH6NuSH5nCpkqKluwGfhc7cYtYoGMuWF0dZRXv8PJxPz3mnhpWLHEoj6jaHFM8hsMeXu1CEvln2M6D5XySqIo7vSbOVlx9/rBXXt9KWk+kzCzDvQ2kglbk2xszd4s8ERKN2hCbmEG1qFzFtc0htcLQv9ojSPJlB7Z1epk1I1R2HttgrBOvoQaS0Xg4cwO+7jPhJqd0hW0lKINH6SXkcXIcej2N2zfATrHzE04NoncnbtkMYGPE8OrcYG1w1Vh5winVIKaMTn6vg6xCoSMwqRSpFu9jYjFdkhR08bzpgSV4XfAGrOpa6Ds6VtB+VCzQWdkGPMJ49gdzZ5tz1+HycALa0LCVU7kbYfiFCzDlKko5+LXnncp2EJfqO7X0Clgiz+owomO62nEMQw+c/KyOfGhEV6MiwoigDnc5y38ynigLQ7i+WIWDKT4Mvv6yW8yM4rPOQT7iOQIoPcb9Y7bPbDYmG75SkkD/X0DE6xLcGwZsMR6AZZQ/9253bNKpZFF1JZcTde36l34FUCWMWCu0LklNQ0inpAtSHoaBElu0eeNALI4C4h+9JCrWX63USs92UyVBsBNXDCGXFqOQUmgAjuG+MkrDcx+MQVlPtGJJOdpLYb48+HXKQShO3+yPNlM6ukieqVPaW9ycQ3Z3CqUAHzE55b2SgQ6YkcnRZx/esVJ3AwNDiGP55+XRJlOjyp3RqknesjU2rOe7ce61jMCQ6q4Gxr0R9ZnuTScWbI6Tz5Flxchjl7NYNMcPP1yFWI2WCHKKUrf6vold+SsDYc2oV/etuVE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1782737-f5bf-4955-de41-08db9924c54c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 22:05:41.3127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqAprbj5GQokTOPntrsG0D2xSj9+xPGTQw54lIle8Ha0cpV1g6cGdWaD0yojqgngClfaYKZ1wBOrHs0+UY17IghYGnmNvUs/R2c2YQcDt4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5580

On 09/08/2023 10:43 pm, Stefano Stabellini wrote:
> On Wed, 9 Aug 2023, Andrew Cooper wrote:
>> On 07/08/2023 2:24 am, Henry Wang wrote:
>>> Hi everyone,
>>>
>>> Following the release schedule discussion in in April, I am sending this email
>>> to remind that according to the release schedule [1], August 11 (this Friday)
>>> will be the last posting date, when patches adding new features are expected
>>> to be posted to the mailing list by this date.
>>>
>>> Also, note that we currently have 1 release blocker [2] which might need
>>> some attention.
>>>
>>> [1] https://lore.kernel.org/xen-devel/AS8PR08MB79919F9CE0B2BF80E7103FB592609@AS8PR08MB7991.eurprd08.prod.outlook.com/
>>> [2] https://gitlab.com/xen-project/xen/-/issues/114
>> Off the top of my head.
>>
>> There are still unaddressed Gitlab bugs from the Eclair integration
> The bug you managed to find it is now fixed (commit e55146071de9). I am
> all for fixing Gitlab bugs so let me know if you find anything else! I
> am not aware of any other issue with Eclair at the moment.

I meant the one where Eclair is still running on `smoke` and twiddling
its thumbs for 1h doing so each time OSSTest says yes to a push.  It
will be a missing 'exclude' somewhere, but I haven't hand enough time to
look.

>> and other Gitlab bugs (use of unstable containers) which I'd unwilling
>> to let 4.18 be released with, given the pain we've had on the stable
>> trees trying to keep CI working.
> That is fair enough. To make this more concrete and easier to track, the
> following would need to be changed to using stable containers:
>
> - .qemu-arm64
> - .qemu-arm32
> (I am not counting .qemu-riscv64)
>
> Andrew, is that what you meant? Am I missing anything?

Every debian unstable container, and the other containers (OpenSUSE)
which are using an non-specific upstream version.  Upstreams which
really are rolling distros (Arch, Tumbleweed) need to be made non-fatal.

Then the second part which is also a blocker.  Update the distros we
test with to be less obsolete.  e.g. the majority of our CI testing runs
with Alpine-3.12 when EOL more than a year ago. (2022-05-01)

~Andrew

