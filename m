Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0D9709BB4
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 17:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537174.836059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q02P2-0006Q0-Av; Fri, 19 May 2023 15:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537174.836059; Fri, 19 May 2023 15:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q02P2-0006NJ-6P; Fri, 19 May 2023 15:52:24 +0000
Received: by outflank-mailman (input) for mailman id 537174;
 Fri, 19 May 2023 15:52:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9pCJ=BI=citrix.com=prvs=496ec590c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q02P0-0006ND-CF
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 15:52:22 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21874dd9-f65d-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 17:52:19 +0200 (CEST)
Received: from mail-bn8nam04lp2048.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 May 2023 11:52:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6504.namprd03.prod.outlook.com (2603:10b6:a03:394::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Fri, 19 May
 2023 15:52:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 15:52:10 +0000
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
X-Inumbo-ID: 21874dd9-f65d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684511538;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=67iwhlo1gSg4uAUZlHc9WXoYmjyPevZMdWTL6UP7ghQ=;
  b=UGmS7ptmMnKLncqvgxYijTd5aSEVH5XxJTE7jM6g3AUEIQmJkrIwbKwh
   Dspj3JNJO/Ey8B7IKAlqK5/QPcE49G+jl/K8bWAQgkM5loF34eXY6Ar6L
   ldYk4OqLLQOLl/wT5YjxSQJRigGoJ6uEq+cUPJPgTtAC7h0dmwWLVLd3v
   U=;
X-IronPort-RemoteIP: 104.47.74.48
X-IronPort-MID: 110080316
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Nz/MpKJznOFSKRPwFE+R85QlxSXFcZb7ZxGr2PjKsXjdYENShT1Sx
 mpJD2+CP63ca2v2LdF/O4rj9BwG6sOBzINlSQFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4wVvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5UBl1l9
 vkYDwxWSUGH18mM3uibFeNj05FLwMnDZOvzu1lG5BSBUbMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VrpTSDpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxHujCNpJTePQGvhCpX+C/msDJQYsWRilotjimnTlW9EEE
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9URX5NkcHbC4ACAEDs9/qpdlvigqVFoozVqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTygbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:0oAPy6HWLdxKhL38pLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-Talos-CUID: 9a23:YmIBG24sBd9EXYh2Qtss10koMcMgclrhl1CBJx+TM3gzaOKfRgrF
X-Talos-MUID: 9a23:yJAnIATLUDKLKGJuRXTJpiBaM9dF+J6iS14OsM4WgZKENndJbmI=
X-IronPort-AV: E=Sophos;i="6.00,177,1681185600"; 
   d="scan'208";a="110080316"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXFM8jzBKp+kBNJHQGcWtgEqwrDNXC4TQKaAYeYvWf6gIFhJUhfkaTAqgRfSsIj7xt5U4of3mVU35IQLRHTrA76yGKba2xXa6iYl31UO2rdWCkiVE0Jw35sAcIioGO6AhT6Oe7Nwo3Pjp2d3m/+Oh0MDEDIRlIgXx/6YUgA7JT60HvbR7MNcGGkYBJioOREcq6UWBu3K0jYlBniqsWFrQ0jUWGuc0ge8EluUcBHzFVBmq+B/o60WEdXk3hvwdRp8vjrfeVQh2GR12tq/ZxzzC9OATRlY7B4F2CuOmY8Vvq/+vvH0M8t1NjC9WShPlNsbU3z5BY/sPfWVykTu8SXxjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67iwhlo1gSg4uAUZlHc9WXoYmjyPevZMdWTL6UP7ghQ=;
 b=aG1/r9yCTA0smDoOtn5w5EwPZ2iQyNUmxbq9uTk2U4l7in4ZcePUZ3mkrr1OAtz7aaoj1ZFvKM7xUvNFslzkHYYko+fHs/PZtQW62D3SnKeYLLDt23ls3siKpt3o3JRDFeXvLmJ1Lgm+lH8XXEGo4P3L8kgSkHvrZE/oCp1eToPTKYdPwuUR550sub4vc03yo8aB/vsrV9hj9hf3hPM93IlGuHKuxI2bDCj4YH+tFnMT3+X2ifkWSUnL+rxbtNlzUGkBRgDkzKfsWUaTgoiL2tVpSpxS1uhzhHqXI92TpAG7bZEBzd4UCkcXgWwJ42v/qywUkvH0ob7KGOU476i1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67iwhlo1gSg4uAUZlHc9WXoYmjyPevZMdWTL6UP7ghQ=;
 b=UHjgyEAi0SAsNgNYQIJE349hD9hX69103UlQYwgXf84jJQrkYb/k335ObWpEsMuvERrMy0/8idN/gLRFDk9Kj8XxTFNFqMIjcIKnNrYq/Fbo4Lve5WgOyNdHjT9rYeEXCBcpKcChqtq4C+iDuYeoUJ5oYvaUyx9/L/8Mqm6smXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <897bac23-b17d-ec4b-613b-d4d1b4c77d58@citrix.com>
Date: Fri, 19 May 2023 16:52:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/6] x86/boot: Expose MSR_ARCH_CAPS data in guest max
 policies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-7-andrew.cooper3@citrix.com>
 <a545a6c9-db48-9d91-c23b-59ea97def769@suse.com>
 <25421dbc-5889-a33c-37dd-d82476d56ce4@citrix.com>
 <1bef2b0e-04e8-2ca0-cf03-f61cdae484a9@suse.com>
 <b1c56e56-90cc-0f37-4c8a-df1217339e59@citrix.com>
 <22a6bd70-887e-da72-ccff-16b3627463c3@suse.com>
 <54b35fa0-160e-3035-6c22-65a791ed2f84@citrix.com>
 <a53a77e3-6dcd-2668-0f3c-282de93d8b04@suse.com>
In-Reply-To: <a53a77e3-6dcd-2668-0f3c-282de93d8b04@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: c4cf129f-f565-4d8a-cc2f-08db5881012b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	USJ6em7ko9EWl0vyTpCXVYLqmOp+D6oe0gH0ure7zG9DOWsprkb3m0DoqK3L342LiuTpwWmmCMqTkDIRDltogp4aESnt2cuWHEjjpndTEObLlewcLQDnneJ31/0fV9NOds3iVTGrrkwBkP/hL5W7JnjzObjHmPKW19/3iONJrQ5+YxYxGFiAV2U+tH4RlYh0CY055QOIkJnLqYLb6ff1DwO9W1TjcLzU7Qj2POnvOkP9PP66lEYNo3K7OqRm0UR5SxNGDIsWwQz+lPNd/QmHQEOyct4UcunRiAMcNoQPBL3KVUqC9xlxOWaGK8fLemj7dZNuCroqH0AtSMvkqD95K6nAKfpuDRN3/jmXgGwpzCJyUNvoxwfHy5yBhmV1FOHSgBdfxsrSYFeG3yeoTwcSlTnZGvl+dRBPOfn1k/q2dOgpkFfoauih7Flbx+EHbvTjkmMCXEKNn48dnV68bwLkvk71wK6obbmcyut6EtrnN6bpOa78x8+saW1wbDXpmQgFPFY7DdTXl+hr9OOnEYk1xBFAw6Adsipnc+TmmfF/ar1ykfirwsru7BYqXkD772DgvMgILZ+TxI7FLb44jR+rKDgUnYXoQ3gvSsbCEe01fYzIe5813Xa1rcvNIFwgfyktud2qasIYZ6Ga1I5pHICNgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(5660300002)(86362001)(66556008)(8936002)(8676002)(82960400001)(53546011)(26005)(2616005)(83380400001)(31696002)(6512007)(38100700002)(186003)(6506007)(41300700001)(6486002)(316002)(6666004)(478600001)(54906003)(66946007)(66476007)(6916009)(36756003)(31686004)(4326008)(66899021)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzhjNTdNYmN2YjZmdXZRVzdUdnpYQWlydkErRVQzNTVGamhJNk1wd0dXTTAv?=
 =?utf-8?B?Q2hFakIwQzFjSUQwR1Ruc2FvK2ZiMVR6SnlzaGNpQzdYQ0pwRVpuSzh5U0xx?=
 =?utf-8?B?aEhFR3lac25PNzFsT051LzVCbE9PYkh0dXZuK0lxTTQ3UU41dmZBWmNkNmxQ?=
 =?utf-8?B?azErNENLQ0xDdU9Mbmh4YzJuVThidUN0QmwzdXNid0F3bk1LNE5DNlBhYjg2?=
 =?utf-8?B?VkVEMTVGUUZ5S1NZSEFtZnNaVkxYUUxyZ3M0UzJKcWhBSE5tV0tQWlB0ZU1G?=
 =?utf-8?B?MUVjSWg3YUlFRkhxMlNxaEpBOUJHYzIwM3BwUXJ4Mys4dGs5WFFUTEpqMVRz?=
 =?utf-8?B?cVRaMUpoU1FwWWNnUzl6a2U1bEI0d0UrSmJXb0Evb0J6YitTRVBWeXRnL25k?=
 =?utf-8?B?MFRCenFpZk1nRVlzVjhHQjBDbmVtcmJScExpWi9YN0NFNjFYWVIyYU9oVENR?=
 =?utf-8?B?NzZDS09razdYU0lpR1d4bTNKeDhtbE9RdUxqUkpUNGFkRTg5NktaeW9DSjZD?=
 =?utf-8?B?MzhiVlpVREpNN09nelRlSU1uWVpyWGVQcTcrNHptZGRlVS9GZUs1UlJ2bDBG?=
 =?utf-8?B?Z2pJNWFDL2FRK2NiVlEySTUrd29sQWpPNE1hdmlMdC8yd2xOVjc1dXZHMzJ5?=
 =?utf-8?B?NmJRdkxGWW1ucGY2OHFUbkFVSGQyRTVqRHVMOTJ3eXZ5MmZ1a1hlRWdJdTBJ?=
 =?utf-8?B?WVhEUXVHNEw2eUNwa3JVeHRzRnVocnp3K3FrV0NFV3UwWFBpN2d1Y05odFhY?=
 =?utf-8?B?bnNBZktaaVRnSDRaL05jWmxmdm83ZlNWM2FSRzMyVzlUbithQ05URjg5Y1Ba?=
 =?utf-8?B?MVluSm4wRGhQQU5jSktNSkxKMlhSNnRpcy96ZDl2aXNJa2NjV3Z0bFR3ajhK?=
 =?utf-8?B?N2FDb0FVZHFLYzJNQ1NGMGNyYXVJZ1FPdER0a2NvdU05K3J5MFZ6MFo1bFhq?=
 =?utf-8?B?TnhxbFJQTUdGQVBFbjdBZXQyOFQ3NEZFWTV1OW1GS3B1ZFFtOVJHVlI1Ri8w?=
 =?utf-8?B?VGs1TGJReHNjdk1IdXR0a3haNzBqVHlXYVI5d3ZIZG8xdEw1b25MUmhXd1Yx?=
 =?utf-8?B?TE93ZCt6MFJTQktZbHQ1OTZoc3c1QStVcjhqVGYzY001K0ltT25ycTcvY1RV?=
 =?utf-8?B?Mi9Mc0pvL3lNZXhtcWhtelBpQktFcFVBL0M4d2E3UDhDTmVDU01QUVpPZm1v?=
 =?utf-8?B?VUl5REpqeDdTcG9qb2lvZ2hESllxMFB5L2M0Zk81SWJOYUduUWRIeWViVTh0?=
 =?utf-8?B?dTJoUUtESWdsR0cyZ2N2TlR5Mk16MVdYSXhiSG5kZlZaSk5JbHRDWjFRQTlC?=
 =?utf-8?B?QTJHUVdLZkltZmFXM3diaURxRFhmY1Y4czVoQUlxRDJZaGNzd2ZkQzhEWk03?=
 =?utf-8?B?b05UL2FxVU93YmlUa3Z1MHErQitCYzFyR3Q2dHBveVFoc1czVklqeFpoYWNS?=
 =?utf-8?B?VnI4VDVZWG1oMXNKNHhmQmRxYmZrc3hpcXpxbStjSncwZnZBeXZtbFlxck5K?=
 =?utf-8?B?ZXEwVHNXKzFWTmxyVXh3Vm1DcE5QOFNHZHB6NHVUUXJWdmtjMUZIV240bkdt?=
 =?utf-8?B?bHJyKzhmeFZYenM5MS9aT2VadThFWkRuQVgxYTBXRjA3d3ZwNjV1TUZWbWhF?=
 =?utf-8?B?Sm96enRmcnllRkZrVjIxYnptVTlWMDFRRTB2YmFXOEJKVDFkcXNmVFZtRGZ0?=
 =?utf-8?B?MUtxMHh3MEFmUlN2ZW5yZTRPeWJhUlhiZDlzRzRpc0NtVXV0WUlNeG1jb1lz?=
 =?utf-8?B?dFoyd2VNa3FsZm9QSWFmRWVob2NpV3NKNm9JbjR6Z1UzVmZWUDRsSytTOCtq?=
 =?utf-8?B?dmc4dWpHRjRKT3VVYXZnaXdoQ1dyVHhnM1JCOTVNUlBpQ3NyYmlpelY5cS9r?=
 =?utf-8?B?TDU5NFBTUm1CRFRkRDZMMy9JK2g1SURXdTdDUVpOU04zVGxuRFN4ajZiNmhl?=
 =?utf-8?B?VXhpcVdEZTZocDNQSjVIZ2VZS1ZZejFVYTh1RUt0QU5qaFNhWTNEMUFqd0RL?=
 =?utf-8?B?V2dMOG1LMHdsdFcvN3F6eHBEOEFWdmJUNFFZVitORms0ZjUyNE9yb3R6dUFR?=
 =?utf-8?B?bWhMaEpiMmRLZjRoQ2p6OFEzWmtPUjZZWEhJZzJUSW12MFhOMzZVck1jTnlI?=
 =?utf-8?B?SVUxanlNazN1R3lEM3NKeG9HYW5JRk9QcnRiWExmUTM5TlFVM2pUUzRBSzZJ?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bu3X8zHsYEg2YNtNqFT23lscNXm6ij7BvJmS4a53G4JbgVKq0HF4BYDErE1H+KtefSOEpF3oijwyeoJ/01f6bNhO+n7gDlo30VCyeJN0lQYbfNHhyCtxBQtNuURy+KFzyBDKdH0RYVozWQk/2utxyt7eNsf69wtv0m15k0ieb17b8K6cV3IJPxOD4yksOtRstuHO4MJfMgRrTPDm976UuaLgY3fGuBToPRtrhAEJv0KnC5xpjzjlCU0poaKwokIIGmtVgkCh68p4eoUOmmGxHAZ+I7odvtJqqOwt2Fc5wmLMq6gOyRSxJIQny2k9AFymWvZ7nOJcpsiqqrQ+dKgFO/B0zCtftuHxHlMLuCkzo6/sCinKS2D5hECDKR5xvDo/jTDERp6p1RzhVDc3KS2J/c94lwblrSV0B2gtrqloSE7MKSDUzdEV2JhW7QtO4JFkdlmlVkcAgEC5+xZGETBCeyKtaWNqwrdBK7v/2s6+ZmORlTCPoYpkWqMbhkT5pULy56MmXI866EsEJKqNX2A14EXcm1owVjcteZLVAcbQhkjJ+okJWOHfmpPS/9lb9yCv0tl8Rtah8Nn1k+jy3kEnUbLLbe3bMJ37DaeEczUf2xwWSX0wM3QMOdpqScWW7DI6LsXVmB8x3fj7YJTQI43mgvoOvhyPo1Quu6rxs7L+o9IoGoLOj1BNOMnj6p0l7h47ypwd5IO5MjMmVUZHgeOY5zMDhGN/30HrZfJCzo+GJaBV24KLrE8Hld69lDmJLl9N7T1gqckc6IDBoyRojzTtxwEdVLFFtyVI7/Kojadbzd9GcZWnlD4BHjujSpkNkiWE
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4cf129f-f565-4d8a-cc2f-08db5881012b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 15:52:10.1719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnA0Y6Mj30xL9Bkl1/K4uC+euRhqE9ydtMeDSsg9eV6DiJiz12M/U7wgUIsB4PRqm0qvdf7HOjoGFNfTh53CCWDJdcNlcb91ZfwmbNuBk5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6504

On 17/05/2023 10:20 am, Jan Beulich wrote:
> On 16.05.2023 21:31, Andrew Cooper wrote:
>> On 16/05/2023 3:53 pm, Jan Beulich wrote:
>>> I guess that's no
>>> different from other max-only features with dependents, but I wonder
>>> whether that's good behavior.
>> It's not really something you get a choice over.
>>
>> Default is always less than max, so however you choose to express these
>> concepts, when you're opting-in you're always having to put information
>> back in which was previously stripped out.
> But my point is towards the amount of data you need to specify manually.
> I would find it quite helpful if default-on sub-features became available
> automatically once the top-level feature was turned on. I guess so far
> we don't have many such cases, but here you add a whole bunch.

I'm not suggesting specifying it manually.  That would be a dumb UX move.

But you absolutely cannot have "user turns on EIBRS" meaning "turn on
ARCH_CAPS too", because a) that requires creating the reverse feature
map which is massively larger than the forward feature map, and b) it
creates a vulnerability in the guest, and c) it's ambiguous - e.g. what
does turning on a sub-mode of AVX-512 mean for sibling sub-modes?

Whichever algorithm you want, you still need *something* to know that
ARCH_CAPS is special and how to arrange the defaults given a non-default
overarching setting.

When the toolstack infrastructure grows the ability to say no to the
user, it will be able to identify explicit user settings which cannot be
fulfilled.  (And with a bit more complicated logic, why.)

>>> Wouldn't it make more sense for the
>>> individual bits' exposure qualifiers to become meaningful one to
>>> qualifying feature is enabled? I.e. here this would then mean that
>>> some ARCH_CAPS bits may become available, while others may require
>>> explicit turning on (assuming they weren't all 'A').
>> I'm afraid I don't follow.  You could make some bits of MSR_ARCH_CAPS
>> itself 'a' vs 'A', and that would have the expected effect (for any VM
>> where arch_caps was visible).
> Visible by default, you mean. Whereas I'm considering the case where
> the CPUID bit is default-off, and turning it on for a guest doesn't at
> the same time turn on all the 'A' bits in ARCH_CAPS (which hardware
> offers, or which we synthesize).
>
> Something similar could be seen / utilized for AMX, where in my
> pending series I set all the bits to 'a', requiring every individual
> bit to be turned on along with turning on AMX-TILE. Yet it would be
> more user friendly if only the top-level bit needed enabling manually,
> with available sub-features then becoming available "automatically".

I think I've covered all of this in the reply above?

~Andrew

