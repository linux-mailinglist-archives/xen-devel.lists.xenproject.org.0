Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EA86F04D0
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 13:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526960.819039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1przbY-0003A3-Ni; Thu, 27 Apr 2023 11:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526960.819039; Thu, 27 Apr 2023 11:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1przbY-00037G-KG; Thu, 27 Apr 2023 11:16:04 +0000
Received: by outflank-mailman (input) for mailman id 526960;
 Thu, 27 Apr 2023 11:16:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81si=AS=citrix.com=prvs=47455b11e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1przbX-00037A-60
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 11:16:03 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2ad50ff-e4ec-11ed-8611-37d641c3527e;
 Thu, 27 Apr 2023 13:16:00 +0200 (CEST)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 07:15:57 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ2PR03MB7166.namprd03.prod.outlook.com (2603:10b6:a03:4f8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Thu, 27 Apr
 2023 11:15:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%4]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 11:15:55 +0000
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
X-Inumbo-ID: e2ad50ff-e4ec-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682594160;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Fe8gMXfOsgnswZ2zOO7JRZKORpH+mxR2VdCwSfoEgdg=;
  b=dUt8BZ9Kr3x0W1//SouSwc8rkwV6d6YGH0/8MVdyKQK9dTFnmSyr094V
   CiM2DhTzFGkya4En1f4v8fqqczxTwjiGsL1uAWTqi8XNmvPjfMRUXx8Nf
   O1M4AOiNPhwn8WP+oGsacGit7khgrtLNeeV8WljNbnqGqfzzKZM5Yfaru
   w=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 107470510
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/QMusa//rbq0O3SNQUSqDrUDe3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GofWm3SM6qPMTDxLo9zYY/k80hQ6MTczIdiGlY+qno8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOaoU5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl07
 s40EWokZCyu2d2Wz7TjdLVWi+88eZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpitABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpNSOLgq6cy6LGV7lQiTw0MFkeynfyGpVCnSvkBD
 kAd0TV7+MDe82TuFLERRSaQqXqJvBcaV8BXVfMz7AWAyK386AKeG2RCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BW0IaDIATAAFy8L+u4x1hRXKJv5hDaq0g9vdCTz2h
 TeQo0AWnK4PhMQG06G6+1HvgD+2oJXNCAkv6W3/QWaN/g5/Iom/aOSA61fB6u1bBJ2EVVTHt
 38B8/Vy98gLBJCJ0SmSGuMEGejx4+7faWWGx1lyA5Mm6jKhvWa5epxd6y1/I0EvNdsYfTjuY
 wnYvgY5CIJvAUZGpJRfO+qZY/nGB4C5fTg5fpg4tuZzX6U=
IronPort-HdrOrdr: A9a23:CqgkkK+yUIUiGFJdPEtuk+DJI+orL9Y04lQ7vn2ZKCY5TiX8ra
 vFoB11726WtN9vYgBDpTntAse9qBDnmaKdg7NwAV7KZmCPhILCFu5fBOXZogEIEheOk9Jg6Q
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3A2e70PGrWt2wbqk38M3OdPtXmUfo+QFHkll7aH2L?=
 =?us-ascii?q?mNkZmTuWrFWWd07wxxg=3D=3D?=
X-Talos-MUID: 9a23:9qMHhAQTiUulc825RXTUtXZyLoR06pirN28TiIQt5eyIPAdvbmI=
X-IronPort-AV: E=Sophos;i="5.99,230,1677560400"; 
   d="scan'208";a="107470510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOi3jRAPcGcrXvJIg6LxSXPLxK38pOoEcn1HsvalCfOfmuXgoUyu44cYAfqrK7d5h/ku/yb2YCbAtmWrRPPsYZdSEKr2HqPt4SNP3ycC3quy84RS+mvIm0SAwmMA/5Rt+e7AZTPgj/83z10QW2X570oohU0cYEkrAUM/Jre/O1WHtKLamGXCiCJqtw2gwB3lXTYZrPe7g4mEizmFolefkABIqMOzXGk0mztoZQNOy8hJnloIC0XVQ8K6dceZwfA1eKET/A3AAcN0hKidyr60oiz1LJPQLZtEx5wiLBLS8QXCvpoaYLhZDsddpsja28QI+KRoCDOQcghf42oxdTR9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sM11ygwuR02diH497+xYmRjJrONKzsLSOcjSgvC8yxE=;
 b=Rdfn0H0ESZcmcLMh3EOs8dR3uHqMkUx2MZvjB1rg2lUMpD4mYdJfkVTKxTUbhNI2CKIowYQCD6nhc+Vt173lofdxINCn8/uSSAxWtJ3L3ZS43IedfCa2qzOZhJZ8S5/vUDylWyu3butop8IXPZ/CT+T5ytqc9TOQBdDS0lwFB1a3tIB6oId+f1iI0v2iukpdQAH0x9BPznvDG6rPerjITEQN42j72CTtw0Qn+JtDID2n9vI526/+F07bjp5q6Z7Exe/04rzn/xAUMxQVSTo7l12eTDnodq3rcMN5oevvudkdJtBQ0Ec1L+WGdtvgJYaSXyatPwf7kQKK9Y3gJZG63A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sM11ygwuR02diH497+xYmRjJrONKzsLSOcjSgvC8yxE=;
 b=bilUk+1t5slc70j5rZcDBFqjoF+ID9+BaxKc8BOWfExUJeUGe4faQQfuzjjH5bjwc7xQa4Zccl1+PW6dTkPnvNxT/bSdz5VXEtWdi6/zSzd/MgTcSpIcNk+l2Dg5E+6Q74ZbS+zwPAL2B5O/RBW/tDJHxVjZNpywXFyb0arXl78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7a2b9ce2-a82b-1ef3-ff0f-f8bd479451b4@citrix.com>
Date: Thu, 27 Apr 2023 12:15:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 7/7] domctl: Modify getdomaininfo to fail if domid is not
 found
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
 <20230426145932.3340-8-alejandro.vallejo@cloud.com>
In-Reply-To: <20230426145932.3340-8-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0357.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ2PR03MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c32a54-1b00-4a82-98d1-08db4710c4d3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T4lyWh5OZpj82kFO0uXXHF5VTgFM1xnUnLWF+nxFvd8paqQMp1zODY3cRRYOurpDCvgH3qsgRtho8DmPUb2CMAXx/m/zk3mJEwAK0iyiB0kauw9EMpVVO5qhWCOnqaNowK0d9YzRCeSTXYEVw1VQQJ4JTZvqzbJ2TJmL3OQqm05W69sKDJZYCSH2+pnQTa8wr9Neo6++0uJI/9l1vbY92Ra7Vu7iqA8r39E649KfB9bJLyWeQlrMLN/6ikuhIpywhUPYgRYCvk4ZGz0uJb3/gUvKymUFqk5Y0XY+I0Ux/C8X4yg1NbPVCEhWBFvvtCU42GSIXNBvfz/I/OTjI1xjdrvejEYE8pCNCMIAnFCWrmrrbBbjGjFy07rdR2QXWOSOHv/QxIuBET0OYtgqGpfCPYdy8Sp5pbSArO/yEjirQQMGthETujR+piGI+IXSAUtx1Z9gW2qw5x4nVzm7EsAmkTweD79J8FYXZGIbxmli0hJzsPvKcm2FtR/O7lqTOT3+JHgTMO/HicXioR8f0glDxNjFkFeWYbNPXcKwcmROfpac/xIfE45HDM2yLs2QtUb81uQXkWHbpcEbrTtodvqFOL3NYD0nmoK4kgx9GNnqoSo1GPfwZvzs3gg4MFdanehc+LWDIp0p1xkoTPKa6XgLyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(31686004)(6506007)(186003)(26005)(6512007)(316002)(53546011)(8936002)(86362001)(5660300002)(31696002)(66476007)(66946007)(66556008)(41300700001)(110136005)(83380400001)(2616005)(478600001)(8676002)(36756003)(82960400001)(6486002)(4326008)(2906002)(54906003)(6666004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RitCdXY4RGhIcXJQWUVqK2NvWjVEd1dXZkluaXBPTzZmTWtoVi80cEVXaS80?=
 =?utf-8?B?K00vZ0wxb2d2a2U2YzAvRStYdVVIYWdEQ3l6Rm1Ud3ZqR2hRUFF5TEVhVktS?=
 =?utf-8?B?cnN6d0JrYVY4ZytuUzgvUkdMZ2lQYnFiUE8zNDNXUWMwSk1jRWhMNUVHWDEr?=
 =?utf-8?B?Ti9sOGZzTlZhN25GTVF0K2dPSE96ZjZ1bWRKUUpLNFRhdG5IaFh4d1diRHI1?=
 =?utf-8?B?N3BPeUJCa3pTWHpPT3dLSDlHRmVPQTU1YlUxdE1VN2RSZklOeGRMYVVwaUp5?=
 =?utf-8?B?aUFZeFFOaGVzZ0l2a01hYVBGM2RJU0pPWmZKanhLWm9WOXNRcGkwcjZUMXF2?=
 =?utf-8?B?eENXb25Zc1lLRE5PUE0wZnFyYkxNWFN3elhIeFJ4UEVDSVJHK05SQUNmQ2pi?=
 =?utf-8?B?bms5UlBVQVZYQXFJRkk0SGwzeXFlOTVrYjhmd0h0K1Jza1M2V0FzMExxYlcx?=
 =?utf-8?B?MlVtbFFmOHhxRXJHbGk1Y1RUUy9GbnB2Z2JZNktYNnNHZnI0SHBJS2V4OWFj?=
 =?utf-8?B?Sko1cXUyV213NnJVVktYdFE5NjU2SDMvRXMwUkF1b2FMcysyUy8wbjNpR2o1?=
 =?utf-8?B?dXc1NVRKbTRDbkV4MmRpYzlSUy9CRUNoYkQxV2VGMFFSZnVWYzk1QXpIM1Ba?=
 =?utf-8?B?RE1RL0NtWU1QVkdOTUZta243aURZd29JWXJVQ3I5RjZ3WkJ1QldqNXFlQzl1?=
 =?utf-8?B?SXJtWTNEZ05xNTdlTUZ6T0ZpRW9jcjVNYk9reFRlQjZuRmRGMWtKalJISE1z?=
 =?utf-8?B?Ly9hcGhMMVBwbG52WEFRTGxBT2pWU04zR0ZOcDB4NmFFQVdEcTVLbGI0bzht?=
 =?utf-8?B?TlZJWDZrRjZyVFVLdlVnWUFobGZxazNMaXhINmt5ZjY5Q0kxSjIzaXUyS3BV?=
 =?utf-8?B?WXc5YmFsNmltSFZIV1VJV3dESThZZ2FVcGgrUW9kekRTU1BSSUMxaEhZRkFv?=
 =?utf-8?B?alpHNUNsVjBwdXk1N1FZT09RdTJBVlZhY0xPN01JNVZkT1cwd3IvSmxhemF2?=
 =?utf-8?B?NmNlR3ZXK1BiN0tHYzE1R2F6bWVHYUE3WEo0S2FBakZibEFCY2ROdzlkQ01E?=
 =?utf-8?B?Z3A0YjdWdVg5WE9ReWVaa2dxVE1yQWNjcjFyNjljQWIxTVdUS1EvYnFobjFN?=
 =?utf-8?B?eXZ6Z25iMmRMWmc4amxXdjFLVU9FeVFKclBmYU5ITXo5NnNqaDR0cXpkRndG?=
 =?utf-8?B?U3ZUVHZ3T25qZ2RPckw4YlNiWEF4NStRWU9RRzAwMmRnZTVDM1B4MDZUaUox?=
 =?utf-8?B?SFpEZEV6QytjWHB1NXY2UDZVQjFRc3dJVVMwQ0hEQmwvRnIzc3A0cjcwbllR?=
 =?utf-8?B?THBhcFhaenZ2ekVCbVlUM1R5S2VYMVFiRlF1SUMyZVByQnIrS0VBRjdrWnpk?=
 =?utf-8?B?dXFvU2RMR0U0SGMybW82eFoveTdmMGlsMlJOQVlld1NKazNDWVFLR3FvSk9X?=
 =?utf-8?B?WjFvQ3JkT2dkWWVxKzZSZ0FIcGt6dmZZb0NBTjJscEthclF3d1ZOVkV3alJ2?=
 =?utf-8?B?aEVlK1BXdlB3UHdteW1HeU4weEtzQVF2Z3hCTkJhdGJtKzRrQkV6ZEthVys0?=
 =?utf-8?B?VXNNQ01sUCs5U3pyYUxCZzlXUjlYNzFDSXg5SHh6VmllRllmbW5SMTBUaVlF?=
 =?utf-8?B?YW8zMVI5YlpqRkhMNmNuVG1kVVpiTlBkTDhnWUhqaUs1UnV0Q2lSbVVPRFEv?=
 =?utf-8?B?NjFVckNQbG9nendFdHhzQ1FmNENaeEhaaHJyUEw1bXM0eWkvSlQ3eXBuSGI2?=
 =?utf-8?B?ejI5YjRBOTJleTFXbDNMcWxIa1ZRVHhsSXM5SWJmQWZra2FKekxsaEhBak1O?=
 =?utf-8?B?YXJERGd3UlRnbG9NejBGNHRnb3diN2JwNUIzeTZjKy9jdnBKdU1FV0krVVBs?=
 =?utf-8?B?aGhKVmMxa3BsQTdWdEJzeVlQUC9pZDV5R2NmMVRGS1JJamd2a29zSVdheHRU?=
 =?utf-8?B?cTUzWUtjY2N3bjg4Z0hkTnhPaWZQaUsvcHA1bzAraUhhMjJsNmlMbDBTcm5H?=
 =?utf-8?B?MlNUSjFrNjRlT2gzM0ZzQ3diV2VHYjJuRDNrWEgwV0o5dkd3V1c3b2lQaTVO?=
 =?utf-8?B?ZlVXZklVb1ROSVJXdE9hZ2ZBQmt1SGZKQ3EzdHZ5Yi9ETDFLOU5XYWgwKzR3?=
 =?utf-8?B?ang3bjJpUWdPV0QyQ2QrekJZM0poTGVnMlFEZ0xzc1E0MTZoQ2xlM3FRT2Qx?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wArkehGNV5x/W4pBpmwZVTcf0mmxRwVmy0RDUksBN87aL0HmaXrR0+UGa3jVjDAfr8sSdQxNxD0kBscRqueRGTYCeO7HP1EVTekZ4cjmkDtrGDdl0E0C+tGP41oNhGchBH4yhgYOdurMVWdJcsTLpOMXQM18t7lt7xULaof420xLKY72cF0shaR9hJdm6CeNZ3H4AMGu9a+Z0ySjq4WmD0YG4SisgydFLTISRYTtEBD7CgcWfkbHzUAwtthwDa/2QLq0OgasTadH+V08UgQQMuAGihP3uwkZcsSjaJHp8weypGjK9VsKSBZjJQCBV7ZFMiVTcqUftbyg90Gxh1cUhwFUOwEiCPoT/e0zLD3tXiBVnlDySYSdjP9JWnB6Og7ThrjOX5M6xvMiLkMRZLSMJBRkpdgB0z4pSga/ND6FbBOv77mWlCUTA/ZTmfEYHvYRJmy8TyyomKRAFkQd+EyzyZUGLkbagPDUulutH0vgi10/7IsxFUjef+s+Xggh+qRSUt211Z/Cpt3lO7cFVfbEEXd1jTfWZ9bFlEPvvkUyXnBEyrlSmkjVujfmRURzPq4F5271uLmwwGtyGKCXkbeU+24xcKYtk/CTzVr2h3X8VZR9/Eh7W4D5hZt7x4TfMu+8GTYWZLxCro9u2FVS5X9bG/szpV0uHvlfXK8X2wTsUpYVIhY17H9x2ZfVA+t/7Tt6z6XRY0Q9ahhMmcE/71t+7/hJcsLXBlVEeV2WSuTwe9/RKlUmB0UJ7kiArQTpijuQ90u1kfKWnUrMc6Vg02n56zjlwWRzZ6FueV6Asy+zKDhcU30ant4B8YWGVoBRIg8tAVushZeYb2C3AnTD9RMXkXrwMTvysSSWqbqLa3Xj4J03Y2xYk8SmN3Ap+EEpwq7l
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c32a54-1b00-4a82-98d1-08db4710c4d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 11:15:55.3037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDjxlckX3F9Rjsm1pZyB9zYZy/e8Jg7pLfI22X1lQyRWY1gNZmnmSiYJ6ftvNOTEWa5BYFy/rogkZJzoZLCIlhF8Sm91gTFHtKLrMSuVenA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7166

On 26/04/2023 3:59 pm, Alejandro Vallejo wrote:
> It previously mimicked the getdomaininfo sysctl semantics by returning
> the first domid higher than the requested domid that does exist. This
> unintuitive behaviour causes quite a few mistakes and makes the call
> needlessly slow in its error path.
>
> This patch removes the fallback search, returning -ESRCH if the requested
> domain doesn't exist. Domain discovery can still be done through the sysctl
> interface as that performs a linear search on the list of domains.
>
> With this modification the xc_domain_getinfo() function is deprecated and
> removed to make sure it's not mistakenly used expecting the old behaviour.
> The new xc wrapper is xc_domain_getinfo_single().
>
> All previous callers of xc_domain_getinfo() have been updated to use
> xc_domain_getinfo_single() or xc_domain_getinfolist() instead. This also
> means xc_dominfo_t is no longer used by anything and can be purged.
>
> Resolves: xen-project/xen#105
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Wei Liu <wl@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> Cc: Juergen Gross <jgross@suse.com>
> ---
>  tools/include/xenctrl.h     | 43 -----------------------
>  tools/libs/ctrl/xc_domain.c | 70 -------------------------------------
>  xen/common/domctl.c         | 32 ++---------------
>  3 files changed, 2 insertions(+), 143 deletions(-)

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Good riddance to this disaster of an interface...

