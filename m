Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E3E50E2C2
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 16:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313030.530493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nizRT-0005hz-MP; Mon, 25 Apr 2022 14:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313030.530493; Mon, 25 Apr 2022 14:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nizRT-0005gA-J2; Mon, 25 Apr 2022 14:11:55 +0000
Received: by outflank-mailman (input) for mailman id 313030;
 Mon, 25 Apr 2022 14:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2itc=VD=citrix.com=prvs=107928106=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nizRS-0005g1-1q
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 14:11:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6672530-c4a1-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 16:11:52 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Apr 2022 10:11:48 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB4597.namprd03.prod.outlook.com (2603:10b6:a03:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Mon, 25 Apr
 2022 14:11:44 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 14:11:44 +0000
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
X-Inumbo-ID: a6672530-c4a1-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650895912;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xkmkcNp5vjY0kJMx0puCoSnGEar2K03bnvM6ZKhH3mw=;
  b=aEjvFuppRpXPsoLW1WLOpQGsbH8YMUu1PZPsgwremkmF+N0YnA2WYu6i
   8kqSFjfmZCfj7jQrCIpzyEPL62hzzovE5mzaJ+/N4aIruYPcYT1tv/qbw
   6q+P/z17jkSYdXVQxknN0Tw8HjjtHVJO4IIC+wQZAgj0T2SsaP8qVsksm
   s=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 69262940
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:olxYDapBOO8i8QDDGi8PB5TWGQleBmKQZBIvgKrLsJaIsI4StFCzt
 garIBmFbvncYGKgKYh0PI+x8BwFv8XWyt8xSlZorX8yQSkQ+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 46q+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBAaHGkcc+fBBiPwpENI9G04D4DXflvpnGp6HGWyOEL/RGKmgTZNRd1sMpRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFg3Fp2Zkm8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrL9PBpuTmPlGSd1pCyF9jxQoOpGflQxEihj
 2LN0VX7LVIjYYn3JT2ttyjEavX0tT/yXYsJUrm18PF7jVm7x2oPBRlQXly+ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8VUO/037keK0KW8ywSWHG8fVRZadccr8sQxQFQC1
 FWEgtfoDjxHq6CORDSW8bL8hTGvPSkYK0cSaClCShEKi/H4u506hB/LStdlEYa2g8fzFDW2x
 CqFxAAijrAaluYX1KG2+1/WjjbqrZ/MJiY85x7eX2asxgl4eIKoaYGu5VXBq/1HKe6xVkGAp
 nMNn8GU8cgEDI2BmSKARukABvei4PPtDdHHqVtmHp1k+zHz/XemJNlU+Gsnex4vNdsYczj0Z
 kOVoRlW+JJYIHqta+lwfp61DMMpi6PnELwJS8zpUzaHWbApHCfvwc2kTRT4M7zF+KT0rZwCB
 A==
IronPort-HdrOrdr: A9a23:jrAE/62lgr75uUerC98tswqjBSByeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQMEg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/iosKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6N2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCulqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv60vouqhNDqWs3N
 60Q5iApIs+MPP+UpgNdNvpYfHHfVAlEii8Rl57HzzcZdI6EkOIjaLLy5MIw8zvUKA07fIJ6e
 b8uRVjxCQPR34=
X-IronPort-AV: E=Sophos;i="5.90,288,1643691600"; 
   d="scan'208";a="69262940"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYL2yx1FYPRgfgMRSWubP/kSlzVUfq+rrVk98rhJtCBiS6vcMD44rHIDwaj357vbGPlbz9qmNo/62P4b+W9kbCGvVvvy/vHOA3ObvqSFpYOIqj5Q29b03CIIVujCRhIfQTLF+wnlELUZATkiM4xe3BmxpXaD7o9PbXkHvcZ/e1Rt4oV0vwFDLV9iiuIbYP1S3vNGz8xF6UGM/qUuArgp3xGdqQXnVzXchzNwddhhOse7d1VmsHD2NSg4tacSQaV72uVy6je/RjahbwKCvvhM5Ol+ObuiuagGWlNtlaLPRNUQwkpdmDT4ph4wHxK+774aOl6cncCSEIsXjn8Q7Xa4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4ikID8eT+vgIa8f/6lN1MNLyj10nnkMkVbOfXLaKxg=;
 b=mDNO5Ud5JacsR6Mrme8+UFs0pknEpS68dHloJq3k+zcSvkZzZzGp6I+DpLUeXPidMATF5osH5u5xJWWoF+ow2SOgIuOVcJktJRTjnWX3CBm3YQWQrrOJcMJJCgzgPPc3tKC+KhLPd6qC6dbDQNhn6MoFWO2ssUnsk9/VCgbg1tuNXg6CMbXH3pjRYQRH9QZUzu27sWseoesF5orZUOUrMfJ6aJrDkjbyb8wZw9vqfqjsyfPXYO55+OviSsaJ2Xzpkez65vSaDfodzqzKnP5QYuSlOUJ5PXlDvaz5WZtdttsxGSXHxAvI6jxX65AnO62GbNrNpXADjqN1fUaX2cJFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4ikID8eT+vgIa8f/6lN1MNLyj10nnkMkVbOfXLaKxg=;
 b=hzXHcX1Zw9SMqUNyBD+rWJg0egFSynnYPpA4zQxfGDzEkbkDJlN9YbozRtMCIx8/NDmu8wDDM5ibhM0VAo/A0vFbw529sgqm3wIXxrdLJgnopRHl9g4fXgGjfCZp4raXVwNFqke5BVdXX5bMfu4txIiycoNi5R24ZCy1o+LEHQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 25 Apr 2022 16:11:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [PATCH v4 1/2] x86/mem_sharing: make fork_reset more configurable
Message-ID: <YmasHAT0YkeJVMbv@Air-de-Roger>
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: LO4P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fda3ff71-c160-4bd3-6540-08da26c5871f
X-MS-TrafficTypeDiagnostic: BYAPR03MB4597:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB459749787E88F8FC44CE13788FF89@BYAPR03MB4597.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0YtwZLAnZfi5XYxErXqX+wT04uuJl4cOxgJd/x41dQF7kGsKVwW9uf+4Ewo4Tk94fMwRboNRudB8R6wYlqnBBBMizca5lw9NAUvElZOzv+4wvwwwO23EPd/uYMmfiEtTWKB9D4J5h5XXsS5RRMS261mDDpmwyx41CYua62RJc8wM21BnvN43Y+hlj3mzVfnEVSIAkBkoInXx4U/cMuUMLeSS31ij1jjpVDSd5a22Tn01x6JkQk4JZBYmp+xoA+M9Ci+Qr5D+G1FOKW3MJ/Acws7YpOu7vXD1GLoHy120rBAVQdMEic9jGzPecxDHIeQBMd0y5WXIsOaGD68Lca+aKuL58DQB9C2DG4ZvxJnAsr84OGkjTzwQ4sIbLF6t3mCIHQHADLN9RT3p9cnTESdqgwJwdg1f5LzWYU4bVhMN9SZW5s4dIN2b4yT3y6Gey9cRib0ttAKH7F3AsE06B6Fao0uTHPjUdmrDglFMxf7HdModDJMDGxUtR0kakXyezNQjln5e77Gpq7iuBxSPqjjKwQgQ6jHbPdRH+gE/QKPHHkdTUuXPtv9oi5z78XcXesEbgbliRcT6D2vMiBBBXW+NbirfXbA4cTVCch3BZaUQYXOxjIZMIY27RX92r8pwuQAcj94mCVWjSFBKaH6IwcnMUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(33716001)(186003)(6486002)(316002)(66946007)(54906003)(85182001)(6916009)(4326008)(83380400001)(66476007)(8676002)(66556008)(8936002)(508600001)(6506007)(7416002)(86362001)(5660300002)(82960400001)(38100700002)(9686003)(6512007)(2906002)(26005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUgrdndEOFE4TUdIRkREY2k2K2lEMVFiWEFkK2I3RitlYTBLa3M3K1Bvck9L?=
 =?utf-8?B?eTNtemg5ZFkyRjFjSC9LTGQyTk8rcm5vMXpncFZkTGk0cFZVRWtqMEthcHhF?=
 =?utf-8?B?UlkvUUoxVXJVMDBtMXJWencxKy9ScXN2QmJSaVBjeUtzU2JpOW9ZVm02V05K?=
 =?utf-8?B?RGVZSVZSQlUzRUFST0NUZExBT0RhUmgvWDlLK285Q0NSeFRjbzlrN1h6bmd5?=
 =?utf-8?B?UnVOY3pHaEl4bVNCcnpvYVBxTVNGUEdRRGo2NHJiMEpqRGtRNmFtc2kvMmVl?=
 =?utf-8?B?Tjd3eUFHNmJHMkg2Syt5WjlHOHJCL290OGRQUmdWVXJCNW5nR0E3NndEd1VL?=
 =?utf-8?B?WnBNRnU0OWlQeG50M1lmUnZaS21jUnFkSDdrUDdPTnU0WjhaemRBeFRrZ0lG?=
 =?utf-8?B?Z0pJSnZtdjRrNXBrbERtV1Q3ak5lTDYwRWtyZ2tUOTU4dG5nQzVXZkF4OThm?=
 =?utf-8?B?Z05WeFVNTGxycm0xRGd5MC9MTk82TUFLV2hMWUh0WThTT3BjMkxOMDk5L0Fz?=
 =?utf-8?B?bnhZOEpsdHVDWG1lbFJkL3MybG82UUI1b002aEhYWGdYMHFsYXhJb05QaFhm?=
 =?utf-8?B?ZGpDdGxyL2JnajE2TSszZzRlNDY4TkxydjRuVXU5S1JUcTVjR2l4V0ZNNUpx?=
 =?utf-8?B?YlMvdlNMbDNRT2RqZGxxWXVwUXZ0c2p1eU5VTWx6cG9XaFh0aFhIbUhpMFlm?=
 =?utf-8?B?QjNLZ2Q5YUdBeVFTRDhMNkNKSEg2cVZCblJpU1JEZThqWHQ2ZlgrbVRYd1lL?=
 =?utf-8?B?SE02UG1mOXNVSlFTWWtzQXBXNWRsZWJoNWZmV2VYRnB6NEQ4a2M3cmhKcVg1?=
 =?utf-8?B?NzdZb2VFd2l1ZkJjRXFvNXYwOHljenpEcnpSRi96TWk5ZitvbkJKTXFocU4z?=
 =?utf-8?B?bmlFdWpwazdhOVFCdjQyZi9WWWJibnRYVnkrOVVQbDZNcmVmYnpvZnZmTzJO?=
 =?utf-8?B?WUFTaXV3UDBpSWtPVWZ6bkh4ZVlRODhBU1JkQll6QXFHVlhDTVNHYVdod0t6?=
 =?utf-8?B?Z1JaTHJ5ZnBYMG1XU0xIeTVsdGUvcVlDT2tTRzNwT1diR1lmdHVjOGZTaGJw?=
 =?utf-8?B?RUFhMnNOdFVnVlN6VEhLcCtWTFFuQ3ROTUd0eVl4cXRWNGVxMStPZ3NxbFgx?=
 =?utf-8?B?QUx2RkYwZG41LyszZE9ySk5pQTd4RitCdDJVa2NqRWcyYnpNMlpqZDBqR3Fj?=
 =?utf-8?B?cDNDMThRMElyY3RvL2dNTzVqVU9FYW1HOHg4Qkx3aWxiM3dYZzJ2cTJGbGFx?=
 =?utf-8?B?NkRLSHBUZzZIN3RJcUhFUFFqcjNlRHVPcTZNWVlCRnROQnZ0bzFieWxEK3Zw?=
 =?utf-8?B?N0psNHNhV2o5UVdxRFdxdWYxaThQaWd3S3V2ZUxrTXFmRzN4d05RTEN1WE1E?=
 =?utf-8?B?Zm1mcmFBa2tLTXBEeE1uUWIzUlBORFhzRmNsd3hjM3lSNGgwYmlxLzFiS0VB?=
 =?utf-8?B?SVBwUmc5V0FVRHk2aGN5dTBSRUE4bjdKMzNCZ3hGYW5nV1JWZklCMVE1djZK?=
 =?utf-8?B?QUpQTmp3bnB1NWRaSlhNbHkvUGczclhCNVQ1UzRWZ1l0b2x2N3BlUDNjNkl2?=
 =?utf-8?B?akVuOHpZeHNENklDcjB5WWVzR291N0k3TjZPWEI2VFJLNkN6OE9kYUtqWGMz?=
 =?utf-8?B?NHlaWDBOeVFQcjFLUys4SmZVNjYyaVhRMnB1K3V3WVQ5MDZ1dFJrcWVzVXVO?=
 =?utf-8?B?RGlsbkdmMEpPNVV4ZldkeXFNU05tdDNkU1ZHUTVHWnJYaUJRNnI4MG82VFFa?=
 =?utf-8?B?UEY2VjByQjVnZVBLV2ZYdnVWRDVuNzVpQWpNUG9ZbVBBWHNhR3lmcldlWFIr?=
 =?utf-8?B?cFpPeERvRzk3MHJyRVFRekJLSlJMYVpnTTlmYTZNSUVpS015OUc2bERBYXI2?=
 =?utf-8?B?TDJXMWRVbGM2NXdYS3UxVlhGSmZLd1gvUHozRlJLNGM3Q2tIa3VyTWdCa3Vl?=
 =?utf-8?B?eDRqend4eW5nelExTGZlNFM0WkFjaCtsMDdpeE9kSGl0SVdDd0Q5RlJmV2di?=
 =?utf-8?B?NlFZbE5JVG8xVWhMamZveVhUUVZld3lFN1IrNmh6SENNa24xa1JJVERJWVdC?=
 =?utf-8?B?a0QzbmtCRFRRT0h4RkpVdTMrblVZM28ya2xSZ1hMUmZEWElaM2NvZTdUWE45?=
 =?utf-8?B?NzRGQjd3WXJuSEhWWDc1ZzBmeFpMRVc4ZFFNZW04VktOYUVFSDRsOW1oTDRD?=
 =?utf-8?B?UVVUaU12Y3lQWGxPSXRFMXBtTk85SnhoaVBqdHR6VU5UTEVMb2Jvb2xQQlpv?=
 =?utf-8?B?K2x2N1B0d1Bob3hKQ3cwVjU4YXhnN0lQRy8wNVM4Z0RzKzNCTEIyRkk1bVRx?=
 =?utf-8?B?S3ZFOXFIa0hyQm45NGk5b3JVTzhlajlrU2kxZG92MmlDS1FidjRzM1phVGhV?=
 =?utf-8?Q?BPWuuXzZEOsYtG1E=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda3ff71-c160-4bd3-6540-08da26c5871f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 14:11:44.4990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leVp8/Fga0PXNX1280qWTP8yBGjNSB33BR3wKH8+tfCW1b7VQnWDeKGbDjZ/Hx45qIEDtslMMq7HR02N+t78Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4597

On Wed, Apr 13, 2022 at 09:41:51AM -0400, Tamas K Lengyel wrote:
> Allow specify distinct parts of the fork VM to be reset. This is useful when a
> fuzzing operation involves mapping in only a handful of pages that are known
> ahead of time. Throwing these pages away just to be re-copied immediately is
> expensive, thus allowing to specify partial resets can speed things up.
> 
> Also allow resetting to be initiated from vm_event responses as an
> optiomization.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v4: No change
> v3: Rebase on simpler approach after dropping empty_p2m feature
> v2: address review comments and add more sanity checking
> ---
>  tools/include/xenctrl.h                |  3 ++-
>  tools/libs/ctrl/xc_memshr.c            |  7 ++++++-
>  xen/arch/x86/include/asm/mem_sharing.h |  9 +++++++++
>  xen/arch/x86/mm/mem_sharing.c          | 24 +++++++++++++++++++-----
>  xen/common/vm_event.c                  | 15 +++++++++++++++
>  xen/include/public/memory.h            |  4 +++-
>  xen/include/public/vm_event.h          |  8 ++++++++
>  7 files changed, 62 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 95bd5eca67..1b089a2c02 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2290,7 +2290,8 @@ int xc_memshr_fork(xc_interface *xch,
>   *
>   * With VMs that have a lot of memory this call may block for a long time.
>   */
> -int xc_memshr_fork_reset(xc_interface *xch, uint32_t forked_domain);
> +int xc_memshr_fork_reset(xc_interface *xch, uint32_t forked_domain,
> +                         bool reset_state, bool reset_memory);
>  
>  /* Debug calls: return the number of pages referencing the shared frame backing
>   * the input argument. Should be one or greater.
> diff --git a/tools/libs/ctrl/xc_memshr.c b/tools/libs/ctrl/xc_memshr.c
> index a6cfd7dccf..a0d0b894e2 100644
> --- a/tools/libs/ctrl/xc_memshr.c
> +++ b/tools/libs/ctrl/xc_memshr.c
> @@ -257,12 +257,17 @@ int xc_memshr_fork(xc_interface *xch, uint32_t pdomid, uint32_t domid,
>      return xc_memshr_memop(xch, domid, &mso);
>  }
>  
> -int xc_memshr_fork_reset(xc_interface *xch, uint32_t domid)
> +int xc_memshr_fork_reset(xc_interface *xch, uint32_t domid, bool reset_state,
> +                         bool reset_memory)
>  {
>      xen_mem_sharing_op_t mso;
>  
>      memset(&mso, 0, sizeof(mso));
>      mso.op = XENMEM_sharing_op_fork_reset;
> +    if ( reset_state )
> +        mso.u.fork.flags |= XENMEM_FORK_RESET_STATE;
> +    if ( reset_memory )
> +        mso.u.fork.flags |= XENMEM_FORK_RESET_MEMORY;

IMO would be clearer to init mso fields at definition.

> diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
> index 84cf52636b..d26a6699fc 100644
> --- a/xen/common/vm_event.c
> +++ b/xen/common/vm_event.c
> @@ -28,6 +28,11 @@
>  #include <asm/p2m.h>
>  #include <asm/monitor.h>
>  #include <asm/vm_event.h>
> +
> +#ifdef CONFIG_MEM_SHARING
> +#include <asm/mem_sharing.h>
> +#endif
> +
>  #include <xsm/xsm.h>
>  #include <public/hvm/params.h>
>  
> @@ -394,6 +399,16 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
>              if ( rsp.reason == VM_EVENT_REASON_MEM_PAGING )
>                  p2m_mem_paging_resume(d, &rsp);
>  #endif
> +#ifdef CONFIG_MEM_SHARING
> +            if ( mem_sharing_is_fork(d) )
> +            {
> +                bool reset_state = rsp.flags & VM_EVENT_FLAG_RESET_FORK_STATE;
> +                bool reset_mem = rsp.flags & VM_EVENT_FLAG_RESET_FORK_MEMORY;
> +
> +                if ( reset_state || reset_mem )
> +                    ASSERT(!mem_sharing_fork_reset(d, reset_state, reset_mem));

Might be appropriate to destroy the domain in case fork reset fails?
ASSERT will only help in debug builds.

> +            }
> +#endif
>  
>              /*
>               * Check emulation flags in the arch-specific handler only, as it
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index a1a0f0233a..f8d26fb77d 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
>                  uint32_t gref;     /* IN: gref to debug         */
>              } u;
>          } debug;
> -        struct mem_sharing_op_fork {      /* OP_FORK */
> +        struct mem_sharing_op_fork {      /* OP_FORK{,_RESET} */
>              domid_t parent_domain;        /* IN: parent's domain id */
>  /* Only makes sense for short-lived forks */
>  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
>  /* Only makes sense for short-lived forks */
>  #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)

Should you add:

/* Only for OP_FORK_RESET. */

> +#define XENMEM_FORK_RESET_STATE        (1u << 2)
> +#define XENMEM_FORK_RESET_MEMORY       (1u << 3)

Thanks, Roger.

