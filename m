Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD38313010
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 12:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82776.153010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l94Mb-0004Zo-Ab; Mon, 08 Feb 2021 11:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82776.153010; Mon, 08 Feb 2021 11:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l94Mb-0004ZO-63; Mon, 08 Feb 2021 11:05:53 +0000
Received: by outflank-mailman (input) for mailman id 82776;
 Mon, 08 Feb 2021 11:05:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atCq=HK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l94MZ-0004ZJ-8j
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 11:05:51 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b29e3542-7869-4427-8a03-0d00da53cdb1;
 Mon, 08 Feb 2021 11:05:49 +0000 (UTC)
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
X-Inumbo-ID: b29e3542-7869-4427-8a03-0d00da53cdb1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612782349;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VxIMKn8BEn8PkuVawNQPMLCTsYD0TLzmAval7+CvIU8=;
  b=L2VW+06jQTDPsR62dS6IU8rsG3upNnpTqs2ciLF9P6bK7OjrIFwUw0mQ
   5kugm6KRLbTsZM2uAib4VpGQv4+RX5VPtlqdpdF2VV6qhQ8uMFzF4uSA+
   EsJp6ywi9BLgcmFSkhfS+P9JyHK6eJZiHUm0uJjoCm/XHLiZ0M/XAaQWQ
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +nmeD25TcU2eDIDgaesTGb1/7y81d03nUpgr/1MyDGqCPZPg+0iniLeS5mDuc3/8rF1DWNHgYw
 SuPjM/qWS05bIBng04GYsnAMaPipYZ8QW7zhm+PJhCs8rR7v8X0aApd+Sm9kH5ZPypBe3frlTA
 klSfzLxHUHLf1s9OxO+eu3cJccSYYllbqHH/R/64v32E37mx6FxtbZuDIglMMMczhqeQnEKBbO
 ctZj/eya6BRsYkcZHt0Gd7COVqsWMPdpeqC0MErl4MfIqRyoaoTjBx4B9uVQmGr8UZlSfOJRZA
 kw8=
X-SBRS: 5.2
X-MesageID: 36958995
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,161,1610427600"; 
   d="scan'208";a="36958995"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0c2Ee6PAPeZolxy6zBoEl3gzn+X91p9HhJkaCVKqPZFDrmL4cPYFeocm/yqbfGkEk4TCPD6jkqWMb3WA+vHRJL947PsvqnbOC2mTHibR/0R9WBfagKU52RcsogAsZuGc2d6TkbSY39Urz7U2z78oCfO/WdvHsI5i3V4nDPjv4prst8fwFEoXnyvJpqn7ZJkny7aQAJg0yc+HLdd9ppdrN3Mq7X+zIyYD8P+YYinDcOqKJlsqb8FaVKoIxzcnnmK31ExC2uEcbGUmr3UiTISNmBJrXkZKSMNaXK7Z2E/OAmIUzefAC9yYky69gAT2vgthmFhtpgtw76g3hqSqedCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQSxXtlHwovMKOHuGQ7hP9hhPtSNIV81Egw7e+KD0M4=;
 b=jnnlYuc8sWzQ4NchX+gOGsO3ToEL0Ib+sFCePwt4MAzvToe2k4gKDRhqU5PUI678qUtRUdceTLVx6qOzYGKHGt37bgugQd4puVsqOEtJAV7OalzKBGQrEA9lFZgCzVjaix5jbvUJJQkJpzVysEJ0c3EqBK+op4HNWcUtp9K6XUVFPuy49BAmZIpwcNGrPYSpZM2TLp4FpRzrTrZcQjHHOpIv8EGs1E/ZnXj9IUCSKXNKHzYVCRwSnjKXNLuZC5ICv/A92onxokoL1L3K5kbE9sEbjNNUhJcjYIe1nH00m5PNiG40YGKMheTGpLtWNJZrRAddPoCx7s1gzsC/dqJ3yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQSxXtlHwovMKOHuGQ7hP9hhPtSNIV81Egw7e+KD0M4=;
 b=DgVIVF7vFEQIYDD0/56Pqh2Sh0vk4jEFSJFfN/zo2O1CYHW5EI+3eLcm8MXs8Gyc1oPBpG0vUeHEsrA6m7BcS6VOkrFTxbfHlZ2e3w3LJSb0ZSpY75g7rPYnDOW4T0HeLA2XqU0YzAWLMIZciZyLX/XFJpwroIX264Z722+8OEA=
Date: Mon, 8 Feb 2021 12:05:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Claudemir Todo Bom
	<claudemir@todobom.com>
Subject: Re: [PATCH v2 2/3] x86/time: adjust time recording
 time_calibration_tsc_rendezvous()
Message-ID: <YCEa7JxPCAzyWqfe@Air-de-Roger>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
 <26b71f94-d1c7-d906-5b2a-4e7994d6f7c0@suse.com>
 <YB1vGGl59oNZb5m5@Air-de-Roger>
 <861c931e-7922-0b5b-58a9-63e46ba24af0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <861c931e-7922-0b5b-58a9-63e46ba24af0@suse.com>
X-ClientProxiedBy: AM5PR0701CA0013.eurprd07.prod.outlook.com
 (2603:10a6:203:51::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0950ec92-6a85-4581-8b1f-08d8cc216e74
X-MS-TrafficTypeDiagnostic: DM5PR03MB2491:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2491CF083933739A28A424CA8F8F9@DM5PR03MB2491.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dt2Wp84kHLAfnRPofBED7H4WgGxUsuECyvYdmuhwvhlkLAmT1y0Cao6YYKTkIt4QoskNDdV/6U2kXLnFpQOEdSUFYP8OgnfanIEv2REKLRPmQA/z+6TJ+HUMCuF9vy18bvdRz3mZX5v+r+jVVP8euSXZnPROiZt3HYLpYklijnszRxKDEnzC60/W6wXiDyTyuvb0N7ninspQXxxp1/IJmG08x4zsUrFDjkzgC2FkQVnF6q/GuzMnmGYdux3ZjD5DoiVKH6Sz6tI/fHB3rA4MXSLraa9TdikPoW4vI8cp55sWsXKQ05/U83tik06yaqkI9cD/iey+XOBe/jJXAchjZE2mxnkfMbvMWzMbQYD0wAdbwivRHHG3Iv4jGEKIYDumDL+2ySPZD8UnnMniSVhi9eTUrupC7lN8klcT9HOTDLoJGfD9CNiMVy7w08LtGg6rKq541Sdgu/wy7nxPHANgWb0CnQgbuOqGc+w34BfOzAKeFrLQhcl5HzgPEmOeZ+ms/O5W0NSoHCC1jXG0thBegw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(8936002)(66556008)(66946007)(66476007)(6666004)(33716001)(8676002)(26005)(16526019)(85182001)(5660300002)(86362001)(2906002)(53546011)(83380400001)(316002)(54906003)(478600001)(6496006)(4326008)(956004)(6486002)(9686003)(6916009)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MHdhSHQ4bXZnakdvL0lKL1RRdlc2QkJ0TnpiK0tiQzFnWXdPWng5WXNrNjZY?=
 =?utf-8?B?ekNqaXhnaW9pbTlidDhELzV0bzRWMWptZ1RjZ3V1NFkvTTA3UE80ejRFK0ZT?=
 =?utf-8?B?Vi92M0pZSThZZk9GeWVYa1gveVhsTTNZckZGbFVxY0xmaTBjTmpOeFFldWto?=
 =?utf-8?B?WVlsWjh3ek9MN1VUYkVSQjh2SERwcnNBa2hITWNKZzA3NmtyMS8raWFyMzNs?=
 =?utf-8?B?ZGRnbzhoNVAvU1N1VERPM1RJeWJSWEM4YjI4VG0wdFJ4Q2RzdlRONG9YbWJ6?=
 =?utf-8?B?TUR0bGx4TjNGU0tkNTUrQWJseVR0ZVlPeWFYSWxyZzJmU284SDRuSloxaXEx?=
 =?utf-8?B?K0hMOVFHT2NWcHk1ZC8xQytqQ1pJR1RxOTdqb2tQYUJ4Z3F6ZHdLT0xVNkVU?=
 =?utf-8?B?Z3dGdkEvNW8wN0Y0THRzNjhUNUhzdC9FUEhqRkZka0NBT1Z1c0hYdlRkenpL?=
 =?utf-8?B?M2hTY1BtdkNjY3Z5R1pjWTNtMmNSUlJpcnFTK1k1c0dvZGY0dEd4RUZQUG8r?=
 =?utf-8?B?RU5TTmNYTGNPazZFTlJ4MHFGU0J5Nlc1N0tCWDJZcmhvMGIrdDZLemlLMG9y?=
 =?utf-8?B?c0wvZnF6aXpEdHdyYWYxOC8rb2cxWXkxL0FoamIxOUtCOWUyaHppTlFHSGps?=
 =?utf-8?B?ZXJUQU9JdGFYNVgycEhFbzM1QmhFZHJNMG95TGhyYzBONlpTclBsTzQ2aWg3?=
 =?utf-8?B?d2J0L1FXQ3NMVjY3ZUd4TkExakFSNnpWZDFBSExHV0tRbHV6eEY1TkJnZmxX?=
 =?utf-8?B?SmNmZE5DVXN4eGtxOXlJT2RMT0psdGFpUGtOb1VpUUhrbTliVXpQYTkyRWQ3?=
 =?utf-8?B?ckw2cmM5WTdYYmZlQmhXRWhSZS80YkE1NFdMUUF3UmorWlNTMGlMWm5xMFFQ?=
 =?utf-8?B?VURRQ0oyR3VIbmNwaFkyNWxHdjVUVGoxZmdpeEt1SXZBOHB3MTR3UFkvQW1w?=
 =?utf-8?B?TmxxQVgvVGRqS2cvcm9FL2ZUOVNaRG5IVE5YUFl2TTRqbE00cEtveFl2OVdK?=
 =?utf-8?B?MTFzTzR4UmJqN04rQ2N3YzFXVWVyZWZLY3FIdkM4TGgwZ3A4MHRFNUx1Z09q?=
 =?utf-8?B?bUVBdmxkQmhLQmpURjFOOG9qQUtyZFBZdmc0Q3FPVkQxMnNMaEduWktBRGVq?=
 =?utf-8?B?TkdxQjNJVTUzdkJseEpRemRSRmxWQ01pckFPbk5JNExYcXpnMkQvWGRyTWlI?=
 =?utf-8?B?a0piUWhpaEtXMEQ2Q0dZZ2Nha1ByR0JpL0lVZzF2SFl0MGtEQTBDaDFRYUYr?=
 =?utf-8?B?N3ZmMHRHYTdWY01xajJQT3lNWEJjdzQyZFgzTnJUQjlxeXhac3oyRVJHUzEv?=
 =?utf-8?B?d0pjaGtsbkYwMTFYM1hSeEdLUTlGU1hCM1JWWG5USXIrY3Nza29lTTZXQkNn?=
 =?utf-8?B?bGJySFBnL3NJNHBhR3JRV1R5QmtrUEh6Wk5yZStlSFdJWVI0WVliY2lKd200?=
 =?utf-8?B?cGh3My8veUZ2NVJ1d2FUejAyR3ZkMjd1aGpEVVZGVzg2UHh4ekkvTnRQdkhp?=
 =?utf-8?B?YTlMLzZNS1FSV3ZNRzZlemdicktOdGM1QVZ3ZC9Ja0E2RW4yTkh1clBWV1VR?=
 =?utf-8?B?MzZpWDg4WHBRVi9GWER2bmZ2aXJpTVhTcWlmajBpQ1hUUEdzcVc1dUhIMjFE?=
 =?utf-8?B?b1VSSEZFSG5nUlpFcVVXMWg1YldvanNYWUVBYkNFeE10WDhYcFBCWlBoQlZ0?=
 =?utf-8?B?U01tZ09tbG5IYXRnemR1aXVNQU4zczdHMWpJNExmM0dpSWxpRUI3WDVXMVJj?=
 =?utf-8?Q?bKcN/FhG61W/LlPp/vtip4z0NpL2uPS7t5QW9Ui?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0950ec92-6a85-4581-8b1f-08d8cc216e74
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 11:05:23.4323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7J+F1NIuOKcU3MqAW9y7olVrBq1N0DASil+4Qr0nn+jtbO+7W6FQQ+yNeNu1BBnxI/4n/koH8/nsD1ulPOUdnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2491
X-OriginatorOrg: citrix.com

On Mon, Feb 08, 2021 at 11:56:01AM +0100, Jan Beulich wrote:
> On 05.02.2021 17:15, Roger Pau Monné wrote:
> > On Mon, Feb 01, 2021 at 01:43:04PM +0100, Jan Beulich wrote:
> >> The (stime,tsc) tuple is the basis for extrapolation by get_s_time().
> >> Therefore the two better get taken as close to one another as possible.
> >> This means two things: First, reading platform time is too early when
> >> done on the first iteration. The closest we can get is on the last
> >> iteration, immediately before telling other CPUs to write their TSCs
> >> (and then also writing CPU0's). While at the first glance it may seem
> >> not overly relevant when exactly platform time is read (when assuming
> >> that only stime is ever relevant anywhere, and hence the association
> >> with the precise TSC values is of lower interest), both CPU frequency
> >> changes and the effects of SMT make it unpredictable (between individual
> >> rendezvous instances) how long the loop iterations will take. This will
> >> in turn lead to higher an error than neccesary in how close to linear
> >> stime movement we can get.
> >>
> >> Second, re-reading the TSC for local recording is increasing the overall
> >> error as well, when we already know a more precise value - the one just
> >> written.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > I've been thinking this all seems doomed when Xen runs in a virtualized
> > environment, and should likely be disabled. There's no point on trying
> > to sync the TSC over multiple vCPUs as the scheduling delay between
> > them will likely skew any calculations.
> 
> We may want to consider to force the equivalent of
> "clocksource=tsc" in that case. Otoh a well behaved hypervisor
> underneath shouldn't lead to us finding a need to clear
> TSC_RELIABLE, at which point this logic wouldn't get engaged
> in the first place.

I got the impression that on a loaded system guests with a non-trivial
amount of vCPUs might be in trouble to be able to schedule them all
close enough for the rendezvous to not report a big skew, and thus
disable TSC_RELIABLE?

Thanks, Roger.

