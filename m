Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2CE5EAAE9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 17:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411952.655098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpzS-00039U-RW; Mon, 26 Sep 2022 15:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411952.655098; Mon, 26 Sep 2022 15:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpzS-00036q-N5; Mon, 26 Sep 2022 15:25:50 +0000
Received: by outflank-mailman (input) for mailman id 411952;
 Mon, 26 Sep 2022 15:25:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s/Db=Z5=citrix.com=prvs=261f3fdbd=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ocpzR-00036h-3V
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 15:25:49 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e166a69-3daf-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 17:25:47 +0200 (CEST)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 11:25:44 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6356.namprd03.prod.outlook.com (2603:10b6:806:1b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 15:25:41 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Mon, 26 Sep 2022
 15:25:40 +0000
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
X-Inumbo-ID: 7e166a69-3daf-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664205947;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bmFuzDKtt4P5elToqE7wMR0a1iWWoYrpzRp6TdpvKsY=;
  b=PAat7X1yC+kD06ssqXsaj9esUA9qlqtSIrtoKBrYgtWFAZLrGDmclgo6
   1d13tx55zJQaKUg9824OnkyHxzxr1JJ2qbcgvI8WPhSNtBFtFR8pOFE5l
   cpFOXZHOwfwG2nuyMrpes9yfCkbccK2Iw+hclfENKvk9x8tehFG/m2cLl
   A=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 81019734
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nSdkZKCrVn6i0BVW/xPiw5YqxClBgxIJ4kV8jS/XYbTApGt23j0Ez
 2sfDDvUM6mCMTT9KIx/aY+2p0IP7ZfczYM1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpFsfzb8XuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW3jLz/hJVGo8BoE/xvpxEXwJ/
 /wZKC9YO3hvh8ruqF66Ys9Fo516aeLMZcYYsHwmyizFB/E7R5yFW7/N+dJTwDY3gIZJAOraY
 M0aLzFoaXwsYTUWYgtRVM14wbnu3yeuG9FbgAv9Sa4f+W/cwRY3yLHwGNHUZsaLVYNemUPwS
 mfurz2hW0BFb4D3JTytyjWsi7+Iu3nCSYMyF+fj2fxYuGLL/zlGYPERfR7hyRWjsWa8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJ4EfA+6QyL4rrZ5UCeHGdsZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5e/LWdi9T0HXT7x
 GmMpS1n3rEL15dVhuO84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComVvlhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:+RBnhahFA6rvNnX3fX7EIchhUXBQX0F13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nGPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SuV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A7eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6Nq+TgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQf003MwmP29yUkqp/1WGmLeXLzQO91a9MwI/U/WuondrdCsT9Tpa+CQd9k1whq7VBaM0pd
 gsCZ4Y5I2mfvVmE56VO91xMPdfKla9NS4kY1jiVmjPJeUgB0/njaLRzfEc2NyKEaZ4v6fa3q
 6xG29liQ==
X-IronPort-AV: E=Sophos;i="5.93,346,1654574400"; 
   d="scan'208";a="81019734"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzXd7B4i7ZXcF75aUjOwAUj2faB5t3m4ccbAp/DFrj15UjHc5Uw2k8j56n+2nJbOy3kGgVbdBY7QEeJwtNZYoVE9JC3B6LdsemHV3mDCkRLAAVFUttxA9NZa4GoSg5II8lv02of3fNLelqb9a8jqiPoxpiFJ/2mntM6b/y1TnJNC6FkIZr6COIP3bB1Hnrb4DzuxVu/QMTIoa0T/F7fOLVnSM4nAw9wO5jTsIibODRE7+c2xmAr4biV+ShWeEl5XUQ3am6k2j1WE0OYuCP3sV0grNny2JnQEByEHUZnASxnWvIDwSjQDpCwhkSWBmqirrlEk/PS3IYxnTJBW3gt7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARH08HiEFmVD7NCXgJKkWl4jAjE/EKEh6gR9WFHS78M=;
 b=faPA+rpfawczj+UlgNHPFr5nG6Qxar670s76HyoDDUR9I/1BoQrpnAAUNjtvL4qlQFUGXAtaEKxyGV1fAcuLs22A1p4hQ02XTDwvsBETO4QK98+KaebVR71O94d8VXwWg26un16IOMAxgdDPOxFbdFZguJ+zE0VkBsCKIUoBRaLu2rZzVJptSQUr//5q8Xlnz/7O7w5AmgouDKEb8QvoehxaVO4dyQQQ9rjeCx0BgU+KeTZ/W4fF+/2jjM2FrVhyxLzCCSkrX942u2tZ9UzwFANDfnwvTQXZxPiA/tfhQz50Hy78rzpGYoJmbZ1ZyX16wyY71kT5bgYJTeqdpcAClw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARH08HiEFmVD7NCXgJKkWl4jAjE/EKEh6gR9WFHS78M=;
 b=jlizKvnsZmXouXY1gMBQccSokoT/UolWrM4p2yXv4Radhx4oedp/W6a3mMldqZe/eOHZKJnh6zyXVrdrB6bkXNTCP1En0MjhZqVr+fCsIpNe25qp4AoNLe/LXFSPFYGKq9nFxUYOyHaNzPy6v2MZF3My9Pk/V8HpB/WbdY7OYFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 26 Sep 2022 17:25:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/ept: limit calls to memory_type_changed()
Message-ID: <YzHEcdCtch7lKh4G@MacBook-Air-de-Roger.local>
References: <20220922160516.5929-1-roger.pau@citrix.com>
 <ddac718b-0ffd-0eb6-d784-4c35ee4b42cf@suse.com>
 <Yy1vvemAmiTdPZxA@MacBook-Air-de-Roger.local>
 <489b2308-8ab8-c1c0-1471-04aa1c4bf0dc@suse.com>
 <YzG8Ln2cYTuxF513@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YzG8Ln2cYTuxF513@MacBook-Air-de-Roger.local>
X-ClientProxiedBy: BN9PR03CA0769.namprd03.prod.outlook.com
 (2603:10b6:408:13a::24) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: 2002deaf-7ca3-406c-12fa-08da9fd35ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IZcvBaluyoTsedCxLMIs5KJnP0Zh4Ug9oeO0Z9LTJdL3r34KfT3GGL2Z+7YBGyGaV6odHxHb98Qjn8hJahKnf0iRWiSWSSgxbhG5B/NbECpgAV17wnODttE+6GWpuuuLEeJcVxtQcU+KHpwDuvLRfOnJJhJxNTEMnpRE38zYXOQiYj+SWBIygn0yP4CGFPZ6SZOwQLDFwb7pBc/AoaLLVUpNBBrZn6A3GPENUxVCXau+JMui8IKv6Z7eF66MvooIB5CrOshgJDeebgiKPirFk7PSTZQbIsY9synOUepUkUu1OhnIU9Eurjl8aS4o0us949kZv1/zEiXpaU8RlNnysIO/uK8egZ8IZoq/5W3sHK4nV3bFh0t6cEBtgIDpPsJn27KyVLZkfzCG+kGB0P+qxvl5cVQJ+n7PxonsgiXJ5WREhmeEvEopazuke7A4uZhSqFoUtJhGebf7oKn8JPkjxoWKqsRuMWQqv306svFDoX69te8lWXO6QqijQx3MTeWmjMCA+iVEw+D35bcp042jWG9tZVvTfawd/O+f6sHIfWQ6Di4eJKz5jbaJd6EOVEDsDLyH3De0o0QQ5Hg6RDa/MiQ1WOqM9OW7Rj4VjpdDJ0B9YPAsE57NZA7DMXpDRXpMM0hRNFHQxBfN473YwcDJPg7i+Y0T4dqcPnNyf2SqEVqeWO2q0Cv1cqTBxG5xf5k7vSFy9E0I2YWc/Uq97sjqnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199015)(6512007)(9686003)(53546011)(85182001)(5660300002)(26005)(2906002)(6862004)(66556008)(66946007)(66476007)(4326008)(8676002)(6506007)(8936002)(41300700001)(6666004)(38100700002)(86362001)(6200100001)(186003)(82960400001)(54906003)(83380400001)(316002)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REIxU3lyMXNldmhVbHFnSXZnbWtxMks3Vkg3V0hnRFNWY1FCck1zeHd0aUJO?=
 =?utf-8?B?dUQ5QUtBWiszMEUwTTdFT2NNZ3VqbFdJam5RNlVIRXdoWUZqR252eDlTeENS?=
 =?utf-8?B?MThldXVvNDlLL2RNUmhJRE0xQU84d3MxQVNoOGlRMjRCeGlzanhyYUI5Unll?=
 =?utf-8?B?WmNOVjZaSGZkMlBITXM2OU5ndGlSYysrZWFFeFJIZDB4YW1WYzRVb0psU3Zq?=
 =?utf-8?B?U09HL3R2MFFyWFBOZ1ZTUVdmRlNBd1NoblMyT3NMbXhYNFJUbVB0d1d4dFRz?=
 =?utf-8?B?aFA1NENZSUE0cmtBZjNFeVljRzBObmZUM3N0bVpMOU5wWGxIQTNxNFNUaC9a?=
 =?utf-8?B?L2Zra29lUXFMTURYaGtSWGI1ZE02cGpNU0NVQ05UOHpHNXBXS3BXTDlMWVpD?=
 =?utf-8?B?MDFEWW9ScHdRRExISTBubldHL2JiWnVjRXA1eU1DQzE0bFlwa2hvdjBIbDZP?=
 =?utf-8?B?bHlOSVpTcEZGaUc5WWNPWHRKd3lqVFBwWmpyZjIyREZ6V1U0V2cxWDNJakFa?=
 =?utf-8?B?aFl5cFlkc0ZmUWVyRDhJcUtyL3lQVVFUSzRwUTEzK1pCME84eDBnMUtJMmRP?=
 =?utf-8?B?VklOL003ekNSdW9Ba3VaWXJ4RFNBN0tpc0dBcWM4bkZyTHBXQkp1ell5Uk9G?=
 =?utf-8?B?TTllQW8rRjQxMTQzbzdKYStyREFSN0kyNldSWU5Ecm1BclltZ2gxTk9BQjZF?=
 =?utf-8?B?ek42Tkcza2dyRG13eHNKTmczSHgzbkVHczhHMjNXdlc1Y3A5L0dFRFJ5dERK?=
 =?utf-8?B?VG9BaHA0WThvYjVoRkN2SEFDRmcwUVFyWUxSN1YzNWpFa2xRcDgvTnRTRCtQ?=
 =?utf-8?B?UktxWXd5R21TTjFGWm0xMUQzYkxpWmZOSDUveml6Zi9yVGFyaFAzMjM5TlIz?=
 =?utf-8?B?Q1g4eUhwZVM2TUNTbjFFdmFWMkE3VDJRNnovbzFGenpJUUxYa3BxZEJOeHFY?=
 =?utf-8?B?TFdYcnNQbXBxWGN6b2FRbTAzLzB4dTRrT3hJZWNPLzJNU1RjWU1vYzFTeVAw?=
 =?utf-8?B?WmtNdndZUEdBS3lWTnVjcnI4dkxnMTZKVDRkaGd4bVBXV0luSUNBZEtsanYx?=
 =?utf-8?B?NGRsQnFVWThhMkNEZGxhd3F4amFsOUlwTXJrV3RVcloyMzFXTFkzUlRJaVRn?=
 =?utf-8?B?bEljdEhJQzNRQ2lUZFZUUHYwQjE4K3BtNkdNSFpNOTlvUFhmSXcxNklTaStQ?=
 =?utf-8?B?REo3K2hia1MvTzNSd1E3eWxTUEtqNkNtdUlPSWl1d3lsRzV5Q0JLNGFTTGZL?=
 =?utf-8?B?MXhGeHVzQllQOGxEenhhMWZZbWxncUduTkQweGpQeDlmTHNXcGVqaktYR2ds?=
 =?utf-8?B?ZlE5U0UxL0lkRUVWRHhQSkJjcUFMdHpJZi93TVpoUytRb2tsTVUzRzFzR2FU?=
 =?utf-8?B?WExySFRPTnV3V29DcHFMc1JMZGpPc0xxY3BCUDl1RVRmQk9ya3Q2dmE4akZV?=
 =?utf-8?B?Zis2V1dCS3R6aFRZdVNNUDNkV2t1akhOSEFhWlJuQmE2eXRkZGRFT2NQaFpa?=
 =?utf-8?B?UW5FUThsY0JJR2lMZEY3MCt2U2hGbnQ4S0RSYTl5MzJFa3lQbS9tUVF4b1FL?=
 =?utf-8?B?MHpudmNCb1ljYldYa09ZWjhySmRLR3BEOHNUeTRjRmJIcUNlTmQ1cGh1MGww?=
 =?utf-8?B?QW4vR01JM1l2bTlodlVZdXYvU1FlRkZsQldVemJaU0hXbUpPN0UzRGNvOHJX?=
 =?utf-8?B?VXRadG85VmhmQVdBWnp1dlRyUWdQZkkrYVFYaDBwNE5kUmVEOGxBcG5aN2RM?=
 =?utf-8?B?Mi9QUU04WmpkUzVpcHVSMHBocmtMQ0VCWUUrbGhoaVZ6dTBmTUc5RlBORlY5?=
 =?utf-8?B?UEZxN3dMU0hQWHE3dTYrK1dZS2FLN0xWZ3VhYzIrRG5lU1dkVmxCTnVLUWov?=
 =?utf-8?B?d3ZwSldNQlo0M1pjM0l4cUlvN0NhYzFJRFRsME1KYnBvVVBBa3drM2ZRKzM1?=
 =?utf-8?B?TEd5VTNRRytyRlU4TlhsUmJrNU9GYUFFa3dCUjJoSVNtWHEvWlVxQ3FEWEoz?=
 =?utf-8?B?WUpaSHFwMldzRHBaMTNrckFQRmZNQjBJQmFESmJXUzRIRHA4cW5pbEN1eERR?=
 =?utf-8?B?UGlzdmdCNkF5NTFrazZFa3RLeFVTTmY3OE8wT1U2N0VJenRxRHdTRUMxNy9t?=
 =?utf-8?B?dFZXOThEVzlSK241RE9VcmlHQ25USlN6Sm5SWkJMZllaSHRhbWlHeE1IREdD?=
 =?utf-8?B?bFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2002deaf-7ca3-406c-12fa-08da9fd35ed9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 15:25:40.8296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RR56+XcGB37INdy6v9Z1/Ubseq8rQiJbpEY9hl7GAMErBCu2tehKYdyCqZQGdjQ7jmbsX/cKBd4zTqG2S4lxGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6356

On Mon, Sep 26, 2022 at 04:50:22PM +0200, Roger Pau Monné wrote:
> On Mon, Sep 26, 2022 at 09:33:10AM +0200, Jan Beulich wrote:
> > On 23.09.2022 10:35, Roger Pau Monné wrote:
> > > On Thu, Sep 22, 2022 at 09:21:59PM +0200, Jan Beulich wrote:
> > >> On 22.09.2022 18:05, Roger Pau Monne wrote:
> > >>> memory_type_changed() is currently only implemented for Intel EPT, and
> > >>> results in the invalidation of EMT attributes on all the entries in
> > >>> the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
> > >>> when the guest tries to access any gfns for the first time, which
> > >>> results in the recalculation of the EMT for the accessed page.  The
> > >>> vmexit and the recalculations are expensive, and as such should be
> > >>> avoided when possible.
> > >>>
> > >>> Remove the call to memory_type_changed() from
> > >>> XEN_DOMCTL_memory_mapping: there are no modifications of the
> > >>> iomem_caps ranges anymore that could alter the return of
> > >>> cache_flush_permitted() from that domctl.
> > >>
> > >> I certainly agree - this was an oversight when the two aspects were
> > >> split. One might argue this is a (performance) fix to the earlier
> > >> commit, and hence might want to go on its own with a Fixes: tag.
> > > 
> > > Was wondering myself, didn't add the 'Fixes:' tag because of the extra
> > > content.
> > > 
> > >>> Calls to memory_type_changed() resulting from changes to the domain
> > >>> iomem_caps or ioport_caps ranges are only relevant for EMT
> > >>> calculations if the IOMMU is not enabled, and the call has resulted in
> > >>> a change to the return value of cache_flush_permitted().
> > >>
> > >> I'm less certain here: These shouldn't be frequent operations, so
> > >> their impact on the guest should be limited?
> > > 
> > > Citrix has an use case for vGPU where IOMMU regions are added and
> > > removed during guest runtime.  Such functionality makes uses of both
> > > XEN_DOMCTL_iomem_permission and XEN_DOMCTL_memory_mapping.
> > 
> > I see. Maybe this would want saying in the description, to express
> > that there's little expected benefit for upstream.
> 
> I guess any OS that moves BARs around will also trigger such code
> paths, but that might not be very common.  I can add something to the
> description.
> 
> > > While the memory_type_changed() call in XEN_DOMCTL_memory_mapping
> > > seems to be the most problematic performance wise, I though it was
> > > nice to try to avoid memory_type_changed() as much as possible, as
> > > those tax the guest quite heavily with EPT_MISCONFIG faults and the
> > > recalculation logic.
> > 
> > Trying to avoid this is certainly desirable, I agree. But we need
> > to make sure that it's not "easy" to break things by touching one
> > place but leaving others alone which really would need keeping in
> > sync. Therefore I'd see such added logic as acceptable only if the
> > risk towards future changes is sufficiently low.
> > 
> > >> And if we were to restrict the calls, I think we need to clearly
> > >> tie together the various places which need updating together in
> > >> case e.g. the condition in epte_get_entry_emt() is changed.
> > >> Minimally by way of comments, but maybe by way of a small helper
> > >> function (for which I can't seem to be able to think of a good
> > >> name) sitting next to epte_get_entry_emt().
> > > 
> > > Such helper function is also kind of problematic, as it would have to
> > > live in p2m-ept.c but be used in domctl.c and x86/domctl.c?  It would
> > > have to go through the p2m_domain indirection structure.
> > 
> > It would need abstraction at the arch level as well as for !HVM configs
> > on x86. I'm not sure the indirection layer would actually be needed, as
> > the contents of the function - despite wanting placing in p2m-ept.c -
> > isn't really vendor dependent. (If AMD/SVM gained a need for a similar
> > helper, things would nee re-evaluating.)
> 
> Maybe it would be better to add the calls to memory_type_changed()
> directly in iomem_{permit,deny}_access() and
> ioports_{permit,deny}_access itself?
> 
> That would also allow to remove the noop Arm memory_type_changed()
> halper.

Correction: the Arm memory_type_changed() needs to stay, as
iomem_{permit,deny}_access() is common code.

Regards, Roger.

