Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DE274AE97
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 12:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560360.876231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHiTh-00009X-5z; Fri, 07 Jul 2023 10:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560360.876231; Fri, 07 Jul 2023 10:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHiTh-00007r-2u; Fri, 07 Jul 2023 10:14:17 +0000
Received: by outflank-mailman (input) for mailman id 560360;
 Fri, 07 Jul 2023 10:14:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GM+b=CZ=citrix.com=prvs=545203e5e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qHiTf-00007b-Dd
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 10:14:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0518334f-1caf-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 12:14:13 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jul 2023 06:14:06 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BN8PR03MB4914.namprd03.prod.outlook.com (2603:10b6:408:7b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Fri, 7 Jul
 2023 10:14:04 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 10:14:04 +0000
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
X-Inumbo-ID: 0518334f-1caf-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688724853;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LKzw3xHzR/4CC8l0mb7E0R2gIityAQmkHmBJnEzQJAo=;
  b=H6pokUE7IQ2nKuNnuBWVLeB2Ac5Uog5Sg8AsdQK9w0S/VGaywXln816b
   PNjBIRUuMSvEuhY1Y/Y5MKMSKnGSc6nkRCdOYaFqdrwxWVGph55rVhDkd
   qKjPkBu0UHrrP+jyCKdBppf5A7WCWbeyjZotq/1lB2jHXO6M9TpkIHuLK
   g=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 114179631
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QKhezaK9KZfBtOtVFE+R95QlxSXFcZb7ZxGr2PjKsXjdYENS1DMAy
 GVMDWqHa6mPN2T0fNlxaYW2/BkFvZWGyIM1G1dlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QRhPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5HB013/
 qAxCQoTc0mJp76o6ruEeudF05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLlWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv12raQzH2gAer+EpW+/PlugECdm1AtARhPDF6Rv9ajqGOhDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ul7Cmdx6yS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pES0cLGtHaSpaSwIAuoHnuNtq1kuJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:pt+XCqp998smUQPdYy10rjoaV5pIeYIsimQD101hICG9E/b5qy
 nKpp8mPHDP5Qr5NEtLpTniAsi9qA3nmqKdiLN5VYtKNzOLhILHFu9f0bc=
X-Talos-CUID: =?us-ascii?q?9a23=3A/rycaGm4JobiXkW+i8WcQU6wzYvXOU3b4E7bf2a?=
 =?us-ascii?q?ZM3h0Ebe1FUG68ZxUneM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AlC7Muw1qqHxRyPqDQVNwwNfkjTUj5a6pDEAQn8g?=
 =?us-ascii?q?6hcCBbHV1ESmylhaaXdpy?=
X-IronPort-AV: E=Sophos;i="6.01,187,1684814400"; 
   d="scan'208";a="114179631"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbjIFjLBJvYDdi7l7xm5H6Ji6NmLlKr7Jisn0IwdUQ952IgXWOcNhfpBkPq6ICCCCKjgrDrHcWUByLFJi3foyJxzNHxgVUfibH/DM9p28rHaHqs+OaBTuZViYRn/YQrVnTYDzAdvzDN/qpKE9HFm/B0Ohh66WhikgsSAWpWcvfz20slIHw8ml87DMl2+mpR3AUlrsog0VmkbMCJOEwi8eL7efUzOekWiv1jZgWhw+1O8TEptBzItLbqXSV9MP0K95CygvolpCrBp6i+09sYdJxsue2Bx5umKYd8Kxe1NrAQBQ/5L4sn6mYOMbvIBxuxP9KY7tqVE21o8bq4U/slidg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENTzTDoOFWECKo+jyH04E8Zqb0CNSQo4DQc0MGHkO1Q=;
 b=EqNxpkXsHbYOpT+UzKmndsSH2c75bG/FCTZceLMYW/u5olXQ2xXFQ0lmVFPCraNQmmKPTX7vb8hDMhTF0NCheiCBpydAFs+OOjnvy6CrgKlUIkrAU+CTkCu7hKyJe2iMXzQFQByy7iPHSzbTpaCJpB+Yd75ZDInyCjSbsXDp52rYwDyUpyXcN2JZW1sNrGIJmam463XkEVJV15zTl1aR4UyA40XjiMWZos6KUP8MRd/hUAbM+mCT9P6bb+VAoNNOMScAt7tZqq7q0YPTtRG3hMkyn7QyhX+brfHElU+fsWx0o5ReQINYN0M4hs5oewl4MOJ4n1gCdLZbgRm/EjyqNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENTzTDoOFWECKo+jyH04E8Zqb0CNSQo4DQc0MGHkO1Q=;
 b=FMEkYC8VBC6pdILReJA2qQ6Rk3mN6ZSYJrVxOarihQUZ2xoH3f3ErmZp+Cqh/CDMZjto5o32F8Wwu3fRMX46ux78Ncg7CGRrO3ffzSGmFIx7YNzsoc8CyK2fQAZmRaWzNUdu90tXk5sdZyrrLsy+UO5a+68I0pz51GuFLZy8H/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 7 Jul 2023 12:13:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 3/3] cmdline: parse multiple instances of the vga
 option
Message-ID: <ZKflZxLSLGsmQwOU@MacBook-Air-de-Roger.local>
References: <20230705114741.11449-1-roger.pau@citrix.com>
 <20230705114741.11449-4-roger.pau@citrix.com>
 <111078b3-399a-40d8-b8ed-db80dbea3bc7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <111078b3-399a-40d8-b8ed-db80dbea3bc7@suse.com>
X-ClientProxiedBy: LO4P123CA0491.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::10) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BN8PR03MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: 69602e42-51f2-49ff-da49-08db7ed2e47a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x3WZ9RylYn2uqXxTCcaVAlli+As1la7uepL0XbLUC45O0GD6PEcvqXvqKRo+FHto/w0ieZNmlDZ4qsRDd8X+cOZ58CusgYnlmfsEJ9JQK9k+HjeJdMznBDKLvuOHSdqcgRAMkD/lY0xgZo291q/cgwASh5dtpeOif4X9VMdYuJgFWmG8b4d0B5HNQrZCdamIqJE/PKyz3Ld4OcmfBqnoAa3U1zMLZY9K4DIRjdIVN9KfXF+WOcicRxirr+MSoXXdbfjHSJE98d+RlqdX6gCmRIhMwaHoP5rXoPqVgbqHtFw41B9u9vTBEVMTNvArM6+rq3pT8/kO1j60/8r3nZORZtiu1x54KFdRuV/meQykvl7mcgGDe1GsFtXoUR9IygQTg+f/nWE9JwWx16FUslEtEYLEzH1eBaTkj21oZrMwbtqkrCIyJ8yu9IMLIMwa83npXuhU45cyZL2VvZyowrnLGKCoVm22IXb66zPm9dMqekqy1fAld14qcXFwvf2TvaK402SR4uqwv6fQFdVY1KTK6nJgKrWOBabPIKFJ0VG7EjO8SNS8+fIAovdQUJoXqoIW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199021)(83380400001)(82960400001)(85182001)(86362001)(38100700002)(54906003)(6512007)(6486002)(6666004)(41300700001)(478600001)(9686003)(8936002)(8676002)(5660300002)(316002)(2906002)(66556008)(4326008)(66946007)(66476007)(6916009)(4744005)(186003)(53546011)(6506007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEpobTVEMGVFajJ6OFlEam15clNMKzUzTmpJQkVhaHVnL01CanRxeG4vTmRR?=
 =?utf-8?B?YkgwdTFFcDJqdlNPRkFrNkQvK0dOOGdLK3oxNjYwMWpEZStGVWhrZXlHQWRQ?=
 =?utf-8?B?VWdma0kzdC9kZUFubnI1VmltM2tYdVkwVlQzQTFrZWI4eU94NUlwRDNKdTVF?=
 =?utf-8?B?Zk1lSy9FN3JIQkdJQUZPVXpoTkJrYjgrMUJJRlkxcHFlQUdXOE1jQysyNVNZ?=
 =?utf-8?B?VHhIUnppRUNhZklJak82RHJxQVR6REtRY3Y1RzBqUXhmRUFSZ3B2VVZudGlR?=
 =?utf-8?B?eDV5QTVGeGNmL1RYRXJCSldQS2piQmhrM0dHVXdFdlRtaDNhZ3ZrVDNFaFBW?=
 =?utf-8?B?MzYyUVM5VS9BVnlUSGNYb2MwbFdBSkd1cXljRDhOUHVVWGw2bmd3VC9rdU9P?=
 =?utf-8?B?SUxtdXBsN0NLM245OWxuWUhrclo2YUVVSUNJZnJZTWs4T09zc2lsREtrckx0?=
 =?utf-8?B?eG1zNWttTTAyM3gwb01kUEo1WTVPbjUwRjF6ak9nMmM3Q24wcWMxV2hwcHpo?=
 =?utf-8?B?REtjeUVRZjlUWVUxV1YvQzBIYnIrSVRQSmFvN2NuVDlQeUwzRGdINUVSdG1N?=
 =?utf-8?B?ZHE2ZndmbEhjd2p0T0J2aDhMU2UxY0p5NmR0Q2ZhN0dwRHBGWmh2a1YxOXpr?=
 =?utf-8?B?QWZQbHQ0TDIvUmtwajlCZkpuUGdSLzB2MjNjWnZXekpQV3cwOGRKRDVjckcy?=
 =?utf-8?B?aTM2L2ZJeks1Umx5MitYVElMeTBNY0xvWHc1SVdBYWJSQ1VyNEdpVGFMenUr?=
 =?utf-8?B?bm80NGwzeDJ3RDRUMGhxczlVM1BBL1dUR3V1bGNtZkJwRjhlcmNWRVJxaGs3?=
 =?utf-8?B?aS81TEpQMHY5byt4SitxWWV0SlFpRjBBd0NlaGkvTnQyd3FxU1VoVjBvWkNN?=
 =?utf-8?B?M0NlMEljVXBoOUFMd3YwUWU2Q1dsb3VVb01nQld0THZULzB3RkpndW1CNWI1?=
 =?utf-8?B?VGxyanRLMWFlYWk3OENjRXNvQUdmZitUZHZ3NmMyL3J1a0IvelZhaDVNMlJL?=
 =?utf-8?B?TmRKcDllVmNRNzBleHpsYzlCc2RpdEptK3JTNDl6Mm9DOFpqTllOQ2dYWk55?=
 =?utf-8?B?bkdjemJqWmZ4N0hIZ09EcU5LWlJtK05LMVUreFZaRFJqSTBsMnFiKzgyUG12?=
 =?utf-8?B?OFh6dllUY0RWZENvMHFRMFhBZytXb2xyazBiTDIyU05uUEV3eDJJdUJSN0ZD?=
 =?utf-8?B?ZWdDbVZuMlVmR1dNQStxaVd0a0F5bzBMS1hOelUvN1EyMjI1MGU2alBoZTRa?=
 =?utf-8?B?WFVDSWpVZHZlZE1lL2Fqemw2SDZXWlZ6K1BSbXY4dGhvWVo0WkNlRlE4Y1U3?=
 =?utf-8?B?b0JVMURMb25hWnBiTEJzUjNvNW81S3Bqa3VuSUc2M3Z0b1BYbUZCbW91bFQ1?=
 =?utf-8?B?QXRVMUhUZXJlYTFCd3lhLzdjRWcwajA1QmM4TU1pN0hCZGhuSHBMS3JpNVB0?=
 =?utf-8?B?VTVOUmh6TGRlcXVjWk9Da3E5SzRkMlFyTXhkNGVqMUNSY3dqcTNBSE5DQitS?=
 =?utf-8?B?ZVEvNTFJdTVQckxVeWZMU3ZMVWh0SjFZMDdOaUdrNmhHL0h0Y1ZsQkdadHcr?=
 =?utf-8?B?cjVJUGxBbzR1cFkyK3NXdUNBMzNtVzl5T2QxMVhHWDdoem9KVkhwRnFtQXdo?=
 =?utf-8?B?ZUxqb3c4czBNb3poUGE5eUtrOTBVLy9BRWRNR2tNVFJmTDRsbWQrZXlrRVVq?=
 =?utf-8?B?UFhjT0V4Qzlhc0lvWElSYVJkcUZ1VDNmejZNNzdWdkx4M05ndE5QN2RZdjh0?=
 =?utf-8?B?NXVZMCswTk1qRHFBMnFGa0ExTjQ5cTNmMi9UYUF6dC95Z1puMTlabW13bndn?=
 =?utf-8?B?aEdGVUJMQ3NlRzdzZy8vUUUwYkF2Zzh3dllsKzZJZWlQSjE0cnBuY2pKeTBr?=
 =?utf-8?B?UEVRTjFnZDdGZGRhRmJpcllhRHFkN1VkN1loVjR0UmdLaHlIaGNwWkk2eHlM?=
 =?utf-8?B?eXNrcW9pWmhqMTVoUVBENHJOWnlYS3FuQVFhdHVmalZxUjkxK1ZtMVVZK092?=
 =?utf-8?B?eDh2OVF1cVd1aWNaMVdTOVlpeG5XOVRvYkJpMjNucXV5T3oxRk80ckpiRWZL?=
 =?utf-8?B?ZnBiaG5SazhYUlBLeHJoMHVzNVQvYU1VQTBYbnp0UXhDaE1PWVV4UTFFSEVH?=
 =?utf-8?B?MUN1QVgzaTE0QXVLYkdSODBrd09neFBaSTZPWVBFSDVVVCtMWDNqWk40ay9z?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OgF1Bj4SiM6VOlo7L+0eGNn6eswlPb5vMX/HLC/WHfW7yPV1T3kRduYMJUOhpigbvgQdtQU5gmDJsBBA2DxlzsCBOC5zBn5RrS04C1R1w22f818zC/bAxVD5rXqDTATYEXrEYqU/Rk71Ld71l2nBHlzGF24s+6FzSgvTCfYMOjHEbZSbs5wcvAKwzV5mjR0hbATDLodWhhR7royzUJK9y03acjkTHVbMkhB6B8J5AnowGGweVpic5mHggQ2uAp9rBccW7l+E7QfqaWD2DS50JKclTmYRT3QK551d3otfHdLyibh57xurEXwd4aK//Ao75xNs/lef3AGwLyLzAuMToq2D7rVnARkAE/OF9T8o6XWj0HihhZLXyGCl1TAY7OkgseSQ9olZpbXod3MdRDzlvI+CU3/H9+m/9mwv1KSWdS7LHEdtLoVYc8pf9yhNhAG/iL+1yoL7JjoSpi0TctlcIMbV0JupMeYSp/Zqnm+Ps5Di9lboY3bFOPWX757JsQZDgzA/ciEOOX2G7ykSUJkhzokQdPvgbMaaNr2rjkY/kXWZuSrffm1TdOf1O/+qlm06hcGG8k2sOJaqBojZaJdtKE2FOs9izN+Z6ZztTuVohLG+y83dd5fBbpgq7lzwYtLGUT2d7UwyqsZrQwZRrnvyDit/LAJz4x8Sy/ogsH5x+uvR4v91gIdaqNWvACRQ9d+6cLC+pz+/ONOTJNjQ/ZF+cGIoQaZ5f/yZ6swpHwJthA91J1ubAayMHxkKONoWrSDpIiikSq+bjyRZpD9mA2cl/ALE7kWkyLgDNwoQW5213a8HgCV1qaH+/K9mLBlpluAZ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69602e42-51f2-49ff-da49-08db7ed2e47a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 10:14:04.5663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BojUlR7C3EyZO6TY9pjh6tLDrLzbSs/WXSamBPa30+UXPYV0U6P+nq3ww/P3k5cq1KqX8eJdUWXdb1e0oS7kPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4914

On Thu, Jul 06, 2023 at 12:45:41PM +0200, Jan Beulich wrote:
> On 05.07.2023 13:47, Roger Pau Monne wrote:
> > Parse all instances of the vga= option on the command line, in order
> > to always enforce the last selection on the command line.
> > 
> > Note that it's not safe to parse just the last occurrence of the vga=
> > option, as then a command line with `vga=current vga=keep` would
> > result in current being ignored.
> > 
> > Adjust the command line documentation to describe the new behavior.
> 
> This was likely meant to be dropped along with ...
> 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v3:
> >  - Remove xen-command-line doc addition.
> 
> ... this? Beyond that (easy to adjust while committing)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Oh, indeed, I've added the changelog and didn't adjust the commit
message.

Thanks, Roger.

