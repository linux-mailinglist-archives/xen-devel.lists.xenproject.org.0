Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D8B9080D9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 03:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740272.1147301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvy0-0007mw-Q6; Fri, 14 Jun 2024 01:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740272.1147301; Fri, 14 Jun 2024 01:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvy0-0007kM-NB; Fri, 14 Jun 2024 01:43:00 +0000
Received: by outflank-mailman (input) for mailman id 740272;
 Fri, 14 Jun 2024 01:42:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OutG=NQ=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1sHvxz-00071T-6t
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 01:42:59 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c19163b-29ef-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 03:42:57 +0200 (CEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E1fVLV006357;
 Fri, 14 Jun 2024 01:42:40 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymhf1js3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:42:39 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45E1Kh86012449; Fri, 14 Jun 2024 01:42:39 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ynca1ur4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:42:39 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5755.namprd10.prod.outlook.com (2603:10b6:510:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 01:42:36 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 01:42:34 +0000
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
X-Inumbo-ID: 6c19163b-29ef-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=JGRsprn62snXHv
	9hTV5QtD2Ljv9gbEkA+M5go9Ecvjg=; b=aAPsIfqu6VVtDveYRCIRQ2c6BQHQw+
	2WNi1bUMXes3Eqxoff5CUtOd9up3KsXGTqEVE/80DCGoRHog4PlJCgLX/OCsro1N
	neyDGzZVyD4QdRr73KO3xCPyZ1MpkHARW6GFwfWQ1lRwB5/Aac2Kmw5sec1a5CR9
	hvQazmC54h6Lz+fgvE+4Xx0yizIo4i5TdBdPIePU7TUf0G5Xdw0B149OEMtPENWO
	qjljkZ7uyZex/R0CMu14Yv/+GDJnCiy5lB3qpFwIDgUVSz7bftk6EbhSq8XcFBHY
	dDoWmlof1fWbzyrl9dRAZkuD7xdiULhN2ZQ+oBRaEOoto3limrEQIY1g==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4wn931pP+PsFeefJ/QW7EG8tVSf4hwkPda7fCbKSTu/NJBcdaTNhaUXqFYdEaKEy0Tfm72pstm05Ak3ZkAo43cPQZL7jD/nhLUo/NLbPsCcNxlnLJFwZu5DzNu8cshMi96vTq0vLfXVNnwutdeRfV8gZXOTydfcatQDpI0bx7IYfx3TmXTSl2KHGgCzrLlYZKYHQwzVMVFKIQ31yQiUKUOXxmG9E37+lJIpWBsW6hj5EbgGoIcPwxMynn35AYA2jkBSdxYEDbNwZGF3Rj+HDJseqx8jd/lCHPrk/FJ3mOMTsT37icX8mp3eyiJIJsWYjSYlw0RPr/Ws62Rg5EWzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGRsprn62snXHv9hTV5QtD2Ljv9gbEkA+M5go9Ecvjg=;
 b=kgl2Tvf/bNHFG6/N9DjKwXkKDys68Cg/8hpGmQgWy1GCj2u+QrQKWgDscqb8zGQ8AsC6Y1eJs4GNdInCdf1hRPxybx7dBhighxUVjqP6IKBw20mqB+mtk2JEAo5watiLXx4ws7YPKaRxzUceubZ6+oAM5tO88RXjGvy7CiYkL/LgMmPs9ldAcCsDnWK/+qN586i4KoLId9di/uheyrP7PSfaxY6xUsbRr4mQWM1Eq01ybtmVcbwfdD77BTfB2dnF/oLRTf42beBW9nZ4eJ40PqW8wF7FjzkypHA6NI8dIMTCBcz/g//66slFv56UZNmJn7r9lfEMU3iARxKwep3qKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGRsprn62snXHv9hTV5QtD2Ljv9gbEkA+M5go9Ecvjg=;
 b=fGxMQOT6kbuU8LkSROfUJO1N7VN5xrPq8pV/iufRQAf8zvXnKsZPe7ePFeEvsV9dZFYglKq47kvtlgxmzBMzyc1jYG4K61TREq7g7obXz2OAU5LtiBlmN+Zi9rL03PhBKeF8ISs3OCR+3NsHyOXPx/LFazPRspib49pFvCu1upY=
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Richard Weinberger <richard@nod.at>,
        Anton
 Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Josef Bacik <josef@toxicpanda.com>, Ilya
 Dryomov <idryomov@gmail.com>,
        Dongsheng Yang
 <dongsheng.yang@easystack.cn>,
        Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
        linux-um@lists.infradead.org, linux-block@vger.kernel.org,
        nbd@other.debian.org, ceph-devel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
        Bart Van
 Assche <bvanassche@acm.org>,
        Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 07/14] sd: add a sd_disable_write_same helper
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240531074837.1648501-8-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 31 May 2024 09:48:02 +0200")
Organization: Oracle Corporation
Message-ID: <yq1y178s3k1.fsf@ca-mkp.ca.oracle.com>
References: <20240531074837.1648501-1-hch@lst.de>
	<20240531074837.1648501-8-hch@lst.de>
Date: Thu, 13 Jun 2024 21:42:31 -0400
Content-Type: text/plain
X-ClientProxiedBy: MN2PR12CA0030.namprd12.prod.outlook.com
 (2603:10b6:208:a8::43) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|PH0PR10MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 7684e247-7f4a-4cb3-9292-08dc8c13432d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Km9EgCWJBIytRFLuGA7ouokOZLQwse4psS47QsxoOqXixIL8RxD/Tl6kKxqZ?=
 =?us-ascii?Q?4g1JYn7j4s1Rs9ZdXDaw0CG3LjIyjfIP9ntBiXlI+a/VretYIYdUVIR1s+pB?=
 =?us-ascii?Q?uVQGiVJlnVw4srL4e8wEx6i9V+t/7W4vB+6AZlrNVn1lDUwOrF9hDmNANXET?=
 =?us-ascii?Q?h9C6uh0njdpWP6u8lfr0H8aZdv8pE7bJGh6Jx183rSjtjm/uC9uy6Dbb7Wo1?=
 =?us-ascii?Q?i1NhtuQAqbAUj2nEdCZxFyod+RcA6b7GnzdTc27jNcMz+/KKtYUXF191K8kB?=
 =?us-ascii?Q?cwQDsWWly3O0kFd9MU0VCvm2X579zEjDjfRdXdOuGN59FG2NUY4zw8Ln6XYk?=
 =?us-ascii?Q?LDDNxGTNO08tkC/Z5KnNA70LPDeNWLHWGS/qpJiGNnZpJdkMs7tDkhbxHGtf?=
 =?us-ascii?Q?1DNAdJ2CZ4TQ4kaseyFtv4t38mldxBvjD/kxfx4vcgnVac4KYoq8O1/BFxaD?=
 =?us-ascii?Q?d1s7Tthe+kLX/vZaw11eJIC82KYDvRYtJcfU7u3mRTFwIicIVZi9pO6aScp0?=
 =?us-ascii?Q?wFfzv1KjtvRiZ4TXMFZGQDt8E1d0jmixXQObu/50OB+EIh8JSQwq1kpsOw7W?=
 =?us-ascii?Q?FBQRQuCMmuxWSFSv6amwe9NYg2RtfAc8Bs6r5i1uoEA7Bsc/weJMHFKk54/a?=
 =?us-ascii?Q?XzrfCF5pGs0/E4aYC3IaiE3R8T20ShBkXkN4G549DNm8zCVj5GUimaWlztkB?=
 =?us-ascii?Q?0+e3xBwxKRRuoDi9j1bfkZPjtS3X4u3J0fKLeNqpwiN1yp1IqmP1yEMT++Ch?=
 =?us-ascii?Q?Sf1FtYzyko54CfiGtvBlrPWG06bRmDYYVyVzpyw17hC9XwmNz4naS1It1tC3?=
 =?us-ascii?Q?4zrW1CF0zYrJJ0mPl0JssZ03R9xnQq/6Z2FRh2KyVnxkhVySdMkovYq3Zj2A?=
 =?us-ascii?Q?E6AO6DroRxlA4XyqFFX854QWsncA2nXLczVVvmyPYG0sGcoJcTpMtubv0B1n?=
 =?us-ascii?Q?oA+uJvxxXDnsmVFl67sZgYp+LtEo17LYR51cbL5PUiaZagjGddD54hOvaHnL?=
 =?us-ascii?Q?ZsFdUeJZN4NUOrJ7s7/n7sAQq7CWMnm9Db4Pm8xobUbgl8l39NCKvR4fr+/c?=
 =?us-ascii?Q?i8Lbnse9Z9rwSVkya2R4M3TmyC53sPZkmwBiHBOxzwWSzqm8+0e4dyqnJOcf?=
 =?us-ascii?Q?y5M1Y45tJR3DIaaBrJGlfcBxxXrjWo5NI9XqvejUK7JYHWvYW06Pn+wTJRFM?=
 =?us-ascii?Q?/mzZ07QUYpnrCFKSmxMxjt5yJBQe7n7MM8Ae23SzIH1X9FJIwoSSGjnB/F/m?=
 =?us-ascii?Q?SivWzOQsHyOMw3HvFTtlr1LOlqIbIWywGgEwYyc5Aq8P3iagStJh6torsTcz?=
 =?us-ascii?Q?0Pz0eTMr5bhUOu2JET1gsveL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CZXKfKvJjLC0Atf5rQ7h4GKbe6rneF/musq3W7mE8CN2e55OM6dfOx/h+p5c?=
 =?us-ascii?Q?5bQZJCIHgCdNaqHIXnk0zmXGsaqzA4GZbQpy8Yec/OaHeAP47IqiNX8yh02Y?=
 =?us-ascii?Q?lRAq6lndxkG2XOj8nKxwylTai+ldxmM0zE1rO28N0VX7PVTuCegHuaIJtgF4?=
 =?us-ascii?Q?xUx2NwC/7aJuaA2eUX2J13TtmQQJGYqPiePiAbgeesRRDbP3G0XhIPPxvqhe?=
 =?us-ascii?Q?XxMKb5OxZpSZH2bfnsj9sj0xrIpu4nmrOkTE/d+4yhyA4AlMQCp+KV7kdrwm?=
 =?us-ascii?Q?zpKDwDBDVcZ7mXL4O6It10TQS1r0o+nt8zpw1GiJTfBZghkIolLW2OANvBqY?=
 =?us-ascii?Q?p0la3bIlhX7zGdoqUZGyUiZYd0/NfeBlMWWRAfFvGHrjwxTk2McrXW2I4f+8?=
 =?us-ascii?Q?x9dsxyx/ltuD6WZLVaPemJoZqi1mTe0zFB7hnGVPQPECWY3BTfA57sHxuLpn?=
 =?us-ascii?Q?5gy/CMMclMndWQZVPA0exx55d+9W+ZDN609zEPQe2nrzzbISKljtllnnmtqm?=
 =?us-ascii?Q?smWc1RwQ3oBcGaasBqBYDYGWGMeYh2MbQhwCpNvB4LH9CehoYZtVVkjajooN?=
 =?us-ascii?Q?VZMxTyh3JKi5TKKCHnLWkcN7Xm26Ea4TNWP+lXOja+3Zdn+0uTeZ8eyi0I21?=
 =?us-ascii?Q?ta+/JOiFOGa1eNenoAs4JTqxJjXQQ42Uo3lEhwFIr7IdfVg9xu2PJdZyWHEQ?=
 =?us-ascii?Q?Spz87XxTYm2VYx0w2dnr3nZF+JTQotQ5Sbkcu29IDaNWgqkABkOKmVDmlZzX?=
 =?us-ascii?Q?o5PjWau3T09npaYWTOVrpU9zdrhOvsC+9VfYEJKxmacjQRDruxEWwywcUckO?=
 =?us-ascii?Q?4wdABBFeNunFfE+APUM+Ds7gHE5xxno3XTb4CzeiOAG9XUiGh913hbVkKgXL?=
 =?us-ascii?Q?AL/DQ2eMnfp8nsMlCc3nrCVe+ynF3ZFsLJdbVAhW//r78x3lOcka3+skLIVu?=
 =?us-ascii?Q?NsPppSr6lHNGm2UFEq7yyQAN9D6aKdWIfJ4j9byJIzSsZxobq9Kcqw/T2dEV?=
 =?us-ascii?Q?ZYQj+FbiIUvwcC4SSC6fgq70cVWi80ytz5LMTp3ntoNFADJFCzANJo2I7Tcs?=
 =?us-ascii?Q?/+6YpoGpRSK/FWqrzvZMrF1XW0b5/DU8mBEZwibOesTTKxwL/Sw7fkZf7sZc?=
 =?us-ascii?Q?UmB7SsEvkqXA1w2RLyI1NGEZurhsjnXd8hbDqbdEuo+m+o5WOxXREz13bOwH?=
 =?us-ascii?Q?GLsB1RlLL7gHmoxoHHQCcbjAy9XUlEVAazrX9GKstszwf+v05ahH8WYSaUKP?=
 =?us-ascii?Q?CpLIG5Q7EzfaBRcIgykRWoVF8hxvYA3KkDSapSq3lw8KZFszZ3uMiwjtppYR?=
 =?us-ascii?Q?kLTzjj+tIGUW9lbl2WBfPF0xzMBI+EAlrEpHsdGty5Mhx0soyL4g66ru0Sui?=
 =?us-ascii?Q?5NNIiX89sV4H9FUPs+tTlhL98pz8OLlhvV3v1TE6tmKi2ZXGe3M5ds9K4jVo?=
 =?us-ascii?Q?6OEH32G1poYqtn2YGsg3mx6zk4QAapaQbe+kGTJ/j6iP36Wd6bEtVogVbM89?=
 =?us-ascii?Q?XthNJC0x9IzGn9qo0ujAnU5awNeYjGA1e+7HGM+x6YyyjU3SgSiytcg1XLlU?=
 =?us-ascii?Q?wJEpCJ7yyAh5KEN7vHGFRVcPjYP0xc+OJXcvx8SoT4EZXXy42GHIHuKcf9pq?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2Fjd0D9VSNFMlOkFj5ASqqINm+FnJ64mZ/WWIB/pBRnfzxbsllOKESNKaefswS3Wr23irO+8YDrfFWvdPCKPczkIwAgv0tvmYMRi0fvFS9fgk1b08PTs0d5Iqp4gv+/j8Pheh/mv9t15jktiu0rfH0z4vwOgA72W6z2fqq0GJ+7XLFopP5f0ypYGaj2mQGcJA8FS9hRd5xH6CzAyzyqYj+jZEqlvYhSMjAefKPg/w+Ezb1wZ17ODkizm2PZGzQx6udD1ClNMP10l85GmaE4rOF462tUQH8UyUKBG91iHTCGvaFdtp16rRLlwo2mx5bL7uIi+DJKlhBKFgAjyz+v+kCq8b0kE972vJBwI1/vYqzAmVIKEyI3l36KlI4yMZgICWHwvM390qNFgSKYMkb1wgJHVH5/hcmd0V9HclY9mgpguU5HvGSHwT/WDjn4a8A5fqYxp1D9jkQh5fMAcGwMUHAghvNRtAblYWoDlEBvgkwK4y1S9lDAyaQXK/AXmhKNHpCqMwS+PYwMhgn7J8OJb+T6O6z1rIn00vD/LXLOiFbeUDcIuF3MDtKxe/k8QL8+uMcgMj25qjtiPe/YyZ7kmzBhdh9MJNnOtDG4CuZmp3T4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7684e247-7f4a-4cb3-9292-08dc8c13432d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 01:42:33.9955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdH+62hBY5gS/mttHiNDJALKi6NjQGfHyyR9oUFXdWpPFOZDmprXs64ib+pnPXaxsVn+oZPMlKoa01F9dNGXN4OtU2opI8fUTYR5/TraW5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=885 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140008
X-Proofpoint-ORIG-GUID: timp3nIHCWQgrnjERU0q53rdPcZg0yxJ
X-Proofpoint-GUID: timp3nIHCWQgrnjERU0q53rdPcZg0yxJ


Christoph,

> Add helper to disable WRITE SAME when it is not supported and use it
> instead of sd_config_write_same in the I/O completion handler. This
> avoids touching more fields than required in the I/O completion
> handler and prepares for converting sd to use the atomic queue limits
> API.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

