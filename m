Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E8952EE58
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 16:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334348.558354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3ml-0004ql-Fc; Fri, 20 May 2022 14:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334348.558354; Fri, 20 May 2022 14:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3ml-0004nr-CF; Fri, 20 May 2022 14:39:23 +0000
Received: by outflank-mailman (input) for mailman id 334348;
 Fri, 20 May 2022 14:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns3mj-0004nl-Dw
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 14:39:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98d79556-d84a-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 16:39:06 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 10:38:59 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB2849.namprd03.prod.outlook.com (2603:10b6:404:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Fri, 20 May
 2022 14:38:58 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 14:38:58 +0000
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
X-Inumbo-ID: 98d79556-d84a-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653057559;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hwahVbhThukWNLmfnLTNeQOWyK/Q5fuo8ULIfLHESuY=;
  b=Q46xN52ViEijCqWGEDa8U6FUDl3tohYaunPU/kyd5tI4Scn1KDlANfSE
   IqOVcz6tw1xpmMoOybGB3MhFdRyYsspL1kER2vq+EcmEEBjrGEl7Q3vru
   P0ncimzFbDgzyM7DgzJ2gC3sTXLp/RhlrIcwU3tjElZE+Lu4UvWOvdKhV
   M=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 71168849
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WMzOu6iWEyTGZtBW08/7AMsRX161GxEKZh0ujC45NGQN5FlHY01je
 htvW2CFbqyNMTejetp/PIW+9UsP75OHn9E2HFZoqSswFXkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlnV4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSxyJq7PnMM8akBnCAImP65p1qfGJnfq5KR/z2WeG5ft69NHKRhseKgnoKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMu4EegG9YasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8QvL9fprsgA/yiQtyoe1YYvMZ+aFROgKxkGph
 Fjn3mXAV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwWxvXqsrhMaHd1KHIUS9wWl2qfSpQGDCQA5oiVpbdUnsIozWmYs3
 1rQxdfxX2Qz6PuSVG6X8aqSoXWqIy8JIGQeZCgCCwwY/93kp4J1hRXKJjp+LJOIYhTOMWmY6
 1i3QOIW2N3/UeZjO32HwG36
IronPort-HdrOrdr: A9a23:QAkPLqo8urE6o//WUOWiIxUaV5u5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wI9HdwGOtx5Dt
 //Q9VVfYF1P7ErhJ1GdZc8qOuMexvwqEH3QRSvyWqOLtB1B1v977jK3Z4S2MaGPLQ18bpaou
 WybLofjx95R37T
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71168849"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xnv5CpcV9B23d8wGUruu+eLZ8LFJL5HUH8uRr257Ulq30MOdfaijXhYbCCU5b0DOHFCvm7TlTYAtzYz6S/bia7WFEpI4hRlAGzPo6hGKtByuCo9ZsmwIRogddsU+Dys122IhbFTtP6JuTs0lH7UF7RuMdFwokUlCh5KBfD+K5GQKdnXZgc3mbS8zVz2QklelM4SRcefeKvyLVh3EnT+H7zsKHiHZImneLiB3n35vndWztzZC6ZrH40Fmt/PzuVjepykmesdbtV95p3C8Ra5GdMqDHXqUuLrMorNi8pGupNKL15K5JB+n2oN+b3RCxUV/UbBNCdYdHyw77lXeIFQicA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9c2QB+/UfFbD1WhIYVZAX4nGis3KjHoOsQOs8VFihk=;
 b=hfoN8Q5xd5oKoHjykjD/jzvHNmklkzGDbQhObe59l5THKwJokGNf0wDlU/zW4DZaV2iZ6nOe4T/G7uO3T9cOakbAvbMYLkPpgACNkxU0yc9id97ms5C1u12FSATCmTGb6Iss/K6Ge7G17YowgmQhWkp/PtujELf5xC9/6Ev4xlL6V9LmFo5otKiivHKoqAbi3SOmBThQOtJ/ghWX+A+/33dqp1f3Tu28YLLeHs5IHNp5LT6Dqlkt6lNxWsmwEdIbfuZy0nr6m7W3UaKcYdjYfBakQdJ7Loupc7ytA0ZOnGor6QT71sl2VmbAd4QzTKubWofvTf267ZMTPCf8cV+WVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9c2QB+/UfFbD1WhIYVZAX4nGis3KjHoOsQOs8VFihk=;
 b=nH3/PEr9zzCQYaConnsgpoFpovnzN1FSBm2CUkdytBBoD0rXvSiogQX2A706ObVJ75tkYfSGQaGRvoh4u/qCIOLFviVSvR6NwFWrfcpjqmUYt6cR66ydBzCQnbzX4bJLK/7cjfSkvDct5StG+T6gX6hgpCFT7vKwAtFBLJZaYcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 16:38:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 13/21] IOMMU/x86: prefill newly allocate page tables
Message-ID: <Yoen/kI3WTIZaEQ6@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <9d073a05-0c7d-4989-7a38-93cd5b01d071@suse.com>
 <YnUDeR5feSsmbCVF@Air-de-Roger>
 <6666ab70-b68a-eac5-a632-893f950a984a@suse.com>
 <Yodx21zhWtZCV2dY@Air-de-Roger>
 <600c894e-a35b-e27c-898e-8f1cf3ea0ee4@suse.com>
 <7163fdba-c128-1226-e1cc-d210c5db06ad@suse.com>
 <YoeH+9eMU0ui68Mn@Air-de-Roger>
 <ae722d7b-a958-1927-abfd-43c04bc6b369@suse.com>
 <Yoelfhe5wLGy2cfd@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yoelfhe5wLGy2cfd@Air-de-Roger>
X-ClientProxiedBy: LNXP265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d507643-03bb-4184-1b5a-08da3a6e7914
X-MS-TrafficTypeDiagnostic: BN6PR03MB2849:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB28497ECE50374A0D317CF4C48FD39@BN6PR03MB2849.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X98SmXuTxp7U9J5T/UGkrn3NqCXZ+pFchrFORKDwoy2WFVLnwiBE3b1hUnFUn5+/305qql34pvVo1SGo03vlInaOD5Q+SD9hS4zG2G63Zj6qveM1uNkRLUzAFXWTXcMjS6YybjTTwyO6AMSd+f5ck7cKx7uiJWEdPH+dKgvuLDHYoPmN1F99EdJsrRTYLucSBfVRzY/z8x3MlJlaGcp4N62MjwM2WyY+iwbZXg77kNdnB6eAqcikrDcVq3eSDnIp3zHWW+yAgufDitdpREPXxZg3ychH8pm+oeQofJLJ0BYuwcd0aCjpKPJY7jeC0Hk1/9VuZh5jI51ATOaHdrTi4Dgivx4EIF7Qz8v/D5VfH9ajK6SE+khwN1lQRF1FzHaXS+LijuyNdv9hdE8tPcpf45dZR2f/tWz3LfQf/CgbLM8GftpofIjFkDD5e6fF8zvHsQz88nw4lKG7xchnK6a1nJuRn4Pr7Rgk3+bw5bQszZTxb8ghvTlbzH4VEMhCwhnkLo5q21+hyj6Am/V/i4+WqK0dHj0oxn01Fz9qtzMyWNfYN9sMCAoVht1w0SmRC9qgXrbgkZQ2FV/qtbAkRt05EgSpYxMuV53ijBfZhjWkiz8AtSU8GnYAqCN7Sdkh0dQFrV+upiIfyXcKNw5NqqNI3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66476007)(66946007)(66556008)(8936002)(53546011)(316002)(4326008)(86362001)(8676002)(54906003)(6916009)(9686003)(6512007)(82960400001)(26005)(6506007)(6666004)(186003)(85182001)(6486002)(508600001)(38100700002)(2906002)(33716001)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2ZsbUhxbWZleExoOFVpdmlxNGhKSHFqblZLalEzNHpNaTN2STRTelhPWGNE?=
 =?utf-8?B?dXk1Nm42cC9sWW5oQ083UEx6cFRCVHFTSk14U3VmV3J5d2t1eHN0bE1sQnRO?=
 =?utf-8?B?TjJXZHRReHhiaVcyOUV2Rk5mdk1ZWStmTDREaW5OeUtRL3RMa2RKK1R6Yk9O?=
 =?utf-8?B?aWJVWm1OakZkaTBjVDNzWkxIMDVHVUFYeFhLTmFKMXF1SFkwTlYrR29aKzRh?=
 =?utf-8?B?cUxLbHZ5bi9uenRwa0dLZjMvNkRmK0RhMlVqYTlhTEFOQ0F0RTRzL2YrRElT?=
 =?utf-8?B?Z013ZUN1T2VNN1RlZHN1VG1LVnk4ak9BNUt6a0VXdXdrSzZwTndkRVZQT1ZF?=
 =?utf-8?B?NG9pZnpCR2hvc0drek1aVlVxUHc0N2JUS1V6NytoZHdoK0tuaDFtcXBWekJm?=
 =?utf-8?B?aWlPOWQvMWUzWjRLQlNEMUdzZkxwTjZ6aEZ3bzJJWmIzQlJGZnJZTDdKYnNL?=
 =?utf-8?B?TDZQVGJmUDJBZnpwR0IvZUt0QkVKUEEyRnJsR3V2eWFGZkZwYkh0S2pSUmVv?=
 =?utf-8?B?R2RUVVlJcjdOcWtPdmpPVDNicVJybFhoTlBDOTRHeXFMN295RzJiM25sOU9z?=
 =?utf-8?B?NTRid2dRNFBDeUNhRjF3Qk55T0c0aWp2UG4yMEZBNzFvN1VUckhFQzRTOGpw?=
 =?utf-8?B?SkZYTG1sdkFKSlhBNjVMcklPdXo5aVlBcmNYSENUazl0bEMzNUp4NXhFaHlM?=
 =?utf-8?B?d3BLQ2paVGN2WHpYU0cvc1ZWRG5YajZXNUFZcWp5TXIvVUFBWG56QUYxck5S?=
 =?utf-8?B?KzF4Q09PeXZnTzl2UHZ5Z2YzcEViNFo3VkhrZS82UUVqUjN4cUtyQkd2Si9J?=
 =?utf-8?B?MGRDcWhsQjlscW9BSjBiNExvS2EvcGlGOWpEL25vT0FwdzJxQmlndDZOckQv?=
 =?utf-8?B?VVY4d0pVemlsNWtaaFBKTTRrekFOVnpvSHAxc0R4S2N6UFlDRWFwb2hkbmpw?=
 =?utf-8?B?Q3VBV1VkSFF0bUMvYnhWRVBRSllKTXFMOFl2Q1JQTEZpZHo4d0JuVjJYNUF2?=
 =?utf-8?B?V2U0bElKZ28rSy84QzVKbmZ5eTFwa0FlSlJNTVQ1aFZYL3VoMmVzd29BbmR0?=
 =?utf-8?B?dnhMVjR4WGIrcUNFcUZNcjk5STVIWXVMRzkvcU1kTjJQd0lGQW43eTlZYk4r?=
 =?utf-8?B?VkxxYmxmME85Yy9wVkNhN3VSYWRmVEdHRzQzWGxSUFozMjR4QXVkTUdXaEZ6?=
 =?utf-8?B?ZW44S0VrMTcwc3MzUlhUL2F1SFhYdU43VmRLTXhoZnRvWGd6aWhnY2taVktY?=
 =?utf-8?B?d1p4OFdiWmYrWGdRRnFhVVZzb1BtVVRxNWcwa09UTVE2UzhhaDJ3VGtURFd2?=
 =?utf-8?B?eFZQRnFhdlR0ekIzbWRuN1lGbGhLWCtUY3I1M05oME9McDVFY0JtcmpFQjF1?=
 =?utf-8?B?QWFCUWhXd091OHJVaGQ1bDlJVFJ6Q0ltZEd5V3ZtYnBPMGJyY2xKaHNyMGdT?=
 =?utf-8?B?M2N2bGNBWXVOTm5HdVcwcXFpV043aWRsaEdhWkdudXNxTEVNUDlobUZiRVh3?=
 =?utf-8?B?UHNKRWRhbTV6bHEvNUVaZUFlZFVUZ04yRXJzSXBHNnVQM3E0ek5zTGtOazFy?=
 =?utf-8?B?b3dTN2dSNnpMblk3MDRkejlwMkdqNEg4Sld0UjVEQUVES1NkZmJzSXp5eW5L?=
 =?utf-8?B?RWllN0VIRXFWa3BBSFJ6ZEhVS2pncXNtSHliRk43Y3l1azU5RnI4RkVobEFB?=
 =?utf-8?B?RkZldko2NXp3ZThwdG96SU9WaUdsMlFCMVN3dVBza2ZZMFNpOGxjT3Z0NFkw?=
 =?utf-8?B?TVlWSzRHOTFRRC9VMUZwZUl0WXdiK3h6L3lidzJQZHpjYTl6MWoxZGN0QmRE?=
 =?utf-8?B?TXk2T05NbmFuWEs5YkdQTlBoUkdjRnRvNTdBL2NudVVBTjI5b0Q3NGxYcmdw?=
 =?utf-8?B?QkpmVFlSTTlZM3dSaEI5VW9TZFZlOWl6NE9LL2pNL3JVQ0tBbFFEMkdrQldC?=
 =?utf-8?B?MDRFMkpLNVdiRk9MWmFSRmVOR20vTGZRREhuRUFqYmlMelVkVndaSXIzSEpC?=
 =?utf-8?B?K2YxcVo5ZjVWM0xLVW5XYThOSDBxcmZ4VVVabEhuNWNRTkZjWmd6VnMwOTIz?=
 =?utf-8?B?cEdXRk1lRXR0dkhpdjdUVVkvbEV6RWZWb1BENnNtQVZMMlR5Z0k5R0ZrbGsr?=
 =?utf-8?B?WjFoVkZ6ZC8vUXRGMWMyZmNZdStrb0xIcURkekFPQkwrMXFYVFNrZkROMUZl?=
 =?utf-8?B?UCtXQnJKVUY0VFVJV0Z3bldlMUJ2T0hQRUZIdmZVcHIrbXhPNEdxODdJYlRs?=
 =?utf-8?B?bVFNNFZSVHpHY08xZ3VieExJTm9GUmNwcE9uY2FIR3c0YVBJMThINVhvYm9F?=
 =?utf-8?B?MWZhOUZsWjJJVDJITnEvMlExUnpFVWpEM3VFamdhRUh5aGVNQ09jNDY4RWxY?=
 =?utf-8?Q?87kjMD4qYtiPTFOg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d507643-03bb-4184-1b5a-08da3a6e7914
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 14:38:57.9614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6P2weuPOFUqly55IprczX7NAptMGPh+eQdl6bobXDKUl8He/FLzTi5n4CIk7EGXSTEmJ391mfr3O3wsR4+ajQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2849

On Fri, May 20, 2022 at 04:28:14PM +0200, Roger Pau Monné wrote:
> On Fri, May 20, 2022 at 02:36:02PM +0200, Jan Beulich wrote:
> > On 20.05.2022 14:22, Roger Pau Monné wrote:
> > > On Fri, May 20, 2022 at 01:13:28PM +0200, Jan Beulich wrote:
> > >> On 20.05.2022 13:11, Jan Beulich wrote:
> > >>> On 20.05.2022 12:47, Roger Pau Monné wrote:
> > >>>> On Thu, May 19, 2022 at 02:12:04PM +0200, Jan Beulich wrote:
> > >>>>> On 06.05.2022 13:16, Roger Pau Monné wrote:
> > >>>>>> On Mon, Apr 25, 2022 at 10:40:55AM +0200, Jan Beulich wrote:
> > >>>>>>> --- a/xen/drivers/passthrough/amd/iommu_map.c
> > >>>>>>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> > >>>>>>> @@ -115,7 +115,19 @@ static void set_iommu_ptes_present(unsig
> > >>>>>>>  
> > >>>>>>>      while ( nr_ptes-- )
> > >>>>>>>      {
> > >>>>>>> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
> > >>>>>>> +        ASSERT(!pde->next_level);
> > >>>>>>> +        ASSERT(!pde->u);
> > >>>>>>> +
> > >>>>>>> +        if ( pde > table )
> > >>>>>>> +            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
> > >>>>>>> +        else
> > >>>>>>> +            ASSERT(pde->ign0 == PAGE_SHIFT - 3);
> > >>>>>>
> > >>>>>> I think PAGETABLE_ORDER would be clearer here.
> > >>>>>
> > >>>>> I disagree - PAGETABLE_ORDER is a CPU-side concept. It's not used anywhere
> > >>>>> in IOMMU code afaics.
> > >>>>
> > >>>> Isn't PAGE_SHIFT also a CPU-side concept in the same way?  I'm not
> > >>>> sure what's the rule for declaring that PAGE_SHIFT is fine to use in
> > >>>> IOMMU code  but not PAGETABLE_ORDER.
> > >>>
> > >>> Hmm, yes and no. But for consistency with other IOMMU code I may want
> > >>> to switch to PAGE_SHIFT_4K.
> > >>
> > >> Except that, with the plan to re-use pt_update_contig_markers() for CPU-
> > >> side re-coalescing, there I'd prefer to stick to PAGE_SHIFT.
> > > 
> > > Then can PAGETABLE_ORDER be used instead of PAGE_SHIFT - 3?
> > 
> > pt_update_contig_markers() isn't IOMMU code; since I've said I'd switch
> > to PAGE_SHIFT_4K in IOMMU code I'm having a hard time seeing how I could
> > at the same time start using PAGETABLE_ORDER there.
> 
> I've got confused by the double reply and read it as if you where
> going to stick to using PAGE_SHIFT everywhere as proposed originally.
> 
> > What I maybe could do is use PTE_PER_TABLE_SHIFT in AMD code and
> > LEVEL_STRIDE in VT-d one. Yet I'm not sure that would be fully correct/
> > consistent, ...
> > 
> > > IMO it makes the code quite easier to understand.
> > 
> > ... or in fact helping readability.
> 
> Looking at pt_update_contig_markers() we hardcode CONTIG_LEVEL_SHIFT
> to 9 there, which means all users must have a page table order of 9.
> 
> It seems to me we are just making things more complicated than
> necessary by trying to avoid dependencies between CPU and IOMMU
> page-table sizes and definitions, when the underlying mechanism to set
> ->ign0 has those assumptions baked in.
> 
> Would it help if you introduced a PAGE_TABLE_ORDER in page-defs.h?

Sorry, should be PAGE_TABLE_ORDER_4K.

Roger.

