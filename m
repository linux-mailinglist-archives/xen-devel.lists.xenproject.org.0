Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934AD69F354
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 12:16:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499382.770491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUn6E-0001j8-4A; Wed, 22 Feb 2023 11:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499382.770491; Wed, 22 Feb 2023 11:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUn6E-0001g2-0q; Wed, 22 Feb 2023 11:15:50 +0000
Received: by outflank-mailman (input) for mailman id 499382;
 Wed, 22 Feb 2023 11:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TNgZ=6S=citrix.com=prvs=410ac2269=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUn6B-0001fV-VE
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 11:15:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f6f2032-b2a2-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 12:15:45 +0100 (CET)
Received: from mail-dm3nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Feb 2023 06:15:42 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5048.namprd03.prod.outlook.com (2603:10b6:a03:1e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 11:15:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Wed, 22 Feb 2023
 11:15:40 +0000
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
X-Inumbo-ID: 3f6f2032-b2a2-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677064545;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sh1wpwHdxbDyGh9SykDiS26j5kbKk2jniYlLAR4RauU=;
  b=MJ1HYdMLThZ5RL+0nxaSnwvqgNKS3nDcuIH9sE5QcRtUbUbztN0Wfk5P
   LUgxaKTAVoanmJeer38vfZSInC3/jYi4kKA8m2BacBCgHdiBwZhsDzLlP
   xbnaNDZI91KNqfjM5uaIgMr4cqazRO39I9iPK6qgM/mDxZPaeeQ69qCFr
   o=;
X-IronPort-RemoteIP: 104.47.56.46
X-IronPort-MID: 98459504
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:L/0H9a9Lw69G+TydWFpvDrUDo3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WAcD2iHbqyKY2TyeN93YNnn8EgA6JDdy9BkSFM+pSo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6oR5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklVt
 sI5eSgtSimAvMz18ZGiU85FhugKeZyD0IM34hmMzBn/JNN+G9XvZv6P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilAvuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqCN5PReDgqpaGhnWU624ULRgqVWKirNKitGL5YNdzB
 m0br39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A79y4pog21kjLVow7TPDzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:Y985CqpWkg7QUrdKz8XkoRIaV5v5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssRAb6La90cy7LU80mqQFhbX5UY3SPjUO21HYT72Kj7GSugEIcheWnoEytZ
 uIG5IOcOEYZmIK6voSjjPIdurI9OP3i5xAyN2uvEtFfEVPUeVN/g15AgGUHglfQxRHP4MwEN
 656tBcrzStVHwLZoDjb0N1KtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 zukhD/5I+kr/anoyWspVP73tBzop/M29FDDMuDhow8LSjtsB+hYMBbV7iLrFkO0Z+SAAJBqr
 jxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oOTiLQhKQfZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIbRd3jUC5yEBS2tL7t0YvHLf2VYUh5LD3vXklZqvoJRiKn7zPxd
 MeRP01555tACynhj7izyVSKeeXLwgO9ye9MzU/U/OuokJrdVBCvjolLZ8k7wc9HdQGOu1529
 g=
X-IronPort-AV: E=Sophos;i="5.97,318,1669093200"; 
   d="scan'208";a="98459504"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxnIxDqrhlGrzG4L4e6Z06aCE0VlkujtoS1mF7YARIf5/YjUK1SJefJ0b35yQ0Ena2u5KuflVl01lXRCCN/QrnbYpCnJvZz8wwyJZWmreQf5Yu+CZVQme/2OpxIK+3RUWrjMq+ANV19iP61hLggWIHkO6Iim2Rxf7SwY26viDUzCkK91C6Cxi0iR6y3GwepEdgOFK/YLDiPLKlZ9PXtITOlMzrmMfn/+v00RB+UNQS6geGUf5my6/95AjnKEZ/X7yvcVoIPyIFIaLsrjHhZxwVei7BZp9YuNpdjhrkxFCzw2QXPFsq5xJ73Im17HejRCciszEb8A/niltiNp/Ay6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sh1wpwHdxbDyGh9SykDiS26j5kbKk2jniYlLAR4RauU=;
 b=LTSXyzspmmXeaIjSWFC4ovBnCRjUkzIOhqZbvYcTd/G+nUZYZS6NFgZDj2SAtK6jS+Shuf+PbF19efxwvXCaiASNrmbP20fQAkgE3HzIGVTPM18wfQZEqZileiO8DcnS69i3p7puUNhuvs5SLijCoqTWnscYMlXRS0u9CO33yjNJ6c3/1s1jNXda3dwTCMAcRot8U+4OMXlRbHZOm5zuTtSF4euDBNdyfPeusGE4tzqci6I64lzYaE/JOAvq2Vjsbc/pEo2KDJYuF/tW0m/HXGUCJ4pNSbFJZaRQFBcdI6+oeTgjWsSh8+L1lDJiu0PVyNSnegQId0B44NdNHWOMlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh1wpwHdxbDyGh9SykDiS26j5kbKk2jniYlLAR4RauU=;
 b=S1UETaq3Z6NuZTDCF+4PSGyvq+KtTfjmYkTxcK72ryZn3MUDJ9vWE2J219ryU+fqWKa9wXrfNR/KxY427o1JP1nQRr2zGbhGP64UxzeHN6529cYyvnVXLzZ6KazS7687T8XYOvAswjwF8KGNHVZhpbwwCfDjf3KXm072QGmbIDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c12f22e2-fec2-248b-c4cb-1d014f0c33d3@citrix.com>
Date: Wed, 22 Feb 2023 11:15:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/extable: hide use of negative offset from array start
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <359b8d70-0a97-8a52-fca4-4f6b7621d58c@suse.com>
In-Reply-To: <359b8d70-0a97-8a52-fca4-4f6b7621d58c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0307.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: d1782fc5-46d8-471c-32a0-08db14c62160
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zqvkKqwS5qg1St5RVPY2KQ3ouLdWBM0GTirfft1Ezkcoh2fzi6bj65V6F8pXKFFoe6SYuddgubdEv7GNrxCVRZorRDj550FDQQyqfWRfstjfOpe1nmAFeE6cZPGqtifNZcyNbdCwFQLl24UKRcsj2ZmK78Me5QDDOBxV7zxqDecmXrJbKTVpWZu06a9KM6xFVKZ0uqsnmWV6ieRfIkLydVrjDioOHhk2tpZVbEQPMfIydS7A1dskXIeTjZ73jbTVcSnMdmw8xDSNYHIbPlK0+CoFyf1FQhnbkVvPoNElBYf5vitY8OmQ9vkBu9Tb1fPt9mJq9TQSj2jMalDo1lN4SDVzIzIYdNSNOIFp5+G7h9qEEJfP1H8Zme9ex+sp61CdOP5EQurUB7CeJn5ZXgOYikzQ9KQBIt0oTaiP2of3eYUFRN3X7jHJ5IAG2N591jGrK380zYwXUy0rSoeJ9ThMRJUjJiSDjv//ZJKH7Hm6u9zfqL7pcR7xJPm077QE7OtxzPT5f9mYYMwqZ9u0CiGkw+V4W7xyEeu6bCs7XMMuYGXSUyoe6fqAhi9060Lb8wQQQ2l55ZjSRU2xemsMih63ZLrwagp5a1NZ5XjYd4iIEDSdlYCwkii+nG0tWM1aL8TLLY0pywW+f7hy9muj9CGUuFHrYPwLEeA5cSCJobLVXvjAWHLBbyxZBhKiJKPR/bNBFjkaU+FE023nRrgyzvWUzWLzxBdDM/9IcbLyJh5rimk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199018)(316002)(26005)(186003)(6512007)(53546011)(41300700001)(8676002)(66556008)(66476007)(66946007)(4326008)(6486002)(54906003)(6506007)(31696002)(478600001)(110136005)(86362001)(6666004)(107886003)(2906002)(36756003)(83380400001)(38100700002)(8936002)(2616005)(5660300002)(82960400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VURxWmorTE1DbENWekhVOEhBb0tsWWR5eHV0NURNMnJqSUlmVnRvNi93VGlH?=
 =?utf-8?B?ZStIU1Z3Q05qMUJtOSsvc1ArZmI3d2NjMVFCL0p0bUQ4ZlkyOUlaTUl1SDJ2?=
 =?utf-8?B?L2dYeGR4eWJXSXZtQ0RpRS9RQ3ZlUmxDdlNYYWRXWHZ6anNYMytiN1k1UVl4?=
 =?utf-8?B?MVpwMEFaVER6MFY3dG9YMmRKMHlRTFh2TXFJM29DaEd4OGV2NW5YQjBaQXVh?=
 =?utf-8?B?T2lhYzRKdUhML1ArRlNoU2NUU1lzMWt2QzJtQzdZU0xpcWlreXBTQW9OUFZo?=
 =?utf-8?B?MFNCQjNIRlY5aVlaN3pzamgrSHozd2d1UlU2NDJ0MGZINFhtZ2xDbi9Cemw2?=
 =?utf-8?B?SWpBT05BT2RXNkdDcjh2TnBYaXZ6TG05L1pxM1h2TTBTNlBrM3dBaE8yYzYw?=
 =?utf-8?B?VjJvZXEyNEhWT2dNa0ZnenFMOG1raGpRMkdhbjJRaFhtVXd0dVV1Mk9QSVhB?=
 =?utf-8?B?dHBlb1M5YlBrWXRtN0FHdmx2bjFQR0xkemZuU2xMNU5TWVdoUkdJWEdVSjZR?=
 =?utf-8?B?bmQ1WTY0c3huTzFPSmVsakhDeXlnd1h1SktlTzdzZnN3SXcyblhaRXQ2akNR?=
 =?utf-8?B?bHlrcmF0bHE1TVRjUkU0UE9tS0VCRVh6YmFMUVBHOEo2OEZ4dXhLUFN6bk4r?=
 =?utf-8?B?azZtUElkMUErdkV1MFhneUc4bUpOcllFaFpDK3FERndzNjdMNHRwTmdnYzJl?=
 =?utf-8?B?RTN3WXFxR1V1QkRheVFtZ0lEV3lWdnZOaXBvSjdpTnkrcEE2eFhTNDRFeXF5?=
 =?utf-8?B?S2xyNWNnNFRjblVpZmNpNzY4OUt6S004Z3B0RlZCNGMyQWlVdWIzb2hoWGV5?=
 =?utf-8?B?WkUvZUlYVklBN3czNTQwYzgxRDR6LzF2cEs3ZlUvTDFMZzhQTzRRODdaNExr?=
 =?utf-8?B?OGtSVGR5d2tOTU9Fa0FTNGM2Nk01NlcwandxVEtESloveHR5aFA4WlJCT0VE?=
 =?utf-8?B?blQ2Uk5lRHdjUmZEeHhueFptZlRFU3VXcWVGMUZmSUIyQlZoS0hrZzQxbW1S?=
 =?utf-8?B?VENqbTV3YStYalJ4MFplRzd1dStVM0ZtZEVyQ1RJMDhqSGlqY3F0V0lPUUJw?=
 =?utf-8?B?OXQxODVoRldKcEVsU3pXbnRnazY4RnZ0eXFjRXU4cTg0NmYva1ozUmpiM1pQ?=
 =?utf-8?B?SVdMeVFCcFNLUllVRlNFb3dGSThEeEpjZWRZRmZmV0pnSVFDdzVraHhhRjhF?=
 =?utf-8?B?SDB0RW4ySzMyVllNN2xrcmJUM3BkcnhKYUJqVkU3aW9PN1YrNDNZKzEyckZj?=
 =?utf-8?B?aUZiTGJIMGI0dXAvaG5tcEJWaEVScEJPbHZ4eDFhVjFINWo5SzZvYmF4QVNZ?=
 =?utf-8?B?YnhIcHJVZk5hQTVMZVhRUG9qaElHcmZNT05ORCttWWEwbmVJekorbzY3eDls?=
 =?utf-8?B?R2toODZtOWpuMlVVcTFFc3d3dTVUUzFCWVVIUy9sK1BiV1FCVFU1aDAzbjBV?=
 =?utf-8?B?S3Bpa2hieklnd0hjVHVkSW5sYTdTSy9WSy9DOWF1YzNBbDZaN2xudGRkbVZy?=
 =?utf-8?B?ZkdWWHkzeEpNZU1XMGZLOXpPdHJsYloyd3N6eXRzdjAwbWVhSWFzOFpId1hp?=
 =?utf-8?B?aDdETnk3U0N5bnBQaGwwdzBoWGVVamtqOHlMMEpQRHplV1g4QVU1bjhkdThJ?=
 =?utf-8?B?NTQ1Rld5c1JDa3JvaHVHQ3JjZi8zaWc0NFo5SUMzczkvUDNTUWZqMjVKWnhF?=
 =?utf-8?B?MHNNWEFxRHU0YzhIZHNpUnlaMGdNOGRFZngxQTRJaGI1VzE1WTkyaDdMcEFD?=
 =?utf-8?B?cWs3STd5WjN3UGZWRE9XTnp5TnBlRXNyb3hvOVpuNFc5eUNxQ2F2anhzdXZj?=
 =?utf-8?B?d3RGTERGSEROYWJHOW5lbDI0b2tLdDYxV2pOQjlkc3Bva25IUXhkUXRESEZn?=
 =?utf-8?B?eHk2Qk1hRmE4ZlVWd1AxMjBqc2kyNzlLcWJza1dEb0ppVlBuMkRpL3FPMEFl?=
 =?utf-8?B?d1RXbUdFZ1R0a0c3REF1VDJON2pRYTVhNzRHNFRnWUJ1eFU4dWdVaVBIUjhJ?=
 =?utf-8?B?UHg4YkQxTVR1U2liZkswYmYrV0lseFZ6S3pUejVhc2lsTUFyeWlVYUZGQnF4?=
 =?utf-8?B?eWUxazFpeHBWWVd4TFhzN1RkSHlTdTR0dzk1VFBheThHU2R5R1FpR21VWDJv?=
 =?utf-8?B?bWM2c21xVDhOc1FJa3ROam5FZFlidXZmZ2w3bjNPUFBtRVhDTmJwRU5yelNu?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5WaRLXyAT3CHaxWY9fqYwzWtP3SQqF0oblRMwTIp0lqDYX0Zo5RQLfd5dn/GVHyU3C8pE8CAjwYVqRfCPld5NricOSiJWs4m3+2SN00+cZN+mYM4JFLiqzjaDCkZAmMK0jFrfwfYRv3lqucwWbsqzLkqrIFtK1QMfWUk1Ty5D6B3FcybPrrShLO/fHl0jhCiEL7NXJNq+whjNWhjKk1Alkpcrtxxn5LrpotVwfgGq9C76/VgUXfX4+2Hm6I+cYOsYLY87XCatcGFgzxZx2xUgIop3+wmlU5+1eYAGGt99IdES42Z6wukN5lfoWcRxNiQjkdozYFTFA0+2z3LWkKQ/VWzRTlhfIbx4UIkxBNumFioGN/cW2FWnMgF+/9FClKfPG62j8OFD1eHN7CHZmpmiuTstPXJoQwqerdRlznGFjTYnoqJbYtodIgy+EmsQKraI55tZ+VS0UsaUzlnUScIkRLkUI0VrKx2W1sharLa98x8SsuPx7hKDW0XzR+m8rgkIsZ3sanYc7VpLj7geppCbPzNqYxaAea9oc/rEiIrSAnl3L+i/Hp097WyaUMMcwkif4Fhb01/ApIhnA/2kZf5hJ9sVY7wAI3f3XM5IX5aUwGTJiH5tO2qPybwmWLrQ+j6wrTVVDIi2HJwCS0BRZPMa51mY6cQtTFO/a3Cmsi79OABoOCDeXCGX2KkoJSY9z9Pfhr8Nl1qjVwgKPlINmmijtN8eRRWgfnPbztWWvKf3IFZ/KKLydFBRVhD2UXVp5YzA6kYFgPCM1UGkVHLwN6l8y43j1w/fRq0RqtjUK7Kv+k1+0EXI88+WdBuuybgzzod5PyeYlUKYZiEGxVhbgI5kw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1782fc5-46d8-471c-32a0-08db14c62160
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 11:15:40.1433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Jc28apq47cVWzndqgHzbjRC1MmfdVLMMf875jVRuck16ZXu9jEs5RL9RDlJt+h3Gtxmr8ZuCqHYvHtvFicP/sMvdqacwmAn5x97C6jC4hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5048

On 22/02/2023 10:22 am, Jan Beulich wrote:
> In COVERAGE=y but DEBUG=n builds (observed by randconfig testing) gcc12
> takes issue with the subtraction of 1 from __stop___pre_ex_table[],
> considering this an out of bounds access. Not being able to know that
> the symbol actually marks the end of an array, the compiler is kind of
> right with this diagnosis. Move the subtraction into the function.
>
> Reported-by: Anthony PERARD <anthony.perard@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> To keep things simple, I'm merely calculating "last" as a local variable
> now, rather than replacing its uses by suitable ones of "end". In the
> longer run it may become necessary to actually go this 2nd step, as in
> principle the compiler could inline the function and then still spot the
> same issue. However, while the subtraction of 1 can likely be avoided by
> suitable other adjustments, "last - first" cannot easily be. Yet that's
> also an offense, in that it's calculating the difference between pointers
> into distinct objects.

All of these bugs are ultimately because gcc doesn't know that these two
labels are the bounds of a single array, and not separate objects.

There is no possible at all to get rid of the "last - first" calculation
- this is a binary search through an array.  But it's also not going to
actually stop working, because this is the common (and documented) way
of getting linker symbols into C.

For the patch, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>  but
if it were me, I'd have gone one step further and made
search_one_extable() into a more normal looking binary search.

