Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D076E6E75F3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 11:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523263.813146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp3iU-0006AH-Ic; Wed, 19 Apr 2023 09:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523263.813146; Wed, 19 Apr 2023 09:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp3iU-00068Q-EU; Wed, 19 Apr 2023 09:03:06 +0000
Received: by outflank-mailman (input) for mailman id 523263;
 Wed, 19 Apr 2023 09:03:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pp3iT-00067y-9s
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 09:03:05 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcfd17a4-de90-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 11:03:03 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 05:03:00 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6985.namprd03.prod.outlook.com (2603:10b6:a03:433::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 09:02:58 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 09:02:57 +0000
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
X-Inumbo-ID: fcfd17a4-de90-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681894983;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qPIxOMJF4tnHCpnii+tQ5mDKJoHE+WZhWXREJOII1ac=;
  b=bh3Q4+9r4oMHX6TJWbkXj/mWSsMtozrQljiQ42rfRpwVjxVkXcTIqmKE
   iQTK3UyCfnv5HRR/zySaE5zU/T43xBdx2sKnkKtUp7Gk9TyNwdGFdrYVY
   9G5m6QK2/sS7hPkekCCvqm13eu4V/rDuAISH49YsnUu838oIxTJ11aaz3
   Q=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 106480767
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qcxRZaJg9PZUoio7FE+RVZQlxSXFcZb7ZxGr2PjKsXjdYENSgWAEx
 jZMDz/VbvyOZzT0LYolO9yzo0kB78DWm9BhG1BlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gVuPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c52KEMXy
 KUjMgsEVR263tCwnKyDENNj05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLlGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv02LOfxXylB+r+EpW287lgmFKI2FYVBR5MUVSfsMSig2OhDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ua5QeX2+zr6gCWLmEeS3hKb9lOnMQxQDk30
 F6VjpXsDDpmv7CPYWKQ8K+OqjG/MjRTKnUNDQcGUA8E7t/LsIw1yBXVQb5LC7Wph9f4HTXxx
 TGiryUkgbgXy8kR2M2T4lTvkz+q4J/TQWYd9gjRG26o8A59TIqkfJCzr0jW6+5aK4SURUXHu
 2IL8/Vy98gLBJCJ0SCIHuMEGejx4+7faWWEx1lyA5Mm6jKhvWa5epxd6y1/I0EvNdsYfTjuY
 wnYvgY5CIJvAUZGpJRfO+qZY/nGB4C6fTg5fpg4tuZzX6U=
IronPort-HdrOrdr: A9a23:AxV+Z6PXBORv6cBcTuGjsMiBIKoaSvp037BL7TESdfUxSKalfq
 +V8cjzuSWZtN9pYgBFpTniAtjifZq/z/9ICOAqVN+ftW/d11dAR7sD0WKN+VPd8hrFh4tgPP
 dbGJSW0OeAdmSSV/yKmTVQzuxQp+VvLJrY/ds2EU0dNz2DBMlbnmFENjo=
X-Talos-CUID: 9a23:EOpXuWOiVajmDu5DWQBFrXNNIdoee0bQ9S7iJROmMTxTR+jA
X-Talos-MUID: 9a23:72myTAVwC/GxZdvq/DHpwzt6O9x22aKjCxoJnrEXhtKNGDMlbg==
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="106480767"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqrLH3mLaVC/lmc9z5JQEeBNY0t2dO111OkQWB4aa3bFkK2JNWYMslHlCSS+zB1HHaB8WI6dz3V+rukf+lRCaWirF9hLWpjNL1usRDyYMBCyCANrlsP9IIY0cmUED1WkEmNX+oroqxHOxBqaTKZpkGbRCarXT7H9sPzuc9n1rYqi10kaYmc4kQXN7DiUgyOu7AFBu02zGb9wOxmG1dZNDRYmRVOxPSP1SgF5zUrNz61+rZEOjjZGu17XM68/dL4ppjkoSk0CQs4K1oo/DCoe/JuXNdl3o+BOHPgPyQRhRgKb3feMAjDH0y+IAnKFtopdc3fkkGaCx0OHlgtS6GUZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwvsNZ5/ZkN+OMBd1mx4Zzs6EhYGMZawkAZsJAaZYQY=;
 b=H4jpzKhCZfDR2nfzCbzysO1fhw0BMxVTp3fP+hrBy9Z9gOyqmbFZyy89DUUqNn8lzcigHPresMCpocrCEVdqK6wDu0k31P9XRzWvVN2R81c5kd3i7J8QquCFtW30DKZb7IonhuSbaNWcxxdPeLiCoTdd2+it4WNqHZcK39Q91XibLI6QpKipp/R0LgfXAqun3tl9GRXMb5UkR/7lFPX1V5v2Cn5RNfcIVKfazdHuJxYY8QA2pejZhuyuKTGvr5ETN1YI5yfvgO0Th2/Mp9BCgTc4fyMxKGYk1UB4C3aIuDE0e9jxkh30YBxmwIay2ip0ak7XLP1528WFYfJPcRodSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwvsNZ5/ZkN+OMBd1mx4Zzs6EhYGMZawkAZsJAaZYQY=;
 b=wObym+S2VW6yfaj+uOzZ8tVANhrwdyOIEQ3rWLSrUqA+Hxso15C/P6oyqj0loKS6x2M7jgBRdB2McccAtxWyrmLH9QKunqcSMM5dIBismT6BhifVCyQIoMEmFrkCAAVbrl6HElGmxsGn9P0Pty7dQhH4NzipN1g0r4hRPwKoCnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Apr 2023 11:02:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/vcpu: remove vcpu_set_singleshot_timer flags field
Message-ID: <ZD+uPd/wICTK6qB4@Air-de-Roger>
References: <20230418154223.20181-1-roger.pau@citrix.com>
 <225aeacd-7d8d-3832-8043-4f565403c2d7@citrix.com>
 <7452a070-48b8-03fb-26c7-3dc7d652dcba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7452a070-48b8-03fb-26c7-3dc7d652dcba@suse.com>
X-ClientProxiedBy: BN8PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:408:94::35) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c5aec8-1159-4658-2047-08db40b4de5e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0ewXKAMK3mELdiDuXQZQyi+I+DcKNIBllU8bgOH+QG/v7ADJS7JSBUdedhf+ImLwHkWsxymNGQ0bVbENWNSkGkRaUoQOLdSmkSResTDw70rbVyDtc29yqVxxVhDT4aUIE9C5ls+WuGRG1Yc3qRHNQKr4WSD9/zGnUURxDM1EiLLLBrFfpOIGom9Dp97ftOmEfFtLrUQogf5USmCkB6wvrRmycD2gFawFWBeYyxml2oeeNOTWrpJBsSDZUZq2cdKbbnRXbKDxX8Pp7LOXzakHJRloh8+ww4kW6ZLAjJQmqUZ9Kj0ixx5VcgLYkpRDnZBiaWe+esBh1NFtS+9yVA6e/eE4RfAiTIiIZ1fbQ/gf4RruOxBHJ7Q3OGqZtHI/HfIoN6tn7YwqJPOdLVyoSCcVLMvHq1Cf4l9diX0lhu3MitF69SlKjWI+zLsgT66R4ATn6/H6tYdwP2hM9hURt5RoASFZaF/M8iNjovrSM8RNYE3BBXUsruksrS8HYfvpTwiyM1ss4JTXGOUb2V+dqTsaQznFvItC/rsmXDLGKODhvFwlijkbmmVa2tQ6p4KcPxB/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(66476007)(478600001)(6666004)(38100700002)(8936002)(66899021)(8676002)(316002)(82960400001)(41300700001)(6916009)(4326008)(66946007)(66556008)(54906003)(186003)(85182001)(2906002)(53546011)(6512007)(26005)(83380400001)(9686003)(6506007)(86362001)(33716001)(5660300002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1ZRTnlPaW8wZEoxRUJJWFc5T0I5SXN1Vy9uc3JYMXhWcWcwYTRKSnBIWDc2?=
 =?utf-8?B?UCtSY0FoeDBBWFN5dnoxOGNjSEVLZDB0Zm1YMmRpUTZNcWtnRlkxRHMwc0k3?=
 =?utf-8?B?MWdlODJ1ZG13cFp0dENNZjNnNGZUSkdLb0svNTMrQTAwVGV1ZjErbTIyUU04?=
 =?utf-8?B?V3liZVl1cTY1SE5XUndHRElJMCtTNUduMlZMejBxbzlvbENzTmVNYjFyTlBv?=
 =?utf-8?B?WldBS3E4Ujl2aEtUaU9PRXNrSVZtQzVVZEtpTng3Y3dLSjJReUJhMGJaVUFE?=
 =?utf-8?B?UGJyN1c2YXc2a1Nsd1ZUUWh2cmZoRmQ1clNPZXRycGlqd3JoMDNRVHVOL2FS?=
 =?utf-8?B?VTRyc2drV3EvaXo4d2N3OVhDY0lHNyszRmZkcFRIM2hlUUc1eWNQeTFubjhH?=
 =?utf-8?B?d2dlUG91NG9KVWdxbXpENmY5bFhUU2VFZ05tUGlVK3QzcWwyRWtDOFBETW9m?=
 =?utf-8?B?eTltOW93Z0F6ZzlueWtYSW5mTmVWSHNKT1ZEUDdyVStUbEpvRDFSTFdyN0Rp?=
 =?utf-8?B?cWViWVl5TCtUSTdOdDJsenJkbnZxNVlMTEkvU1ZsVlRRNDhrVVZjaHNBaW1L?=
 =?utf-8?B?TTJxTkZQbWFTdklyYVM2WnR1OUdUZkRqaWd4dG9KY0JUZXk1anVWMDNuL3pR?=
 =?utf-8?B?S0hhS3JrVEFxZmhtOU5qRTBmSnc3aXZvU0puNEcvOUdycG0zS0kybjBBVmpm?=
 =?utf-8?B?bDJ0R1RIUzY1cHZJanh4dndWQ3FIWGUza1VwWVozV3FCMFFKa0JjOU16ampK?=
 =?utf-8?B?bEJpLy9obUkzek1lYUx5TkR3Q0ZqdVhsUHFyUGt2R3o3NVZsQ3kwRlVWUUQy?=
 =?utf-8?B?S1ZjSFR0N0xiOG5nYjVVdlJDNTl4OUxMUFlYN0VVTlNncTRkbHEzdlFWY3U5?=
 =?utf-8?B?Tm9pSytlSFdwYW9mKzN0MzBKQ2xOQnBLVDRaVmZsV0FmZll4bzVoQ0FwQXFv?=
 =?utf-8?B?b3l1NkM3NlMybXJweWpLV0JtejFmYWsyS3hWK1dxbUZRVk5wbXg5TlI0Ujh2?=
 =?utf-8?B?aXVwcHVpbjF2UkJTaGlSb1d0bTVaSERiT1dBOFZtSkZ4SVk4WjNVMEp1TWda?=
 =?utf-8?B?ekZ3Y2lWeC96aG1ZZURINXZSQldOcFBMWDNlL0k1VUFnd0NQYlF2bEpIK2Rv?=
 =?utf-8?B?bDR5RnRTNkNxMUxmY1IzU01nOHhyUlo4Nm4rMDUrRC96WStoM1BkK3Mxc1pJ?=
 =?utf-8?B?dVhDWDBOcEhvNERiUm5QcnZiUVlBZWlZNDM2Ly9HMndxWFVqRG5EL00rb2Ur?=
 =?utf-8?B?MnVFVVpZaHE1ZSs5NEN1aElPcFgvM2RBZC8yL0F1ZzdlRzdyOHFLL0RzVXAr?=
 =?utf-8?B?QXBiMFgvL2cvQjZmano2YlBkRTdBS0VrNU1VQU92dDRFRzJsdHc5SVlVN3pK?=
 =?utf-8?B?SDE2dU14dTNhTGRKeXAraUZCcmc3TzJueHdzaXpWRUloOHhiSWdzdk1pTEp2?=
 =?utf-8?B?T2NaYnVqWUlveUhMeXJBaG9ObjhxcXl4dGthSXR3cjVtYk94OEVHQXdENnE1?=
 =?utf-8?B?MWkwc3VobytzUHhOSFNsaE5Jc0VGcFlsL0d2WDRUbzlCTVc0VFJsYlYwTjZR?=
 =?utf-8?B?cHFvZWF2cUlzdTdzc3pXOWpYWnp1NzVGRDcrNE9rV0lFU0JmUXRhTVVZTmhz?=
 =?utf-8?B?Vk5MaENoOHZzaFhpdWZRVnBMK3BJMk5HcG5zbktENTUrUXVtOVdTQmx0K2kw?=
 =?utf-8?B?WDVsMUE4RzFmQm5mbXNhNjRvMktScWgvTGJlVnZicDVzWG9hd2R5S04reXlr?=
 =?utf-8?B?R05uWGNkdWR0Yzk0YkVPd0tqVEpOUnVORDRKMFRVTE9TQTFiYzA3K2RwRlFS?=
 =?utf-8?B?SDMyeGRIaDRMcjdOSFhtMDU5aGxORHRFdU1UNGdHczFsUWI3djhKT0xpQlZB?=
 =?utf-8?B?TjFsZTdZWVZJVnVhemlZSFVKSnczdWgvSmMrR0NPUVFuNUFyT3puRmxBUzZk?=
 =?utf-8?B?a0hBQzR1NXNpMDViVUU4bG5LQTFlaHVmSXdNNWpreHZVVEJWNzUvQmVTQk5I?=
 =?utf-8?B?NlRvVkZ5ZStVMHNPUHZuTHhUdncvYjFMSTBWWU1TQWZaUVREazZldE9jeFJl?=
 =?utf-8?B?eEJicDRjSzZkN295dFh1VzRIc21sWW5PbngrSFIxMWg3TkN3TUEwM0kyd2ZI?=
 =?utf-8?Q?4aEWEiuK8p4sCc07KatykeRx2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/wu37M+yfZ4ls2v1GsagGO2R9c6GWUXCo9aTQfA9Voxk9uFjtrc4UOtGZx6njFY2zUsl6S/AQI2teRUznjetimGHUUkUVd7DZH8/1fwmm+UujuP+yFt+GdoyfJA8eJHuL6eQU23V3oM84zYdivTwiDaxA4NCZRpoBWdNE8YnoK6OBg+basf5iT0I+tRqKkDs77I+Ti28cxzsGH+CnezQuG5+ZA/OssFKJePsoQxCEVArnEKAaWwSPu7/TB1YgPxvUcwNEcFnj1Q5owSEDR6CD0STOmP+E/JBin2vnIhphAZueyxb9L7/yYGJ9xtBr2OBHB+mBrWZrByXBwmiEVRxMpYiituL8sj3MZXNCJ9jlYmtaIA8+LbdLYxv/z80zT3Py0NNf9jkcO4Lab7Q1iK1RS3AK1CwfU839ufjWDE/VI5jSB7a3paajzdppf69npV81WI1F08zRvHorO1CcppKfhyAY5B6kpIjKGC2npBciYIUvwTQBQJq1sR13xeR3YtwrpGfbIdMLYfZLC+L+0yPTWcju/yVjElkYMWiI7lgQSEtD+EEahX3kGu7Z+Rgyg4CzOh0z+QmYHFRBiABXlTxUvafLV75FvI6cASKkigpSoJ8lNTIJTiHXBiHYnId7Yr55vVmGpa7qJYmX6qARMM6hSmQKVIT3EKcalArTVCqjoqzadx/Bn4qaxqVvB5oiJ04QrxXONfMrk4oIFfwpAQc8WHhV2owA/6ycaQakewKsW8IHpWHXCNq7zcFC1GnCBZwKxkUVbKeKrbdPcg/q5z33UL+JVMXkyM//EM461B/YOfrhji4yBv03Mcco5c6dq5g3KnaS58H0RVEz+3Gro0ce8aGwfKIR0hmGTMRIq5OA/1i5kGoLPT6G2sxcdsCEPJabqgC95gr0hP0xqgWUGUG2WK+jaDesM+5K5JHNpZF4nw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c5aec8-1159-4658-2047-08db40b4de5e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 09:02:57.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nl3ZTaYcX6SyOF26vpqlOhxworjx19xibzAe3rB7T9NckHESmJ8mio8V3rCcS+gW+m7+r4mLDU2pq+pGHUh2AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6985

On Wed, Apr 19, 2023 at 09:07:41AM +0200, Jan Beulich wrote:
> On 18.04.2023 17:54, Andrew Cooper wrote:
> > On 18/04/2023 4:42 pm, Roger Pau Monne wrote:
> >> The addition of the flags field in the vcpu_set_singleshot_timer in
> >> 505ef3ea8687 is an ABI breakage, as the size of the structure is
> >> increased.
> >>
> >> Remove such field addition and drop the implementation of the
> >> VCPU_SSHOTTMR_future flag.  If a timer provides an expired timeout
> >> value just inject the timer interrupt.
> >>
> >> Bump the Xen interface version, and keep the flags field and
> >> VCPU_SSHOTTMR_future available for guests using the old interface.
> >>
> >> Note the removal of the field from the vcpu_set_singleshot_timer
> >> struct allows removing the compat translation of the struct.
> >>
> >> Fixes: 505ef3ea8687 ('Add flags field to VCPUOP_set_singlsehot_timer.')
> >> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > While everything said is true, this isn't the reason to to get rid of
> > VCPU_SSHOTTMR_future
> > 
> > It 505ef3ea8687 does appear to have been an ABI break, that's
> > incidental.  It dates from 2007 so whatever we have now is the de-facto
> > ABI, whether we like it or not.
> > 
> > The reason to delete this is because it is a monumentality and entirely
> > stupid idea which should have been rejected outright at the time, and
> > the only guest we can find which uses it also BUG_ON()'s in response to
> > -ETIME.
> 
> The instance in Linux (up to 4.6) that I could find was
> 
> 	BUG_ON(ret != 0 && ret != -ETIME);
> 
> i.e. not really dying when getting back -ETIME. (And if there really was
> a BUG_ON(ret) somewhere despite setting the flag, it would be a bug there,
> not something to "fix" in Xen.) I'm afraid I also disagree on "stupid
> idea" as well as ...

The logic in old Linux is indeed 'fine' in the sense that it doesn't
hit a BUG_ON.

The problem we are seeing is that when logdirty is enabled on a guest
with 32vCPUs (and without any kind of logdirty hardware assistance)
the contention on the p2m lock is so high that by the time
VCPUOP_set_singleshot_timer has copied the hypercall data from HVM
context the provided timeout has already expired, leading to:

[   65.543736] hrtimer: interrupt took 10817714 ns
[   65.514171] CE: xen increased min_delta_ns to 150000 nsec
[   65.514171] CE: xen increased min_delta_ns to 225000 nsec
[   65.514171] CE: xen increased min_delta_ns to 337500 nsec
[   65.566495] CE: xen increased min_delta_ns to 150000 nsec
[   65.514171] CE: xen increased min_delta_ns to 506250 nsec
[   65.573088] CE: xen increased min_delta_ns to 150000 nsec
[   65.572884] CE: xen increased min_delta_ns to 150000 nsec
[   65.514171] CE: xen increased min_delta_ns to 759375 nsec
[   65.638644] CE: xen increased min_delta_ns to 150000 nsec
[   65.566495] CE: xen increased min_delta_ns to 225000 nsec
[   65.514171] CE: xen increased min_delta_ns to 1000000 nsec
[   65.572884] CE: xen increased min_delta_ns to 225000 nsec
[   65.573088] CE: xen increased min_delta_ns to 225000 nsec
[   65.630224] CE: xen increased min_delta_ns to 150000 nsec
...

xenrt1062821 login: [   82.752788] CE: Reprogramming failure. Giving up
[   82.779470] CE: xen increased min_delta_ns to 1000000 nsec
[   82.793075] CE: Reprogramming failure. Giving up
[   82.779470] CE: Reprogramming failure. Giving up
[   82.821864] CE: xen increased min_delta_ns to 506250 nsec
[   82.821864] CE: xen increased min_delta_ns to 759375 nsec
[   82.821864] CE: xen increased min_delta_ns to 1000000 nsec
[   82.821864] CE: Reprogramming failure. Giving up
[   82.856256] CE: Reprogramming failure. Giving up
[   84.566279] CE: Reprogramming failure. Giving up
[   84.649493] Freezing user space processes ... 
[  130.604032] INFO: rcu_sched detected stalls on CPUs/tasks: { 14} (detected by 10, t=60002 jiffies, g=4006, c=4005, q=14130)
[  130.604032] Task dump for CPU 14:
[  130.604032] swapper/14      R  running task        0     0      1 0x00000000
[  130.604032] Call Trace:
[  130.604032]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
[  130.604032]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
[  130.604032]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
[  130.604032]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
[  130.604032]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
[  130.604032]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
[  549.654536] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=6922, c=6921, q=7013)
[  549.655463] Task dump for CPU 26:
[  549.655463] swapper/26      R  running task        0     0      1 0x00000000
[  549.655463] Call Trace:
[  549.655463]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
[  549.655463]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
[  549.655463]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
[  549.655463]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
[  549.655463]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
[  549.655463]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
[  821.888478] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=8499, c=8498, q=7664)
[  821.888596] Task dump for CPU 26:
[  821.888622] swapper/26      R  running task        0     0      1 0x00000000
[  821.888677] Call Trace:
[  821.888712]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
[  821.888771]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
[  821.888818]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
[  821.888865]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
[  821.888917]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
[  821.888966]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14

At some point Linux simply gives up trying to reprogram the timer, and
that obviously lead to CPU stalls.

Ignoring the VCPU_SSHOTTMR_future flag allows the guest to survive, by
not returning ETIME and just injecting the expired interrupt.

Overall I'm not sure how useful VCPU_SSHOTTMR_future is at least when
implemented as done currently in Linux.

Instead of trying to reprogram the timer Linux should do the
equivalent of self-inject a timer interrupt in order to cope with the
fact that the selected timeout has already expired.

> > It can literally only be used to shoot yourself in the foot with, and
> > more recent Linuxes have dropped their use of it.
> 
> ... this: If used correctly, it can avoid injection of a pointless event.
> Clearly the Linux change dropping use of the flag indicates that its use
> wasn't correct (anymore?), likely because of not properly dealing with
> -ETIME up the call stack. I'm willing to trust Jeremy / Keir that at the
> time of its introduction such a problem didn't exist.

I'm afraid Linux didn't implement this properly originally, as it
attempted to reprogram the timer with a bigger timeout rather than
just doing the equivalent of self-injecting a timer interrupt.

Thanks, Roger.

