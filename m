Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A4B4A81F8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 10:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264579.457713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFYnJ-0000Ql-4A; Thu, 03 Feb 2022 09:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264579.457713; Thu, 03 Feb 2022 09:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFYnJ-0000O9-0p; Thu, 03 Feb 2022 09:52:49 +0000
Received: by outflank-mailman (input) for mailman id 264579;
 Thu, 03 Feb 2022 09:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mjBt=SS=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFYnG-0000O0-KZ
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 09:52:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0824784f-84d7-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 10:52:44 +0100 (CET)
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
X-Inumbo-ID: 0824784f-84d7-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643881964;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=B1RccMnwHrlHmCUeK/pPU+jtGv7v8/K2Rkap9RK4KA0=;
  b=eaE2iNUaM/n0xVszn8HtAC2yygS1Qkc8ZBE8ye8TyCfmiAdcBEuUsdQT
   ee1Nl3shLL69MqD5jh76POsM0twukaLSp9RRt0ZYPRREUtFcG0YEaWV3A
   BIKB4LpvpFGYNzcAExgt9ITHergIEEhsudM4Th+ulafDF+brVRZMPx55L
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3+23iLLTUPIn+zkneI23LWqxALA5bUZPwZOu+xZ5HFrNr4+1NwulTLfb+4mMBmyLs7a0sb5Il9
 v2rdC9UE+zgpnyT/VWgGwlRS32S41auG5mMUe7Qfso7kQWBbOdmhNZg5uU646CcN8nmVfaZ5Sw
 hl9Cevu9asblWNBhqp4Z4WraWVpF5zYHa3utS//IqgNstRePCLYllT2VaWprfiXJoheRy/imbC
 MmwKNN4AouoOTN/l7zQ4NGovzzcGSI/53fXybE+bm6Guv2ahePHwk+1ZwbbtSb7ogHiLKFJOLZ
 JjdmgxJpzjNxW1eO9Dpagw/W
X-SBRS: 5.2
X-MesageID: 62858562
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DlKHEKDJNNXaXRVW/5fkw5YqxClBgxIJ4kV8jS/XYbTApD1w3zIAx
 jRMC2zXPvqNYzTxet9+boTi8EwPsZbQn9JqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970Uk7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/1g2Mltdhl
 9l3qrPhRCgbFaLRvsA3ekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf+auI8Fgm1YasZmDf3CR
 /glcRdTd079bR9ICgw3MMk9g7L97pX4W2IB8w/EzUYt2EDPxQl4y5DxM97YfNObSMETlUGdz
 kre52XjCRgePdaC4TCE7n6hiOLJkS7hHokVEdWQ//9xiVyXz0QZCQEaWFW2p/W0kAi1XNc3A
 1Qd5y4GvaU0skuxQbHVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqPHFeC1Ffup+6/d913kmnostf/LCd0+XwEDbgn
 DywswdvipohpsEW8YGR1AWS696znaThQgkw7wTRe2uq6AJleYKoD7CVBUjnAeVod9jAEATY1
 JQQs43Htb1VU8nR/MCYaLhVRNmUC+C53CowaLKFN70o7HyT9nGqZui8CxkudR4yYq7oldIEC
 XI/WD+9BrcOZBNGjoctOupd7vjGK4C6TrwJsdiPNrJzjmBZLlPvwc2XTRf4M5rRuEYti7ojH
 pyQbNyhC30XYYw+kmbtF7xAj+J6nX9lrY82eXwd5078uVZ5TCXNIYrpzXPUNrxphE96iFm9H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUXX9ritw/G7gtWre1I8cEl4Uqe56ep4J+RNwvoJ/s+Vo
 CDVchIImTLX2CycQS3XOy8LVV8adcslxZ7NFXZybQ/ANrlKSdvH0ZrzgLNsLOR+qbw+kaUpJ
 xTHEu3Zaslypv380211RbH2rZB4dQTtggSLPiG/ZyM4cYImTAvMkuIItCO2nMXXJibo58Y4v
 ZO60QbXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEWR3Cae2
 iaXHQwc+bvHrbgq/YSbnquDtYqoTbdzRxIIA2nB4L+qHiDG5W7/k5RYWeOFcGmFBmP58amvf
 8tPyPT4PKFVlVpGqdMkQb1q0bg/953koLoDllZoG3DCblKKDLJ8IybZgZkT5/MVnrIA4Fm4Q
 EOC/NVeKI6lAsK9HQ5DPhchY8SCyeoQxmvY48MqLRio/yRw5reGDxlfZkHelCxHIbJpG4o52
 uN96tUO4gmyhxd2YNaLiidYqzaFInAaCvh1s5gbBMngixYxy0EEapvZU3ek7JaKYtRKE08rP
 j7L2/aS2+UCnhLPIygpCHzA/etBnpBf6hlFwWgLK0mNhteY1OQ82wdc8GhvQwlYpvmdPzmf5
 oS/25VJGJiz
IronPort-HdrOrdr: A9a23:yhp4M6P4T63UicBcT1v155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY59s2jU0dNj2CA5sQnjuRYTzra3GeKjM2YqbQQ/
 Gnl7R6TnebCD4qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPsf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aySwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7QvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WXAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 dT5fnnlbVrmG6hHjLkVjEF+q3oYp1zJGbIfqE6gL3U79AM90oJi3fxx6Qk7wE9HdwGOt55Dt
 //Q9ZVfYd1P7grhJJGdZQ8qPSMexnwqDL3QSqvyAfcZeo600ykke+C3Fxy3pDtRKA1
X-IronPort-AV: E=Sophos;i="5.88,339,1635220800"; 
   d="scan'208";a="62858562"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJMNm3FkGELxjxDA0n7CmsbOa/iG/OmDjvU5BMjizwuNmPT4EUHY8XGLvFNSlj7lWtlkAbNeERq5p5KzhuCdOI+aTQHyx0sJXtlTyWsefaPILfVGeKlTxougkWGUjMZmEyUTghYQ+grXHnqOwEtcWW58MftuZXboQsTSwvedN2tx6zLdobFQwkYilhkYhOf82RohDatC3JTbTvc6ghyCL0rGS4IjoZCAMNLRsfiDURDih+FG4kcTKWx/3HwQlkVAcXWczhFmwC3p05WsrecWnbsVdn6dPkYFNzxEIYKmztfWwyNAsUYwz5UiXjN2iowkHgmmZPyyjYKhivFTLaFFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KEUghfDt3DRQtQA4I7P0DPj+90F4WVJn336jZSh78M=;
 b=aa9GzABhMCFIMLD3O4O45m+49DNDkPHtM5DMSvwJ5R6tFl2AbhWKsA9/z8ZAjxbxd1EBbgZpOhGxJcn95bI+iFn6v9NbhwZdDbQeGVGsLrbAqz6URdYLBHpVFHkcNy8pOPkjLG/XP4eVeyBxIljeL2pOv/acEG1uo1unpGfxhbGKxg8fjmvLwN+kAwYfm764dQGR9mFpXU1YCEEDNqEJS+MhxcOEWj6EF+rT3tsL4ObpaNSFAZ90URmiQvsub33PEyCjsMOx6q9PhJEibiHgH7bzgRLo3y7DYQthcL5ceBqa0d/bmYMn8bX7tH1jWv+TOV9ZxGi/bbRwkS3kCXav5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KEUghfDt3DRQtQA4I7P0DPj+90F4WVJn336jZSh78M=;
 b=w+zHX2SvnwiTa7NV2KQR/gNKz1J5j2zB2LIvQmY96yPWEEUwkFBddUlCuJzp1/TyoNUhTqDe2IyUcu4R5cWvPN8bBROKndyM+LnY1u3Q2FwfJYrcodgp8xVpyMW/XVMbudNpB3JNQyztPZN0ofx7ZprXeZQcs1VS2uKaV6aGTaw=
Date: Thu, 3 Feb 2022 10:52:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alexandru Isaila <aisaila@bitdefender.com>
Subject: Re: [PATCH v3 1/2] IOMMU/x86: disallow device assignment to PoD
 guests
Message-ID: <Yful4oPqwzw3lsjp@Air-de-Roger>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <b0a77526-17f2-a5ab-6f7f-1b3caeb4a59b@suse.com>
 <YfqtlZMAKd/HXsgf@Air-de-Roger>
 <2cd051c8-dac0-998c-cced-401c504ad439@suse.com>
 <Yfuahx0ntHJ2BQ6x@Air-de-Roger>
 <7c315902-e618-bba6-054d-86b0aa685370@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c315902-e618-bba6-054d-86b0aa685370@suse.com>
X-ClientProxiedBy: LO4P123CA0388.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14485d88-cca4-45ee-bba6-08d9e6fae9b7
X-MS-TrafficTypeDiagnostic: CY4PR03MB3238:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB3238E73C4FFE31C9DA5CE8328F289@CY4PR03MB3238.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HssSX6WagR3tJ0SRgN7F6smPYsU6lppzvIBsgd7vqP0x32+D1OUcK4sk8IwxXxUhqqyZa7wG9qZNKZM/eqPjPkHcvvbQbkzzmoWqA7GMUguU0uUXA+0ii/bdksuZU1hIAon13SvNaS6LUehEeoaT0l+/Sj1+BJk6yHi1LGnIyh3wIvvhMaqwlK438vZJbBD3eYYwBFd0KDr/w8Z+LqkwvCTYt2oyGYRhJCDTNwdTrjx6LUUUwznF3t+NjCNdOoYJMjipO2dwWZnwQ74T7nqA+0kpAZWJsqWnl7TpeMnpI94LFNFeaFt8BZAJMe/fKvUhJ4vFMa2/OqnqcNjUdT/x8de7Vv3Ja+0uPDYFDdFvrz8/RtEGDx1DWC7l86QXMuwe78NO+yCxsvnkq8NSSQrEKSbclSnAMZJjlCUV2Y5oeKjhlNYrDh6CQSaPDpCuW+NlEbgRltMh/o8FlPUcYB4UfmaZdTdELYCVI7QvTMnmXiUTdzM5v7nLFf9/SCQGQVEt1wSjTJP34T+88UXDh01O8GbOqEhOkqaJdX2Tw08DfJVlV4L6jwGAblKwWdFVycUXsNcdOKQymRm3lqAiTDdFzmop4+NekLoqgGZz2Eb8nVHMV5p1SiH+Qz7qfpgrG7n+qXzcImOtI0T1j3mnGqyoQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6512007)(186003)(26005)(5660300002)(2906002)(85182001)(53546011)(33716001)(6666004)(66476007)(9686003)(66556008)(6506007)(86362001)(4326008)(66946007)(8676002)(8936002)(54906003)(82960400001)(6916009)(316002)(6486002)(38100700002)(83380400001)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnJhYjVJWkMvaTFoYUVocW9xbWUzeW0xZ1RvUGpqTUtKckI4eFZqdDM4alVa?=
 =?utf-8?B?TmpJQjJjSlJZNERoWVdWWkUxNUNHaGgxaXI0Sk5WY05lTU1naFNZclprT3Ny?=
 =?utf-8?B?YkFPYUxIdkZkNFlIR3NtYURwMGhVZUtrL0J3VU1FeTdqR2l3aGVzMVRjdjZt?=
 =?utf-8?B?TzdyYmJVaEp5QXhvY1VuZlRLZWYrYW8vb0FuOTlXdU9lUzkyQWozZ1h6K25j?=
 =?utf-8?B?aGUyUkhQWWpYZUtycFZYN2FVU3IrWVVQemlWZnNyUEtackt3Q3hyeUdvb3Zu?=
 =?utf-8?B?Y3JtVUJhUTd5dzZXenY0ZG1jbktqd1dhQTBxM3NqaldhV2xZOFF5TVhvZE5F?=
 =?utf-8?B?QlE2RUx4R2dpcitDM2Q2YkdydC9ESlR5aVNrQThlQm5wdWJMY0xZVlY0aEhl?=
 =?utf-8?B?dG0wbDhiM1R5NTdpV1AzRXlWQ0dlbHhxWm9jZk1pVzZkVW81bjRET2YwdWsr?=
 =?utf-8?B?ZlpDY2kza0RWWjY3bHMxRWZqbm85UGZtZjNFcDFMVVJQSFF5c2VMMUZUQSth?=
 =?utf-8?B?anJoaGRGaEtXNWdLVmJWWVRYdFVBZ1dCNTNybVhINlYyQUtleHEzZ2tNaE85?=
 =?utf-8?B?ZVRwNHhFYnZrSVBaeHdDUG1nSDF5RENLZ2ZXQW5SWGNFTjhXNE9UTEduZ2FE?=
 =?utf-8?B?NWdyK00vUVF0bXA5aVhPUzJKWGlwb0tXd2h4aWhqSjRqU2EwczhXMDl3OGs5?=
 =?utf-8?B?U3VnMzB3SmsrTlhUd0tra2l0TXkrcHU1di9PT1lyK1FGT1V2UGJubWVqSG9L?=
 =?utf-8?B?SzhQdE5CbDY2RkhUaEZiS1FzbEdrVFdsTUovWmZXM0trWllrdGYvZUNzTUdW?=
 =?utf-8?B?cXpzV1BKZ0orNTlEaHRnemZVVTYyZytZYnJKd2t0emgwWmJZM25BalFQZVR0?=
 =?utf-8?B?RFFCNlNJVUdjSTVjYUN2ZUtYbXhLNGoyczdKRHlIOG11SWR4U1h2MmJEM3p6?=
 =?utf-8?B?NXNBSGUwbG1RdlN2azY3SFlGQlVCRkVyYjkxWHg0SEdYUjY4dXg3Nm15cVhr?=
 =?utf-8?B?cDFJSnJ1Z1g2UXpWOVZtQmlLNXhRUWpRbEplZzk4ZFNzUmgva0plTSt0V3hL?=
 =?utf-8?B?SE53eUVKdWVyRkUyak56TWl3VElQWUs2SWt3MlpiMlRRcnZ1ZWQ3MjZNanBJ?=
 =?utf-8?B?N2VvNllEN1BXb2dLYzhJTzEyMUxmQ2RuNWdmYU42amtpT0gyUVdidWZWTC9n?=
 =?utf-8?B?OFRHcHpOK3FsZS9pdE5yeWd4c1JrMlJVTDZZV1g2cnl4T3psZjV3dVkxTGtv?=
 =?utf-8?B?SGdLOVZNYThPVEc0Q3VtcHBpNWEzZXZNVmJ2cWFYSng1OFhpNTg2TzU5b3ND?=
 =?utf-8?B?c0x6dG91VE0yT2g4U0QyWHBxOFRZL1UxTmJ5aGhkdHd0NlpudjZFUnJoVmw0?=
 =?utf-8?B?bFpac3BzNitnOUkwSEZnOE1lL0RFQzcrMVNEZ2JPbUR3NTZ5U0NQUHBZbDYw?=
 =?utf-8?B?bUZqUG1GemhYaXJSTk0xWm9GNzl4NUN6MkdubHVFMTNyTXhyQXhqb0l1OEky?=
 =?utf-8?B?Q2xUOGdBcmhKenFEMGxFQXFIcEpZMEZ4bU1ybnd2eitrQVN6U2o4YVFVRysv?=
 =?utf-8?B?TUZwU2s3NnVJMi9RSkdlNkhkdVlwL2JrYjRsQWw0aUNrNkxJTTBPL3V2eEJs?=
 =?utf-8?B?anVqQjJXOGpwYmlrOXBseEN3ekROa3gxWE9leDRhQTlycDBWRUlXc2tVcmJr?=
 =?utf-8?B?YXgvOFYvdVE0K0p1TFZOUVRrZjZnOFA5RWdWOTRvUTZYUTF3VGoyY2krbnBj?=
 =?utf-8?B?UzhJL0lKRUxML1p1RDBzOUZEaWI0NitzeVB2SkF5eVJtSGNjUDh0aG4zaXRE?=
 =?utf-8?B?UWhTcWtISUVTVG5NVUh3aXZTS092VWprUWpWeW5reFJNM2R0YnE3c3JCZ0NW?=
 =?utf-8?B?UTZHRXJEamJMZ0tVNlA4c2txeU1BSjBQR3VWaE1IdE5mYWhPdUtidXArR3Jm?=
 =?utf-8?B?QjMyMzZnQTNTQ3dia1FhKzVnNS9RbUNNMmlDK01Qb0JMRmEwVnhEdHFIZGZT?=
 =?utf-8?B?U0VTWFc3dHJXNUJlN0hZcUxzVHpwOVpFNUdEKzA2VEtYNVNzS2ZKRm56eWxG?=
 =?utf-8?B?NGE0ZWo5QzZSWVJkYWMzWWdHdjFyQkUremt5MnViZDRwazRIZk1BWTJZb0hi?=
 =?utf-8?B?SVNyV0R3RWNCZC9WQjRRd1NIZGZlbzdyRHYxeWtlV25OV3BDVVZmZk50aEhG?=
 =?utf-8?Q?7UjhCJTB7sWZncXm7D5yZ4M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14485d88-cca4-45ee-bba6-08d9e6fae9b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:52:38.8230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7gcSIQOoY0Xbv3eTQM/vijeMMksB9gKYif/VW/cwJg+IAe9L2PAccd0vYiqcMOasATWeOegaxScXBO2MlwOLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3238
X-OriginatorOrg: citrix.com

On Thu, Feb 03, 2022 at 10:21:54AM +0100, Jan Beulich wrote:
> On 03.02.2022 10:04, Roger Pau Monné wrote:
> > On Thu, Feb 03, 2022 at 09:31:03AM +0100, Jan Beulich wrote:
> >> On 02.02.2022 17:13, Roger Pau Monné wrote:
> >>> On Tue, Jan 04, 2022 at 10:41:32AM +0100, Jan Beulich wrote:
> >>>> @@ -359,7 +360,10 @@ p2m_pod_set_mem_target(struct domain *d,
> >>>>  
> >>>>      ASSERT( pod_target >= p2m->pod.count );
> >>>>  
> >>>> -    ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
> >>>> +    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
> >>>
> >>> Is it possible to have cache flush allowed without any PCI device
> >>> assigned? AFAICT the iomem/ioport_caps would only get setup when there
> >>> are device passed through?
> >>
> >> One can assign MMIO or ports to a guest the raw way. That's not
> >> secure, but functionally explicitly permitted.
> >>
> >>> TBH I would be fine if we just say that PoD cannot be used in
> >>> conjunction with an IOMMU, and just check for is_iommu_enable(d) here.
> >>>
> >>> I understand it's technically possible for PoD to be used together
> >>> with a domain that will later get a device passed through once PoD is
> >>> no longer in use, but I doubt there's much value in supporting that
> >>> use case, and I fear we might be introducing corner cases that could
> >>> create issues in the future. Overall I think it would be safer to just
> >>> disable PoD in conjunction with an IOMMU.
> >>
> >> I consider it wrong to put in place such a restriction, but I could
> >> perhaps accept you and Andrew thinking this way if this was the only
> >> aspect playing into here. However, this would then want an equivalent
> >> tools side check, and while hunting down where to make the change as
> >> done here, I wasn't able to figure out where that alternative
> >> adjustment would need doing. Hence I would possibly(!) buy into this
> >> only if someone else took care of doing so properly in the tool stack
> >> (including the emission of a sensible error message).
> > 
> > What about the (completely untested) chunk below:
> > 
> > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> > index d7a40d7550..e585ef4c5c 100644
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -1160,17 +1160,16 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
> >      pod_enabled = (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV) &&
> >          (d_config->b_info.target_memkb < d_config->b_info.max_memkb);
> >  
> > -    /* We cannot have PoD and PCI device assignment at the same time
> > +    /* We cannot have PoD and an active IOMMU at the same time
> >       * for HVM guest. It was reported that IOMMU cannot work with PoD
> >       * enabled because it needs to populated entire page table for
> > -     * guest. To stay on the safe side, we disable PCI device
> > -     * assignment when PoD is enabled.
> > +     * guest.
> >       */
> >      if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV &&
> > -        d_config->num_pcidevs && pod_enabled) {
> > +        d_config->c_info.passthrough != LIBXL_PASSTHROUGH_DISABLED &&
> > +        pod_enabled) {
> >          ret = ERROR_INVAL;
> > -        LOGD(ERROR, domid,
> > -             "PCI device assignment for HVM guest failed due to PoD enabled");
> > +        LOGD(ERROR, domid, "IOMMU cannot be enabled together with PoD");
> >          goto error_out;
> >      }
> 
> Perhaps. Seeing this I actually recall coming across this check during
> my investigation. Not changing it along the lines of what you do was
> then really more because of me not being convinced of the extra
> restriction; I clearly misremembered when writing the earlier reply.
> If we were to do what you suggest, I'd like to ask that the comment be
> changed differently, though: "We cannot ..." then isn't really true
> anymore. We choose not to permit this mode; "cannot" only applies to
> actual device assignment (and of course only as long as there aren't
> restartable IOMMU faults).

I'm fine with an adjusted wording here. This was mostly a placement
suggestion, but I didn't gave much thought to the error message.

> >> Finally this still leaves out the "raw MMIO / ports" case mentioned
> >> above.
> > 
> > But the raw MMIO 'mode' doesn't care much about PoD, because if
> > there's no PCI device assigned there's no IOMMU setup, and thus such
> > raw MMIO regions (could?) belong to a device that's not constrained by
> > the guest p2m anyway?
> 
> Hmm, yes, true.
> 
> >>>> --- a/xen/common/vm_event.c
> >>>> +++ b/xen/common/vm_event.c
> >>>> @@ -639,7 +639,7 @@ int vm_event_domctl(struct domain *d, st
> >>>>  
> >>>>              rc = -EXDEV;
> >>>>              /* Disallow paging in a PoD guest */
> >>>> -            if ( p2m_pod_entry_count(p2m_get_hostp2m(d)) )
> >>>> +            if ( p2m_pod_active(d) )
> >>>
> >>> Isn't it fine to just check for entry_count like you suggest in the
> >>> change to libxl?
> >>
> >> I didn't think it would be, but I'm not entirely sure: If paging was
> >> enabled before a guest actually starts, it wouldn't have any entries
> >> but still be a PoD guest if it has a non-empty cache. The VM event
> >> folks may be able to clarify this either way. But ...
> >>
> >>> This is what p2m_pod_entry_count actually does (rather than entry_count | count).
> >>
> >> ... you really mean "did" here, as I'm removing p2m_pod_entry_count()
> >> in this patch. Of course locking could be added to it instead (or
> >> p2m_pod_get_mem_target() be used in its place), but I'd prefer if we
> >> could go with just the check which precisely matches what the comment
> >> says (IOW otherwise I'd need to additionally know what exactly the
> >> comment is to say).
> > 
> > Could you briefly mention this in the commit message? Ie: VM event
> > code is also adjusted to make sure PoD is not in use and cannot be
> > used during the guest lifetime?
> 
> I've added
> 
> "Nor was the use of that function in line with the immediately preceding
>  comment: A PoD guest isn't just one with a non-zero entry count, but
>  also one with a non-empty cache (e.g. prior to actually launching the
>  guest)."
> 
> to the already existing paragraph about the removal of that function.

Thanks, Roger.

