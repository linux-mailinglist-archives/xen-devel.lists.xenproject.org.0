Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C82554500
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 11:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353671.580633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3x8Z-0001s1-J1; Wed, 22 Jun 2022 09:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353671.580633; Wed, 22 Jun 2022 09:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3x8Z-0001pQ-Ev; Wed, 22 Jun 2022 09:59:03 +0000
Received: by outflank-mailman (input) for mailman id 353671;
 Wed, 22 Jun 2022 09:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yiMn=W5=citrix.com=prvs=16524ee06=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o3x8X-0001k6-3M
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 09:59:01 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eede6264-f211-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 11:58:59 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jun 2022 05:58:55 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CH0PR03MB6004.namprd03.prod.outlook.com (2603:10b6:610:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Wed, 22 Jun
 2022 09:58:54 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 09:58:54 +0000
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
X-Inumbo-ID: eede6264-f211-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655891939;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=eNiLAIgssQhm0nLX8FD66p3aLclCqyMd2FZ9hUfeSzw=;
  b=AGvEeAwG3+ng0onPrc3NE6awIczsxn/p/ZNWfDmt8uDVTciKa1b2JLci
   GCC4G6YBtkiolOfAyGMRe8032hkYUs6XwiEAQo3oFOgTKYyH7vL6dhDl1
   7TUdJ9mo1Z4JJsJurDIUDuUg3BLiioe9UcGz3ea6gYaImaAa7dBmDitpQ
   I=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 74169286
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Xf6tvaBiAjnJtRVW/zXiw5YqxClBgxIJ4kV8jS/XYbTApGwr0mEGz
 mAXXT2FP//cZmCkc4slYdzkoxxQupDcmNY3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgH2eIdA970Ug5w7Bj2NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgp8
 oRpiZuLajwMFfHKqsssThV9FQNHaPguFL/veRBTsOS15mifKz7G5aorC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6l+B8mbGc0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLj03yeuKW0GwL6TjbJmzW+I0VxT6qf0c9/Fa+2KZd5xn3/N8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3vx3hFyewEQDBRtQUkG0ydGikVK3Ud9bL
 00S+wItoLI0+UjtScPyNzWnpFaUsxhaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBONB0mLicSHbY/LHLqzq3YHARNTVbPXVCShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlVdCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:TP/+bqiDSR6GM5R252F8L4P4YnBQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A/eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wga7VBaM0ot
 gsCZ4Y5Y2mfvVmE56VO91xMfdfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.92,212,1650945600"; 
   d="scan'208";a="74169286"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJJFVL+svx6RMZaaFE6kZ84Rsz7gUfHBfC3vfZRtexALuQ+OYtDnUfBMwVsvjMwGOH/naRTy8obUr3mTQqDo0fk3PIGPO/M2Uwi2DioSnRrHT4xDQUMm7YIf+IBUzS98v4FwtAhHINlfT/diihbdPIYYKYqDG0S3eA8gBAtG3uJKLasfjIF+wGm7x+LDzs5wTh3q1O38keVYw3k2OEA9mbt+OhYXvRggptuJclLkpnGxLkuWIoX9UNdoISuGsHveqR1Tcu0dU/ieUqrFjjgiJhYQl3sjXoWWJ2YStsRbRelXDiwyrac7gOicdRynxbM4X2VOpuBcsxAtqGDoB/d+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2EV5tonzJIPulUy46pxp4GLLEnXB3kv3cVvgV4PxsM=;
 b=jqN+D6HoSkHE80GX1Wc3T0uA4CQ1LIkwCE2d+RZ1NfTBWQ9Gf6XAYLurYRUeVBVNIMxnIZgds3ali4iXSucgv3oDgSeOHbscAFFKj2UuBUTXAL06cAM7QOI3cPil1xegEQ7k+8yL5/RLna4y2wbJkkR1WB2Who+XnyPF/Ga+/XsYtHi9v6DHelN+l02VjPkSzVF0RBoKR5sYr0g6zoMCG4FeGm/pXeXZe+937PbsWHSxw5ZL1GRBtHcUTiUS2N/hBMZXNQoJgR4s2W0tf+jbwUZZI2sZunPwilkLWVAR/iE3oLYaiXFQ3+w6AfEiWqyev5DOU7neb+98649XrFvX8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2EV5tonzJIPulUy46pxp4GLLEnXB3kv3cVvgV4PxsM=;
 b=fvF+3I5mhxnj1tN32THWDaJ6/IjP6LPbDpTuADua1zkKuVe4bb7pYu41uUQBWda/TpTLEjDWEvxKt8D/BVi0q9m5oJrz2GXazRIdsWpYt/BMXRy/dGCVph7ir08pe8DYh1LzILhsSKc1RcQOcop64dQsEfmS+r9bhTqYsxiIi0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 22 Jun 2022 11:58:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Message-ID: <YrLn2tgaAQlnMbIL@Air-de-Roger>
References: <YqgwNu3QSpPcZjnU@Air-de-Roger>
 <69d85d88-4ec1-987c-151f-0d433021fe34@suse.com>
 <YqhHtetipYTG8tuc@Air-de-Roger>
 <72c94980-cbcd-d3b3-7aad-c9db58d9c4a2@suse.com>
 <YqhXFKMlIvkQzVoT@Air-de-Roger>
 <291bb0ee-06d7-af25-79bb-e099c7ff2fe1@suse.com>
 <YqsUfH763oSchRdW@Air-de-Roger>
 <8ee15e94-f4a9-69f2-4c57-2e0cc9df8746@suse.com>
 <YrLcLpsd8hOcMOGI@Air-de-Roger>
 <af4f325c-367d-4b05-fe96-b102b7f7e554@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af4f325c-367d-4b05-fe96-b102b7f7e554@suse.com>
X-ClientProxiedBy: LO4P123CA0270.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a1d5695-a592-4e30-38f3-08da5435d0db
X-MS-TrafficTypeDiagnostic: CH0PR03MB6004:EE_
X-Microsoft-Antispam-PRVS:
	<CH0PR03MB60049A65984019101B2BA6D38FB29@CH0PR03MB6004.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yFDwD8crU3YTG7qfJoJMe4c8guZ+DlWXZfCxFCSaXOMOiXrtNLUo12A1i3eAPFQLM/BsFdLn0UOvkHyi1s3WaWVr7+LS++QkmvtnF1Yj1muz6XhVnawMpu3aT29PsjdQoUZVNVDtJHmsnTZKU4HFLY9Z6B3/85uMJ6mf6F8I5II7yw8LeHmqmKmk2TS93ySv8JptLxAw6EMLO+9g4mPzwPfpc0f68pv7kWROVtdwfW5MrKyvVNf5TFB6XPVbiVwRA/kVoyiJfMkdOqFHnLcewf1ZMrFFKEWTDEuWaoWbw4wTxgDUMBqCh0iitO0iGWuAo4nmAdGqvlL5X5mPrD8/cu7zRA3T/DgrTKotAFcc0UEm3CyFzHI2WhrRl7HPbOvns5oQ6yNYW1gt+m/WUQH8RN9913A/enV74ZWA/v+X4nDSp4rFLrQ5lqJxfWPfoXKmf3GB+mzXD9hhVJYEdCI4j5mD2V5ugvAnw7aZSA2kylG9ZkA5og9ZVYEj1bhsXzI84TfmhjX6ABy8CmXk/OARRmWUxrsTjQS7Cv5BkLRqwOdx4i9j2d/2xxaQHNyTgSIAI97EGOi9rTraYqMZPQ5yJCbeKEIZ/1aWPpinTIPQPMs8ha+KVPI15AJXnyNs6oDnCndSEDbPhmMAvqOUK1DLEGL3cl/W2gjGdvMqe3uekhCqGezN8EM6QRTxmRHP7m3P1dEE2ZB5yMk/IkUOWOL4zw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(136003)(366004)(396003)(39860400002)(376002)(346002)(82960400001)(85182001)(38100700002)(478600001)(83380400001)(33716001)(6916009)(54906003)(316002)(6486002)(4326008)(53546011)(186003)(2906002)(6512007)(66476007)(26005)(66946007)(5660300002)(6666004)(41300700001)(8936002)(8676002)(66556008)(86362001)(9686003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3VDTlFZVElURlBCWUk0ME5idE53YTlsWlhoZDZoZERMUStKQ2ttM1E2R2ds?=
 =?utf-8?B?THc0ZUh1TlJCaytrSjNtOXU3VFRrMXpQc25PbkMrL3FwOE5qZnFGSjJJcmZW?=
 =?utf-8?B?cldFL0FvV1gyVnhqa3h3aTVITkpUSDNmQmRCSWlNUkozQ0M4SEJzZTJ2VHJQ?=
 =?utf-8?B?b0dKM014eVpqOGZ1WjRMYVpTRkZJSTNEZW1IMVlSZ3lZWTBNelg0NU5RanFm?=
 =?utf-8?B?SXJlWWZ1SlQyajlHUFNZMmZsTW5GSUR2SDl6NWUvWjlFYnV4ZWo4Q1JaOEVL?=
 =?utf-8?B?S3A1b1pveERCZ04zVzVnTTJUSW8rcUhRS1pHN3JBaHNlVkQvWFQ4cWtvQXRR?=
 =?utf-8?B?azFjUkpIdnpRZ2dLdzRmVWt2REYydElvcnhLaXVpOU9VVlJ4NmFxK0tIVDBT?=
 =?utf-8?B?ZHpHVThQTE1RTzRZT2J1Ui9hanBRKzluVVk1RDRzOVFrOTAxTUdCMGVwa1kx?=
 =?utf-8?B?L05tdzdvSk9FOGVOUThJTUxsdnNnVjFjTXJndENqUlVFRWZtcGN2UTJYVlJn?=
 =?utf-8?B?YnRyQnArQ29yNjc4WVF6YVlMMmRFYzQ2dSsvMjBNTm9wUHMwTjFBaXZxeFA1?=
 =?utf-8?B?V0ZaR01HZTAxQnM5cW95OXZsWlpXd3VhMlkyZ2daYkk0Z1RXamRYNXhYRlRx?=
 =?utf-8?B?Vk10WjR6QytsUGtPRzdwd0cybE1EejJZYVF0R3VZeXRVQmpjbzBaTitVblB5?=
 =?utf-8?B?WkM1aXE3ZEdlZFRzNDhLVW1JT0IvOE03UUJFM1NKR0tJMHUrOXBRN1NPZW01?=
 =?utf-8?B?MUNBV1NJeEtOcDRudFJYSkpNc3VOWkc4WFVJNG1sbkk2UTlRT1RURk12aTBk?=
 =?utf-8?B?NzdiSkpST0l2ODN3cHF1dEVhMkM5aHI0bXJRUFJmZ043SGg2U0pYMks0dWk2?=
 =?utf-8?B?TVN0UzUxUk9MRjYxdGZ6cUZiS1N5SXYzMnlDSkVWMDhMU000bHJkMkxBeXhr?=
 =?utf-8?B?cFpJaWtvWGVTWm9ibWxLaThXd095Zkx5cnZ6b3h6ZzdjaC9mUDVKekk5cWR6?=
 =?utf-8?B?bWJkelptZW4yZFhXcGwzT1kvdTBtZld5T3hKTXI3cGFhK0gxVTFyOVFNWjlG?=
 =?utf-8?B?RzNzMlhaY2NaenVwRzJuVmpPQm9uc01VcDgyOGs1bXJxSnFJQWhTY0dUU3V0?=
 =?utf-8?B?dEVGOUMwa2Q0cDkvOE5JcEpwZE8xMXR4dTJNOXIyQUs2aFBwQi9lNFlqZG5u?=
 =?utf-8?B?ZnBaZzlXcHFONHB6QnR5NFhxVDJHdXFkMEpQWGxjK2JNWkYwVnNORHV0MVcx?=
 =?utf-8?B?K1laMnRlNWovYWxLVU5SOWFiWk5rZ3NmbE95RkZ6Ung4bU1CdFYxUXk0WFZY?=
 =?utf-8?B?YkpXWTNiVnk2N3A2RUt6MGRnUjRKMmZvcDdNOVBmR0lLN0Zwc0hWT3R6dzBZ?=
 =?utf-8?B?Qkc4d1JNNkVQeEtyZXQ0dVNyS1B0bmlPV2xvOWdmTlEySzN0Wm1jcnpUZkQ2?=
 =?utf-8?B?MmRSWVgrRzBudTJOWFd5TDBiTHhTSDhKaVVFRWxoRmkrZTd3WElvUVdzVDRT?=
 =?utf-8?B?QmprY0NpcEdXa3dYY0Q5QU9ubFVFZnJjTjhCd3VyQzFyUll5Tkt1a1BqQ0lF?=
 =?utf-8?B?TFI4WjRkN2NGbVB5bldrNmxSQTVvQ2IzakFxREFpYTliV25PTTM0SWZuUG9q?=
 =?utf-8?B?aHR5LzQyWGlYMnhRTDI3WkxpelBQMmJjNzFWQ3VPb2QwM1AxL3hIWlkrNGdT?=
 =?utf-8?B?MExpU3FVbmlvSDlqWGErM0JTdGJTUjBaNHhYYkMrNmxHR3N0Tk41bDlIcGla?=
 =?utf-8?B?TDNkWEFiQ3U0eXhqbDhkbVNWUDduZWlUcHZmQUlFL0RJdjJnazNpa1dXc1BK?=
 =?utf-8?B?ZTUrN0JXVUZ5elllODdyYWlpeXovQm1CR3E3UG1uUTc5L1pPL2x0MjNQNXQx?=
 =?utf-8?B?MU13bGlvamNuU1BkdXdXSXZGQzVkQWZ5RGZqdWg3WnBXYzFHK0R6bk85UFAr?=
 =?utf-8?B?OFhTTE9GcGFWVjlmY1EvTHNvbldCRm5jeTZvMyt4MDQxRzhiRDlGdDZjd0RD?=
 =?utf-8?B?c2t0WmtsQ055NG9FQTBBVmVJbjdWZEZRSWNYcVJkTDU1ZjlMM3ppS2Q2UTFP?=
 =?utf-8?B?QzJyemtMWXc5UWhQTmF5ZnpCdTRldkNubGoyRW5Da040VWgvcHFRL09tbitJ?=
 =?utf-8?B?U1RZbURGb3Y4Z216WmVxSWcvcnJMVy9BK0FlNHIzQmd3OGN1dEVPbjM5NTlE?=
 =?utf-8?B?eU9kSitNZTdrby9XbkRBQW1jTWZjSWU2RFlkbUNaUk9UeG9EMjlRcVdNK0Yv?=
 =?utf-8?B?c1g1MHpPbnBYNCtIaGt0cklsSk5aRyt5a2g4Q00wcmlZaGZOd1QxR3k0anZD?=
 =?utf-8?B?MmQ3ME9SYk9PSFV5MTIxaEpadDVFNFVxc2UyeWw3OXhhdTVuTUtva2pCRG1h?=
 =?utf-8?Q?4DI8nlPAElQTUDTo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1d5695-a592-4e30-38f3-08da5435d0db
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 09:58:54.1779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByMpwiiwH66EwmdeOnUAaiCfrAkqMfLJYaMlvMgGE+G9EiwgCqWYgPaF//bsE4OpOGIEWg8t2IKzDeJYNZb8hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6004

On Wed, Jun 22, 2022 at 11:33:32AM +0200, Jan Beulich wrote:
> On 22.06.2022 11:09, Roger Pau Monné wrote:
> > On Wed, Jun 22, 2022 at 10:04:19AM +0200, Jan Beulich wrote:
> >> On 16.06.2022 13:31, Roger Pau Monné wrote:
> >>> On Tue, Jun 14, 2022 at 11:45:54AM +0200, Jan Beulich wrote:
> >>>> On 14.06.2022 11:38, Roger Pau Monné wrote:
> >>>>> On Tue, Jun 14, 2022 at 11:13:07AM +0200, Jan Beulich wrote:
> >>>>>> On 14.06.2022 10:32, Roger Pau Monné wrote:
> >>>>>>> On Tue, Jun 14, 2022 at 10:10:03AM +0200, Jan Beulich wrote:
> >>>>>>>> On 14.06.2022 08:52, Roger Pau Monné wrote:
> >>>>>>>>> On Mon, Jun 13, 2022 at 03:56:54PM +0200, Jan Beulich wrote:
> >>>>>>>>>> On 13.06.2022 14:32, Roger Pau Monné wrote:
> >>>>>>>>>>> On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
> >>>>>>>>>>>> On 13.06.2022 11:04, Roger Pau Monné wrote:
> >>>>>>>>>>>>> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
> >>>>>>>>>>>>>> On 13.06.2022 10:21, Roger Pau Monné wrote:
> >>>>>>>>>>>>>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
> >>>>>>>>>>>>>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
> >>>>>>>>>>>>>>>>> Prevent dropping console output from the hardware domain, since it's
> >>>>>>>>>>>>>>>>> likely important to have all the output if the boot fails without
> >>>>>>>>>>>>>>>>> having to resort to sync_console (which also affects the output from
> >>>>>>>>>>>>>>>>> other guests).
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> Do so by pairing the console_serial_puts() with
> >>>>>>>>>>>>>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> While I can see the goal, why would Dom0 output be (effectively) more
> >>>>>>>>>>>>>>>> important than Xen's own one (which isn't "forced")? And with this
> >>>>>>>>>>>>>>>> aiming at boot output only, wouldn't you want to stop the overriding
> >>>>>>>>>>>>>>>> once boot has completed (of which, if I'm not mistaken, we don't
> >>>>>>>>>>>>>>>> really have any signal coming from Dom0)? And even during boot I'm
> >>>>>>>>>>>>>>>> not convinced we'd want to let through everything, but perhaps just
> >>>>>>>>>>>>>>>> Dom0's kernel messages?
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> I normally use sync_console on all the boxes I'm doing dev work, so
> >>>>>>>>>>>>>>> this request is something that come up internally.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Didn't realize Xen output wasn't forced, since we already have rate
> >>>>>>>>>>>>>>> limiting based on log levels I was assuming that non-ratelimited
> >>>>>>>>>>>>>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
> >>>>>>>>>>>>>>> triggered) output shouldn't be rate limited either.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Which would raise the question of why we have log levels for non-guest
> >>>>>>>>>>>>>> messages.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Hm, maybe I'm confused, but I don't see a direct relation between log
> >>>>>>>>>>>>> levels and rate limiting.  If I set log level to WARNING I would
> >>>>>>>>>>>>> expect to not loose _any_ non-guest log messages with level WARNING or
> >>>>>>>>>>>>> above.  It's still useful to have log levels for non-guest messages,
> >>>>>>>>>>>>> since user might want to filter out DEBUG non-guest messages for
> >>>>>>>>>>>>> example.
> >>>>>>>>>>>>
> >>>>>>>>>>>> It was me who was confused, because of the two log-everything variants
> >>>>>>>>>>>> we have (console and serial). You're right that your change is unrelated
> >>>>>>>>>>>> to log levels. However, when there are e.g. many warnings or when an
> >>>>>>>>>>>> admin has lowered the log level, what you (would) do is effectively
> >>>>>>>>>>>> force sync_console mode transiently (for a subset of messages, but
> >>>>>>>>>>>> that's secondary, especially because the "forced" output would still
> >>>>>>>>>>>> be waiting for earlier output to make it out).
> >>>>>>>>>>>
> >>>>>>>>>>> Right, it would have to wait for any previous output on the buffer to
> >>>>>>>>>>> go out first.  In any case we can guarantee that no more output will
> >>>>>>>>>>> be added to the buffer while Xen waits for it to be flushed.
> >>>>>>>>>>>
> >>>>>>>>>>> So for the hardware domain it might make sense to wait for the TX
> >>>>>>>>>>> buffers to be half empty (the current tx_quench logic) by preempting
> >>>>>>>>>>> the hypercall.  That however could cause issues if guests manage to
> >>>>>>>>>>> keep filling the buffer while the hardware domain is being preempted.
> >>>>>>>>>>>
> >>>>>>>>>>> Alternatively we could always reserve half of the buffer for the
> >>>>>>>>>>> hardware domain, and allow it to be preempted while waiting for space
> >>>>>>>>>>> (since it's guaranteed non hardware domains won't be able to steal the
> >>>>>>>>>>> allocation from the hardware domain).
> >>>>>>>>>>
> >>>>>>>>>> Getting complicated it seems. I have to admit that I wonder whether we
> >>>>>>>>>> wouldn't be better off leaving the current logic as is.
> >>>>>>>>>
> >>>>>>>>> Another possible solution (more like a band aid) is to increase the
> >>>>>>>>> buffer size from 4 pages to 8 or 16.  That would likely allow to cope
> >>>>>>>>> fine with the high throughput of boot messages.
> >>>>>>>>
> >>>>>>>> You mean the buffer whose size is controlled by serial_tx_buffer?
> >>>>>>>
> >>>>>>> Yes.
> >>>>>>>
> >>>>>>>> On
> >>>>>>>> large systems one may want to simply make use of the command line
> >>>>>>>> option then; I don't think the built-in default needs changing. Or
> >>>>>>>> if so, then perhaps not statically at build time, but taking into
> >>>>>>>> account system properties (like CPU count).
> >>>>>>>
> >>>>>>> So how about we use:
> >>>>>>>
> >>>>>>> min(16384, ROUNDUP(1024 * num_possible_cpus(), 4096))
> >>>>>>
> >>>>>> That would _reduce_ size on small systems, wouldn't it? Originally
> >>>>>> you were after increasing the default size. But if you had meant
> >>>>>> max(), then I'd fear on very large systems this may grow a little
> >>>>>> too large.
> >>>>>
> >>>>> See previous followup about my mistake of using min() instead of
> >>>>> max().
> >>>>>
> >>>>> On a system with 512 CPUs that would be 512KB, I don't think that's a
> >>>>> lot of memory, specially taking into account that a system with 512
> >>>>> CPUs should have a matching amount of memory I would expect.
> >>>>>
> >>>>> It's true however that I very much doubt we would fill a 512K buffer,
> >>>>> so limiting to 64K might be a sensible starting point?
> >>>>
> >>>> Yeah, 64k could be a value to compromise on. What total size of
> >>>> output have you observed to trigger the making of this patch? Xen
> >>>> alone doesn't even manage to fill 16k on most of my systems ...
> >>>
> >>> I've tried on one of the affected systems now, it's a 8 CPU Kaby Lake
> >>> at 3,5GHz, and manages to fill the buffer while booting Linux.
> >>>
> >>> My proposed formula won't fix this use case, so what about just
> >>> bumping the buffer to 32K by default, which does fix it?
> >>
> >> As said, suitably explained I could also agree with going to 64k. The
> >> question though is in how far 32k, 64k, or ...
> >>
> >>> Or alternatively use the proposed formula, but adjust the buffer to be
> >>> between [32K,64K].
> >>
> >> ... this formula would cover a wide range of contemporary systems.
> >> Without such I can't really see what good a bump would do, as then
> >> many people may still find themselves in need of using the command
> >> line option to put in place a larger buffer.
> > 
> > I'm afraid I don't know how to make progress with this.
> > 
> > The current value is clearly too low for at least one of my systems.
> > I don't think it's feasible for me to propose a value or formula that
> > I can confirm will be suitable for all systems, hence I would suggest
> > increasing the buffer value to 32K as that does fix the problem on
> > that specific system (without claiming it's a value that would suit
> > all setups).
> > 
> > I agree that many people could still find themselves in the need of
> > using the command line option, but I can assure that new buffer value
> > would fix the issue on at least one system, which should be enough as
> > a justification.
> 
> I'm afraid I view this differently. Dealing with individual systems is
> imo not a reason to change a default, when there is a command line
> option to adjust the value in question. And when, at the same time,
> the higher default might cause waste of resources on at least on other
> system. As said before, I'm not going to object to bumping to 32k or
> even 64k, provided this has wider benefit and limited downsides. But
> with a justification of "this fixes one system" I'm not going to ack
> (but also not nak) such a change.

Sorry, I certainly have a different view on this, as I think we should
aim to provide sane defaults that allow for proper functioning of Xen,
unless it turns out those defaults could cause issues on other
systems.  In this case I don't see how bumping the default console
ring from 16K to 32K is going to cause issues elsewhere.

Will prepare a patch to do that and send to the list, in case anyone
else would like to Ack it.

Thanks, Roger.

