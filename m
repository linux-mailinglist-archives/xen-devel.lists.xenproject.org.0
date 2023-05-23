Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B89D70DB0E
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 13:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538415.838338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1PkS-0002eJ-6k; Tue, 23 May 2023 11:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538415.838338; Tue, 23 May 2023 11:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1PkS-0002cc-39; Tue, 23 May 2023 11:00:12 +0000
Received: by outflank-mailman (input) for mailman id 538415;
 Tue, 23 May 2023 11:00:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YHTC=BM=citrix.com=prvs=500ef747c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q1PkQ-0002cU-Dt
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 11:00:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f96e7451-f958-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 13:00:08 +0200 (CEST)
Received: from mail-dm3nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2023 06:59:59 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN7PR03MB7132.namprd03.prod.outlook.com (2603:10b6:806:352::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 10:59:56 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 10:59:56 +0000
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
X-Inumbo-ID: f96e7451-f958-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684839608;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QASePHSTrMv7/KOl6YpulxDw6XcjQASsOTUOoT4aOog=;
  b=Lq8plXSpd91KYF1ks98sbRJEw/AIFyorDVKUAHfH3dM8UZsAXZ4pct+x
   FS3OMf6m8s1vvADlnjfG9F6FuAxSfVujM4tV57g6y14uTm+U/L81PsuQp
   1ZZAMYQEpaT3l6jEQNpcfBsrL27lrIfQXtK8siZdZP+qF6JBWAF5ZRKzI
   w=;
X-IronPort-RemoteIP: 104.47.56.46
X-IronPort-MID: 112519965
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yhS/yKjcdF0MWQBuNp52ETjBX161jBEKZh0ujC45NGQN5FlHY01je
 htvDGCDP/reZGfzKth/a97l8h9S6JLdmt5kGVBkrihjFC8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4QWFzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ4CmEHTBWOgtumg/WjS+ZNrZQJPvfSadZ3VnFIlVk1DN4AaLWbGeDmwIQd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluSzWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqhBdtDRePlnhJsqGfJ52xLMBMraQf4mcC5rHCuZ+MAe
 1NBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHLpYgpixvVQ9VLEairj8b0EzX93
 zCLqiclg7wZy8UM0s2T7V3BgjvqvJHGTwc57wbQQ0qs6w8/b4mgD7FE8nDe5PdEaYqcFV+Iu
 SBen9DEtLxQS5aQiCaKXeMBWqmz4OqIOyHdhlgpGIQ98zOq+DioeoU4DCxCGXqF+/0sIVfBC
 HI/cysKjHOPFBNGtZNKXr8=
IronPort-HdrOrdr: A9a23:hqAyzqoOgYK7QIC0lobqO78aV5rbeYIsimQD101hICG9Evb0qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2Ki7GC/9SJIUbDH4VmpM
 VdmsZFaOEYdmIK6voT4GODYqodKNvsytHWuQ8JpU0dMz2DaMtbnnZE4h7wKDwReOHfb6BJbq
 Z14KB81kOdUEVSVOuXLF8fUdPOotXa/aiWHCLvV3YcmXGzZSrD0s+ALySl
X-Talos-CUID: 9a23:iaOapmymHK2hEcq1eKjWBgU0OJEvUHjQyU7AYAigCGlIY+2/W2GprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3ALU9nAgySTfbUi6VtSoGqmGsKbvKaqJ70KUBVqZs?=
 =?us-ascii?q?7h5XHDRVwHQmNsAXoEpByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="112519965"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijHgPNX8r9bgClz6UbkzA5Xx1RA2VL1+nJmAS2r+WyHqWb6VoOnl6Om4cS1rxSa8dwp3IQGDLkKilW4k50mGuhy65vhp5CsSWeki+yHtfNxrCx683xJ0DD65d7cWId69yR/op+n+SFqU2KLUaAq9JS1sSAo5X+KhmS/bNvrJp9aSyZ7/t/PhF87eT5WziYqY9kRz9lQ3Vubi0c/0Xj9ks6KqF0SKCtcjjK47ucac1waFXNxx3pNYQAc7TrP6Br7O3T52xygBIMBxDhCXL1iiHBSGCb6WQf/Z0jhpgi2Ncdn1a0BQLTQtDkyU7wXEpWqWj4TzdPpm4jK7uJjCkbOwKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtYrYjSQ21RavIziIh1mIxcGPRwDCU5VsbbaVOKXO28=;
 b=YjE9Khzh6OxvVlJetn1GsB1ofJR/M0g/D1ZUsKb1Dmn5wGe5JwnUMPaCJmS8Yu27j0UdmqC736ZAf/65aUB/b0EZMVPlgColy9PNW7czulU9niILBfbJymd8ziQdsaV3/Ziklj4lWd4WrbUCENVIzIv0dCwr/fmL7wg01qf7i3B88neEMrnajo2P8Rv4w4c0mFsR3OhEa/CmO9aoJhjVeeF3VEAMJ5BbdgwTMUohx99m4yccqXmKfNkoZSMmm12xsDcEKZ5Glx5zXfEf6oiVB45RnDvm19VKXIobatMUJrBnrrDCkFIhTUgEIiH6fLoFPlYuLKRTj3ReGgf69EZA9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtYrYjSQ21RavIziIh1mIxcGPRwDCU5VsbbaVOKXO28=;
 b=PUJVb2SxdTHwiEeM+VZxsHtHz5XXimyPZ/iN+/I90enT6LK/tD2N0b7rhwsHsI563Qfi+O4BRRUtAm3wyBbuNBRvSjuadz7QywURx4aga/f/bj9tHdrKjq3tt7WSOuPUkTr+VXxal/wCRl7hADbEV+Lhagfgp7fntp6F89ygt2Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 23 May 2023 12:59:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
	xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure
Message-ID: <ZGycpaCkSvWecsuE@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop>
 <ZGcu7EWW1cuNjwDA@Air-de-Roger>
 <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>
 <ZGig68UTddfEwR6P@Air-de-Roger>
 <alpine.DEB.2.22.394.2305221520350.1553709@ubuntu-linux-20-04-desktop>
 <818859a6-883a-81c0-1222-84c62ada3200@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <818859a6-883a-81c0-1222-84c62ada3200@suse.com>
X-ClientProxiedBy: LO6P123CA0058.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN7PR03MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5f1a92-2b5e-49bc-e8ff-08db5b7cd7db
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ysO21nXO4/KyPeojWGNXs23tayWctgyW04EpcQlRmcY+dheLxlgEA25J5gJQfC55iT3+cnSpIdEf74ICRpJNh3fEGr1iIgtPut/qfGdY+FURa2yWuj/fSzdXXYRhEF2jt/IXNB/kJvJYTnojyk2eQXD9JC3KyAohw/13gV5sISle2lMpUNjeN6lME3s2AkGwqlFsaK2TibKmqapw8E0avfB/X5pQcgPDLIYY6+SkMpBugBh//ZccKNaTnTpZSPjNqySzfNP5vNLg+DyK8ezs8RYwb+UVZYtPkuiGYBftnEMe/tc2x7Q3gQs0Ch9HEJU+AfVlam9kwQ0ohVtpcwR13YfdKoxIF98N93bdkRxhZL+vvz6yBaU/dRrsieATklE5ApBwpdINSeYuKskd04qfeZcYfWPStHCOvJgNxYrhvvxzd31Oe3M/6Qjc9nfEFRhizwOZ2R+THQyydIf9NyYh4+JVEMsMetR+HeOHhzzyGdCz0kZOLvwZbmnaPchvjhD5T7NNfbm0tsxFhQhZINMbQKJOjjkTWnxrXhhhNhTej9k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(8936002)(8676002)(5660300002)(33716001)(186003)(53546011)(83380400001)(9686003)(6506007)(26005)(86362001)(6512007)(38100700002)(82960400001)(41300700001)(6666004)(6486002)(966005)(66556008)(66476007)(66946007)(85182001)(316002)(4326008)(6916009)(478600001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHNwZ0plQmFoMTRNakxTL3VDWjZhNkViRlFLRWFjVDRTY1MzSlFrMzFXTEp4?=
 =?utf-8?B?MzJCVjFGY2xUL3lRaTJ2Rm1Ua1I5ZEV1QytaNWZUUjBTb1phWFBXbmptcWRK?=
 =?utf-8?B?bjhBbEkxSFpieHRIQWdyT0J4NFBIRmNqbXFLeGxsazY5MklSL0VMZm1wYWcz?=
 =?utf-8?B?LzlZNGluVlh1c0hKQUxuN09NTzFhMCttWkg4ajJLQkJ1NkwxK2FHMEY4cW1G?=
 =?utf-8?B?aHBXcHFUOU91cG9aclNBTzQ2aFBUUEdmS1B4elZhYnVRN01pZUl6czlURzhN?=
 =?utf-8?B?clhHc2svUTVadDhZbklzdExqcS8razZDU1JFMngxZjNodGlodHlZRlNiWEdE?=
 =?utf-8?B?bDNRb1B5OERKUHgrU285VVZ0bUpPYnZST2lqQ2FCU3czd1czNWF3bXNGRkZR?=
 =?utf-8?B?OGFrRDZ1ZEs4TzlsbEVMSHo1NU1Cd3ZRQlVtcXpyckVkaWZ2cmZIY1FlQXAv?=
 =?utf-8?B?U1hwZTN3SlYyb29jRFh0SEFvZHVhaFJXZ1NicEdFMUExcUJGOEl1MU8vZVhY?=
 =?utf-8?B?dG1maWFBSEEvRGlCRWxGVTBuU251dm9ZSVdYUEExdU10dFJBdE55YTZ0eU1S?=
 =?utf-8?B?UWhHOGlsN1VuejBYMzdrMVV4NUFmRlBORENoMEdSWE9hRGtJSithM1lKVUVS?=
 =?utf-8?B?VTh0YStTNjlDUTJqdGdlSUNJYlhacjlCRHhHWHFHbzN5TFM1L0tiVTNsLy83?=
 =?utf-8?B?akRuUWpQYlAvYVNKWmtta3NiRSttbW1qcnZpWXorcCthVER2SWoyV3lldS9q?=
 =?utf-8?B?ampzMG1YZUpnY1NaUzdldFI5MHdDTE1YUFJLNjNKQW9HUUdITkFlbUhjVzRH?=
 =?utf-8?B?eXVjYmkvMUtGbThuZ1NsT3hzaVNIdUhaeFRKeEpZN2gwcDF0c1d0ODZuajNy?=
 =?utf-8?B?aGpMVlNTUEpUKytKaWFSaFRXcXNqR0k5VEUwS29ibjVnamdTNzB5MjFuYWNO?=
 =?utf-8?B?cWRmRzhkTGJvQm1VTzlqRnFTZFhZaHBOWDVTV0VhQ3loQlZaejVNVXVTU3dM?=
 =?utf-8?B?ajAzajRsem1SY3FJVjdUUzBMdnRDMmM3b3lHK2FxSklxdEE4RTRvTnZGbmhj?=
 =?utf-8?B?cXR3cEQwV3BhdDdqK3dmcGtCdHNNTnkzQVFBbmNTeEtEWmJ0UnhPM1RNRDds?=
 =?utf-8?B?MlBZWVBiSEYwSVl3N0VNQnRENVpUWTRFYmNMejhRMUdwZzRQWjVuYU8rTFlj?=
 =?utf-8?B?TG9aL2IycWZJUHJhZGI4TDZwbXgwSTlHWWMyUzZ5ZmVtQjIvbzVOallDcXpF?=
 =?utf-8?B?QnphTmRRY0RYZUh5S0xxdXpZZUZDa2dMa2NCS1ZMblZYRGo4UW4vNU5EM0Zi?=
 =?utf-8?B?eWZQaGhJdXltQStiL0lkcmFYTFlvZUVwcmUrTGh1NUFHejdHai82ZWt6SU1W?=
 =?utf-8?B?ZngvZGdVekd1RGJDRjRqK1BpejRLdzFORUptdWlLdjVnay9LSk5NZkxPMmRZ?=
 =?utf-8?B?Zkx6aTZPTGFKZWFIOWxON25uUUUxOTZHZGtjTkN5SklsZG1EYXBkZ29aYURH?=
 =?utf-8?B?Y2lwNjFJbW1OV2NPTFhPZmJ2RnpwZWx1bk43eFArYWtCRG5XY0xEZXByN2hP?=
 =?utf-8?B?US9iUUhFV2N6Tno5Z2VQYk4rTnFzQStXYVFzWWhRNW9kWnFlZW9LUC9WaUwv?=
 =?utf-8?B?ckVQTC9QYW0zek9hVzhDdVFRL1pIenVLMFRjcVhkT1BXQUVkTW9FU0FMeGRZ?=
 =?utf-8?B?R2hDYWRwdXVZbElYVmQzNStpNEJHSlI5ZVFOMEdIZGtsOHd0R3lRU29tVGJY?=
 =?utf-8?B?OWtoUmRaMDRodVcwNTRYclcvNTBqQ3BUWUhmUXRBWVpwOHByY2VTcnFSZjRl?=
 =?utf-8?B?Wjc2cEhUZEtOYVJQY0VGOW9jaHFNOGtSK09UclFtR0wzVmF2UUNBbjBWakVr?=
 =?utf-8?B?bUhiTjEyZDY4WEh3U2NqckJONk56TmdPNFQ0ZTZ1Q2R6ejV4S3RwRm9sdUNr?=
 =?utf-8?B?aUM3TDU5aVJKUW93aEVZbUFYQ2lnb3FMekZoUTM5UXhsbmtUTDV3a0VYeHFM?=
 =?utf-8?B?c2hxeHpTZ1B1TG9PaUZXQzNuNFVLT3VSNkY5ZGdZVktWQzVkdFVJN0ZrbnNJ?=
 =?utf-8?B?K21sb2MvMXJMc1h4ZFFaY0p1Z2swUkhqRUszZHVNeGRlZDFMaGRTSFBzSWo3?=
 =?utf-8?Q?WNvYW5BkR/kuaKBeibaAR8gFR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GRVmJY/nXBw7Dnox6L7Mj1eGQJaA6GDoLRB+6BhauU9By3X1okeezD/HcyjPFwza6OsKPc+CHeVOXMbJMO+hjRF5BIS7/YatcrX/X/NeGpzgK8KCwb4Bbof6RPg6CNZf398GRt4NeWAh/bAmWPesfrJqsalpKGRqyl3yEIYyn0ikLYMLxQK5zXHoK2uUA80QmCzrtEsFBwE7EUMvIMQsk33+w1jXSKior1uwVzGlgdp86GZCbCDIRjyS3f/tGAoXuTYYDbMLjV+osZ4n/kZTHURWdpQBogYACLe8O4sPs6J15GYVkQxjqNyq1/9w1A2nHMHK9bxydpFhYB66gwVKmI/bu2uPFL7QZbLMxEsJ4rGlZAU2q8Bu7yOKTuAFxbPYlczFeX7k5hBPyVzLxwcfZ+IU5451OjgYZj/veMkvei5t+BLb7YwX6BKV0Fcpz9SSqPuGq/hIY+DgEgTPjxWG97akBclBa0l1mMH+/NS7+61mYDGC5qhKizv2Gp90LkZySMkbZlxcAOTQAfAyGpcGW57EuW4PGAhGYbgYecY600A0/LnTjDvpvYGaYRKm6afUQ4wDkYfUl28HXNwqomn7VsGvbFUpn3/gjRtyyrYG5Q9WHAghxpLflGTGRoLQdVzHdvd2UD82rqzuBZZNw18XvmA2s2bULmARut4z3xY1l9ZkcdXBHLKcqnHmofYb3PAbsFrR6qOjf76zFOPLDNxBRYUB5Ugcy+ZWhnb8az3uTKhqSoBMn6AQjWuNNH1Kp97jNZwuMpE0m3Z80nefEFhCrspzrLqyG4ooLr+1mWNUKnKuVJ0KFmEuRKyHZg8xBxvA69B1Jq2qLFuEPgBq2tEOPkQG6VSb9inD6LbbKiyUBXJvzXOwhapRefiPA4qLvSwBGx6H6/eRzQnc8ly6Nn7/pMvGaC4Mad9GAHButmyJAVQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5f1a92-2b5e-49bc-e8ff-08db5b7cd7db
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 10:59:56.2086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzDhX2kwXe6OiFuX0onEkXcayLJueturpBIpoKqlaPBLO4gusP51C7t2KBI2zD88JIA+14WpCSA+uIvPqvOR4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7132

On Tue, May 23, 2023 at 08:44:48AM +0200, Jan Beulich wrote:
> On 23.05.2023 00:20, Stefano Stabellini wrote:
> > On Sat, 20 May 2023, Roger Pau Monné wrote:
> >> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >> index ec2e978a4e6b..0ff8e940fa8d 100644
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -289,6 +289,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>       */
> >>      for_each_pdev ( pdev->domain, tmp )
> >>      {
> >> +        if ( !tmp->vpci )
> >> +        {
> >> +            printk(XENLOG_G_WARNING "%pp: not handled by vPCI for %pd\n",
> >> +                   &tmp->sbdf, pdev->domain);
> >> +            continue;
> >> +        }
> >> +
> >>          if ( tmp == pdev )
> >>          {
> >>              /*
> >> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> >> index 652807a4a454..0baef3a8d3a1 100644
> >> --- a/xen/drivers/vpci/vpci.c
> >> +++ b/xen/drivers/vpci/vpci.c
> >> @@ -72,7 +72,12 @@ int vpci_add_handlers(struct pci_dev *pdev)
> >>      unsigned int i;
> >>      int rc = 0;
> >>  
> >> -    if ( !has_vpci(pdev->domain) )
> >> +    if ( !has_vpci(pdev->domain) ||
> >> +         /*
> >> +          * Ignore RO and hidden devices, those are in use by Xen and vPCI
> >> +          * won't work on them.
> >> +          */
> >> +         pci_get_pdev(dom_xen, pdev->sbdf) )
> >>          return 0;
> >>  
> >>      /* We should not get here twice for the same device. */
> > 
> > 
> > Now this patch works! Thank you!! :-)
> > 
> > You can check the full logs here
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/4329259080
> > 
> > Is the patch ready to be upstreamed aside from the commit message?
> 
> I don't think so. vPCI ought to work on "r/o" devices. Out of curiosity,
> have you also tried my (hackish and hence RFC) patch [1]?

For r/o devices there should be no need of vPCI handlers, reading the
config space of such devices can be done directly.

There's some work to be done for hidden devices, as for those dom0 has
write access to the config space and thus needs vPCI to be setup
properly.

The change to modify_bars() in order to handle devices without vpci
populated is a bugfix, as it's already possible to have devices
assigned to a domain that don't have vpci setup, if the call to
vpci_add_handlers() in setup_one_hwdom_device() fails.  That one could
go in separately of the rest of the work in order to enable support
for hidden devices.

Roger.

