Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85862622AB0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 12:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440867.695100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osjO4-0001U8-OP; Wed, 09 Nov 2022 11:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440867.695100; Wed, 09 Nov 2022 11:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osjO4-0001RQ-LQ; Wed, 09 Nov 2022 11:36:56 +0000
Received: by outflank-mailman (input) for mailman id 440867;
 Wed, 09 Nov 2022 11:36:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNAf=3J=citrix.com=prvs=30523791d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1osjO2-0001R1-Up
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 11:36:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd359552-6022-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 12:36:52 +0100 (CET)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 06:36:45 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6511.namprd03.prod.outlook.com (2603:10b6:510:b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 11:36:43 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.025; Wed, 9 Nov 2022
 11:36:43 +0000
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
X-Inumbo-ID: cd359552-6022-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667993812;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=22+WF+03jPMOsvy6F2jFsJNfScoE6APDhnp9gn+qjXo=;
  b=N7XsXlfVa9e9mujXMYTf69ASE25KolCI5OeyzrQuYnXnMnEujIbUN5ue
   hlTMEiUbrLTFdELoR7odDJ6IjYcgLPbUh2AQCWaYW+H/HLnkxISTBga/b
   S4NEaLpnFgCA1SiJDaigE0rUaSSZ4hzCYaVnajC4wm+FS1tGSDWJqHxJl
   8=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 87000645
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hmRZIq8qu/zZZj6jyG6GDrUDs3+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 zdKX2zTbvaNazGheo0kbovi905TscDRztMxHQs6+388E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKga5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklU7
 PMBCiAJcim/nuPqx7+HZ9dQvs48eZyD0IM34hmMzBn/JNN/GNXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilUvgdABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+QxXujBt5PfFG+3sRHh1Kt5TIeM0IfeBiHuOaIu0ruQM0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwCGAzLDFpTmQAGcsRyRELtchsaceWjgCx
 lKP2dTzClRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85i8jVf5mGa+xy9HwRzf5x
 mnTqDBk3utCy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:YyeiA6ByzsvNuF3lHekp55DYdb4zR+YMi2TDt3oadfU1SL37qy
 nAppgmPHPP5wr5O0tQ+uxoWpPgfZq0z/ccjLX5VY3IYOCMgguVxe9Zg7cLw1fbalXDHuw279
 YaT0CpYueAd2STjqzBkXSF+85L+qjjzImYwd3w4l0odg1xdrph5RoRMHfmLqVxLjM2YaYRJd
 6nyedsgSGvQngTZtTTPAh9Y8Hz4+flubjcbRsPFzYr5RLmt0LW1JfKVyK28z0kXzZG0Y4l6n
 WtqX2G2oyT98uV5zXg8lW71eUmpDOwouEzY/Blk6IuW1PRtjo=
X-IronPort-AV: E=Sophos;i="5.96,150,1665460800"; 
   d="scan'208";a="87000645"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXOxOON1YBMz9+7nRqmKIg0bcvYaYp8CVK2vO6mOgVOjSAfnVPxXGZHoPMswO9aWOiIAirLqcBNK27qfFWRqAKGl5WRM58XgHej3n4ZZVra3zrFCuMXWcnnWeM8cpT+JCIOoWAlApzYVRRQD6Rp3eSrRVsuSrcFQZgkpWW3qDjEi4E4KAuK3eAiWnnIFNKPtfxEKUcKTXysO7blmSBW9GlZOFamzrbYTUbpbiNjC6XYS2905wQQWuUaWUg8BxYbPiWwYGgKHksoeh15oflrHsspdKtNmke6oT6uyHzSA/EEaN6uVCxycE8g7fzwbtsTz9MIYg82waunUsDTzjYUhSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QERGUx8m5H+C4Omw+Dd2zraCUltqFgWBQDjjoKeUHEw=;
 b=J0b+UBpM6bG3mmom2IMQxKpcz/2ylwPTs85BhMcemMhgWZtk68lU7b8RrDKMoRO/akS5o034wXv314UfbUFhzVYJAnMtS2wJeWMVSDiVFEEG5iDSxtv4nasqaagyazfn4WMRzcYbnY8h7auK2NuooBlTkqVExOZrejMrIVOaAxSUE/LQwMJIA48lVt0mxQx/30O4wee+q4ku0AYdeHtuQjcoN45f4Nck5rOojEve2BanVIMPwZWxcePV6cSy48FsPnhdZAIRgHhtOqC8ZFdNPPKQRmPFd4VCvUIPVJqq8zyz5jwdBsH8z3/wNxIe/E7Ea9jm3aulh0YtYkhN5MgMZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QERGUx8m5H+C4Omw+Dd2zraCUltqFgWBQDjjoKeUHEw=;
 b=Sa45vSY0t4oW8+8bUDD4txChcfSLXG2decKCsYzh057KD50R3dowJDomBVSOqxv5BwzOnYhmWS/eKJW5MlobdOzrY6N0ChNYl980to5YYzQQJ4UtwGVzDRqQIk0lLMzYo9/rYXKlWN0vslNC94WQBdan87b9Bq2Q8MotH4tejFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 9 Nov 2022 12:36:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Edwin =?utf-8?B?VMO2csO2aw==?= <edvin.torok@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Message-ID: <Y2uQxiykG0+Jt7Az@Air-de-Roger>
References: <20221108113850.61619-1-roger.pau@citrix.com>
 <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
 <Y2qHOfemg/wrc07N@Air-de-Roger>
 <58d5e890-e052-47df-42bb-6cc84aedd4a9@suse.com>
 <Y2qOtSyuM43RfwAx@Air-de-Roger>
 <76cde159-088a-3351-56e2-0cf14e9c8116@suse.com>
 <Y2t87YE5acLfiClF@Air-de-Roger>
 <afbc37a1-99cb-ea09-575e-dc6448cd6f92@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afbc37a1-99cb-ea09-575e-dc6448cd6f92@suse.com>
X-ClientProxiedBy: LO4P123CA0655.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::9) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: 713d7754-2f0f-4dd8-46f8-08dac246ad0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7c9ajieYlfonepzJqjywiYZUjMuj5yPy3pqpM/BlqI7YJPRKtSV8OcaQG1HmTU42+jRdsAE550vfkks1oCfwcsSFlhqLc75DgGA3wXqn4cUkMAv5QH6OTND6V6n2JglKEQZ2YhXiR5lTYuFJVX54rxgkjojXszv+sEEX4idVqmNU845MhSMr09Pitk1kCRHaAXtHB2XQPlYGGf2HUwD6HtqMaRbwi8TzDFvlok71q6kPhMcTqPsQeHAXr62pctqroygyzTerf9rerK+0WarqpvYAO6ldgmgwR+uA8CDAiS0Jf1aaCFqg/SBLFs2u08jmsEGQiENGn2wLJBtf8aPrX0UIAUcBik7aeP7nm4C8L64QIcpc+kt5g0XXKgWUr/flVRssMADVrimq5cTrrkKJyPOLstPHmrZbRQHrMklzxYFFN8iinReEl66GwK5kSbjIQBEFYtYOezJeUQKmrezAT3B3WNFdzIPmE8Y/wWiKG1onJALbFplJSaAWEwapJjTM9c4S/XKUNLYomNi0Nsetk6Y7fcgsm3dYVX8TAZfqTyMYk+TtBsmFMn7wzPZmUqXS9ux+91zwGrSfmAdnIUAllCT2QZTe2r6++2YjvEtMkRhWUqhRZKW6Hvq92cnZYPBT1z3BLr07txjdrht+KcojZhK8t8WNxMEPfVgGCATtba6AEm9mOCgA3P+i7qFVfXOBrbX74cGP836Q2HpMzHntnf85cPOLlOf8TmLcVIpgOFYjyGg3/CND/RCxqMohJ94Njf0z3YzRXqv6FZbrJZIumg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199015)(6506007)(9686003)(26005)(83380400001)(6512007)(53546011)(6916009)(38100700002)(82960400001)(186003)(5660300002)(2906002)(54906003)(33716001)(6666004)(8936002)(4326008)(41300700001)(6486002)(478600001)(8676002)(66556008)(66476007)(316002)(66946007)(85182001)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0luaW4wU1VGUTFPUktvS2tYMzZwRFpZN3h6dHlWa3dMMXhNZEdpRWJaSVRN?=
 =?utf-8?B?bEwvb01tcGx4dVprNGtnY0dJS3ZHZ3NKb0ZpRmgyR1c1Vmo4RkhKNW9rYWdY?=
 =?utf-8?B?anNxYjV6ZXpDcllnTmxHbWpIZCsxVkhCS21yWE96YzZPUTNMM2p0S1pvNHFD?=
 =?utf-8?B?V25BT3J4OWNkK1BiYTQ3T0lycCszNy9kVlVHNUZJTVNPQ2daVGRpUmk4T1JF?=
 =?utf-8?B?cWtWbHI1OW5lRTk0cUhFajVrck9PU3RBRjZVYldFcjFvNzlZbkhVSG5JNTZz?=
 =?utf-8?B?TmozYThLRmdnVE5UYXI4dUduZnJvUnhhWGlIeU9PNWxoZmFySFJQZjJ5Ri9y?=
 =?utf-8?B?YlJVY2ZzanVSd1RiTjU5ZVEzOU1sZ3dPemJxVmxaamtKRWM4QWJDMUx1eTNj?=
 =?utf-8?B?MEM5UXViL0xuckVCQ2pvZE52eXlnR3FYbnZPTFlMbS9xdm5lL3J4MG1yVE5r?=
 =?utf-8?B?eU9WSy9COWdCNVJQZTdUQ25yYzFTVy8vdVJ3ejh3VkN6d2tncjlDRFFLWnlU?=
 =?utf-8?B?Y1R6bG9LdXhTWUhjcktnR21LOHh4T1dZenN6SHkvS1hENTFPS2hwMFRJVkkw?=
 =?utf-8?B?NU1SeU1tVytqOGtRQTEwOXBUMkFYMUdPbFJNY2N6MmpYcWk3d2J2dWxPTFBr?=
 =?utf-8?B?VnBodFl3dEtlRm9RUzdmd284MTFOdEgzbFFCWkNoVEhEUzhJbDYybVpTcmQx?=
 =?utf-8?B?Z2lEVDRFZitIUDNoTEJQNCswcG5IWUhUUlhWZ2UvNFNQYmNwUW5EdjNybXhs?=
 =?utf-8?B?YjlVQ0s4U08rVmNBajJMZWJReU01RGpLK1VCbE1PTDc2R0JzQXJvaHN5WU93?=
 =?utf-8?B?TU9yNW8vb0NINE5JeWlPM3NtSWVTV29WR1psYXVpODI4YjZ1a00yeDBuaTBv?=
 =?utf-8?B?RVBaUU1QZkZlc2piTU1wSlIwM2Y2aElpMkxveGdSYzV3dHY3YlovaUMzZzc0?=
 =?utf-8?B?bWtsZ2RNREpzaUdxZnd0ZnYvdk0vQnpUQnBLSHlHaDdaL1pmUThoa2ZEelFZ?=
 =?utf-8?B?UDlmNGlhWWhyWlp0MURWQWFuL3VxWEpDMzNRcFRRQmc0OVFyekZua2xieFEz?=
 =?utf-8?B?WHAwS3cyS0o0eEFDcWdjV3VTM09GaitKa0JBWVNDeEZUdFZlOHdKWUhXTmo0?=
 =?utf-8?B?NS9rOUxwQThaTStqYmFBSVAraWtqRGdRYTdtWjVUZ0pKaVJKWHBIMWJxZzA1?=
 =?utf-8?B?RzRjc3d6OWppUGJxNjZYZjIzTVNNUFUrREVtZEdJVWl1b29OTzZJUUpLTldF?=
 =?utf-8?B?d2JnYm8zK20yMW9nUXd4ZnhhYmxZd016Y0p6dHNpczNIYW55Qm1ldlE2UGxl?=
 =?utf-8?B?RzZXbDBPdGxNMlMyNlMvb0E2OXFjbEJwczZZYjFWa1JWQ3dkOUtPbzJLTGhv?=
 =?utf-8?B?aVFqWVpBM3JXc3F0YXIrc1BsSEE3YkhqcjVaNXN2T0UxS0llTHMrT2ErdmU5?=
 =?utf-8?B?VWJ2ZmNXM2NkTlh5eDFyN3VOQ1VvQmZGVzdYQmdPYVRjNXZDZGxPRkZOTUtH?=
 =?utf-8?B?S3Zhd3BpRElWNVhRck50OFQyU2FkZUNoc01jZkd1S1FPM0F2SUhxTVRCV0JR?=
 =?utf-8?B?RFVMczBHekowMENWUWZKbVMwQXBWRm9QWDg4YWtXdnpZVjdPQTQ0N1IzeUZM?=
 =?utf-8?B?T3RydFIwcm1WQmw3YmpzZmxuTEtwMnhVYnArR1BTSmd6TVJ2aW11SGx5cWhi?=
 =?utf-8?B?MzYxelIzSTk1eS82Z2xGWnFSZ1ZEdGYzTy8reVlIZHY1T2NiQU1xTGczcjdP?=
 =?utf-8?B?cFpEcEptVHF2eUtxMlpGUUswNHJwNlk1RVJTMEVyMW9VUThxSUJQUmFIZ3Nk?=
 =?utf-8?B?UFBzYWJ2RVg3bGVackQzR3NwT2I1NWVpajB1SUwwR0NRNVFucHJvV0pXQmU5?=
 =?utf-8?B?WjZDZGtpeHhrcUdnYWFRb3h5TmlHY3pTN1NOUkNCMnRyUDBxRkt0UUlQYnFX?=
 =?utf-8?B?Wjk2VVdZZ3RZZ0JvZFlpTlFBYjA2NVYrUmFWV1hwSXQ3YnZvQkNYUTBseC9v?=
 =?utf-8?B?TFpaZURNMDhncjBsd3ZKOGp6Y2ppTzZDNzBTTVUxTXBteWtOcUoyQ2prK1lM?=
 =?utf-8?B?Mlk3V0V6S09pM255Wlg2dE5xdXB3eis4SkFmZjN4TXRXNEpSV00xeVFUQk5R?=
 =?utf-8?B?ZkdmUHl6Q1Y2eFBBU3pFc010dXV6U0JtWTJncWhWOU9Tai9ycmZPb3NtRTF3?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713d7754-2f0f-4dd8-46f8-08dac246ad0c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 11:36:43.5452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nr7HfpDnBF9WIccPKd53mNCR7ZpGVWYCwG07RvGZg8UILOT9GjAedSAHGjbJfVVJCALgiTRIyxvxQnv7Qse3jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6511

On Wed, Nov 09, 2022 at 11:23:01AM +0100, Jan Beulich wrote:
> On 09.11.2022 11:11, Roger Pau Monné wrote:
> > On Wed, Nov 09, 2022 at 08:48:46AM +0100, Jan Beulich wrote:
> >> Finally I'm not convinced of the usefulness of this dying check in the
> >> first place: is_dying may become set immediately after the check was
> >> done.
> > 
> > While strictly true, this code is executed with the domain lock held,
> > so while is_dying might change, domain_kill() won't make progress
> > because of the barrier on the domain lock just after setting is_dying.
> 
> I guess I'm confused now: This code is called with the domctl lock
> held, which - as said before - is a questionable thing, for serializing
> things more than necessary as well as for holding this lock for
> excessive periods of time. IOW I consider it wrong to depend on that
> in paging_domctl() to synchronize against domain_kill(). Yet indeed that
> should eliminate races at present.

Right, both are domctls.  There are other places where is_dying get
set as part of failures in the domain create paths, but then the
paging domctl failing would be natural, as the domain is being
destroyed as part of a failed domain create.

Since I don't see replies to my other comments, do you agree on
returning an error then?

Thanks, Roger.

