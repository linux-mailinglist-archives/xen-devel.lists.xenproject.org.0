Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BA74F7AFC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300556.512733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncO5T-0004DU-4g; Thu, 07 Apr 2022 09:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300556.512733; Thu, 07 Apr 2022 09:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncO5T-0004Ar-1C; Thu, 07 Apr 2022 09:05:55 +0000
Received: by outflank-mailman (input) for mailman id 300556;
 Thu, 07 Apr 2022 09:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qv4n=UR=citrix.com=prvs=089d11f18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncO5R-0004Al-JI
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:05:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebdf87b5-b651-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 11:05:52 +0200 (CEST)
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
X-Inumbo-ID: ebdf87b5-b651-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649322352;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0rwFr/lMH4pUY5wN9eVOTb1WyMvDa/nzkPMOsZaiI9Y=;
  b=QkoxJADAgqBuYwdX6GlgP8rlaVZiA82CHXLh0gNZiMf5CuyxY+V//UfN
   CNZSoaheZkQMuruKzV9Si7VfxewcCu/vwJJCTz6A9GO6F7GggRLZ00xrc
   2u5ADpGElUNY3rMcAkdWCldMnOZbCmoWF8AK+4uUzcEJ0ZIzPQWgi3t2w
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68648913
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ugbwga7mPbGQhYbmktkOmgxRtJPHchMFZxGqfqrLsTDasY5as4F+v
 jdNDWCHaa3YY2b3KN5+bYu38EgH7JPUyIJkSlA4qS4xHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YThXFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurToSlcnHaTtlt8acEgEATx5AqIf8ebIdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQTaiCN
 5tAMlKDajzySh19ZXIQK6tip6CMrEHNeCBlgQi88P9fD2/7k1UqjemF3MDuUuKNQcJZj0OJv
 FXs9m7yAgwZHNGHwD/D+XWp7sfUhj/yUo8WELy+99ZpjUeVy2hVDwcZPXOxrOOlkEe4V5RaI
 lYN5ys1haEo8QqgSdyVdx61vn+C+AIdUtx4Eusm5QXLwa3Riy6bG25CSDdCYd4nscYeRDo22
 1vPlNTsbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bphDFQ8tnEaW1psboAjy2y
 DePxAAhg50DgMhN0L+0lXjFnjatq57hXgMzoALNUQqN7AxjY5W+T5e18lWd5vFFRLt1VXHY4
 iJCwZLHqrlTU9fdz0RhXdnhApnx5KaLEzT9j2VoPMh95SmqxHH6dNlftWQWyFhSDu4IfjrgY
 Un2sAxX5YNOMHbCUZKbc75dGOxxk/G+SI2NuuT8K4MXP8MvLFPvEDRGPxb44oz7rKQ7fUjT0
 7+/eN3kM3sVAL8PINGeF7ZEiu9DKszTKAruqXHHI/aPjOL2iJ29E+5t3L6yggYRtv7sTOL9q
 Ys3Cidy408DONASmwGOmWLpEXgELGIgGbf9oNFNe+iIL2JOQT99WqWBnO5xJNM8xsy5c9skG
 FnnBye0L3Kl2xX6xfiiMCg/ONsDo74hxZ7EAcDcFQnxgCVyCWpexKwea4E2bdEaGB9LlpZJo
 w0+U5zYWJxnE22fkxxENMWVhNEyJXyD2FPVVwL4MWdXQnKVb1GQkjMSVlC0r3dm4+venZZWn
 oBMISuHGcFTGFk4VJ++hTDG5wrZgEXxUdlaBiPgCtJSZF/t4M5tLSnwheUwOMYCNVPIwT7y6
 upcKU1wSTXly2PtzOT0uA==
IronPort-HdrOrdr: A9a23:E4UMOaofmrYf3ynFVT+XYSYaV5uwL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NCZLXXbUQqTXftfBO7ZogEIdBeOk9K1uZ
 0QF5SWTeeAcmSS7vyKkDVQcexQuOVvmZrA7Yy1ogYPPGNXguNbnnxE426gYzxLrWJ9dOME/f
 Snl616T23KQwVoUi33PAhOYwCFzOe74K7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLhiP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4Dpk/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjDSDczG6N69MtkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l2KvyEBS0NI7vjh6a88zebVRpYsQ8Ad+C5EbBh/374ghDa
 1HENzc3vBLalmXBkqp8FWH+ObcHUjbIy32AHTr4qeuon1rdTFCvgQlLfUk7zc9HMlXcegB2w
 zGWp4Y4o2mAPVmKp6VP91xM/dfOla9Mi4kD1jiVGgPNJt3c04l+KSHq4nc2omRCes1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="scan'208";a="68648913"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0PceeB5oZc6ZvhaFBit8PpnRlYlOTzaqBOMZejF+bYRJXWQjV+vR4fe9CUJA2y46wDmD+DqxVqVxJSh4u4HPKsMw+u/nJ5gYToTls3ZLDb0GbVboICeZzs7WDzrgBDzQHs45NfSeQltJSlKrD6WBYCTSxPibPP781oV/IaLVcZ4Cm4NEMXM+0rA5iE2eK4oZROhsbSl4gg4pfzE1iuAG2sAbnJPB4Y4lPQ/iwBmeseqsTmuh8QUibQmp/4q+8ofi/lHyALHxuuatd8Rt/T2M6eBj/W4JhnYNVzMeQAjAu6zsjrXeTCYql+1SqtJ2r/zR3tng7xAzjoihwNNV+NJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97FY5pGFaDyDA4WaxUBvufnFLrAolBIUYgsh1p3FBlo=;
 b=DS+lcIC9nyXPeoC+J1PSFZHIbf2eh459P+PbhqkcvrrT+5HWQEmkul6ymFyg4kXYIiMjVMSWnXNRUJSPXfNlaqSq2s0l/fQxUz8110eKYr14GJ5z9WPXAYRWrPBsqI2AsJq5M4x95+hEz+J7o5rO6ZBUue8K9h08OdWT6aeugctBla8jFoo8hJ6AAnTRCcp8w/jvNqJ8JIO9Q32mtGk+MKSNurqKDjfD+DkeH0vekWIbj6gkyi/Qo1UAGAJmwd3HkRAQDyh+9GSirLq7Wg/6+yHPsIJF/AaVFl92p6fp5YPzxPG1/54dE2npROtTcaslXM34Lme4E4wZwFmM6zYgQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97FY5pGFaDyDA4WaxUBvufnFLrAolBIUYgsh1p3FBlo=;
 b=B5vhkivgjGEiX8UHyEZKb53y6G54D5pREEORux6pofD5DCzCIylzDDO+XM0viXLlT0CxkcNvDO2VGbqs1LfZ9Z4zZEJeEf5VHLU7F9OndCinCtHKZFaEvg6DdCXWx2P7qGMKABlt+iQACF/x/rpaUiOy3wGIrFbyRTXAomG63GU=
Date: Thu, 7 Apr 2022 11:05:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jane Malalane
	<jane.malalane@citrix.com>
Subject: Re: [PATCH v9 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <Yk6pZ8QkaC7QPqvv@Air-de-Roger>
References: <20220401104713.22291-1-jane.malalane@citrix.com>
 <20220401104713.22291-2-jane.malalane@citrix.com>
 <Yk6glX+SHMyY/GYF@Air-de-Roger>
 <de79b53d-0129-ee14-f7ec-fb7fb768b27f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de79b53d-0129-ee14-f7ec-fb7fb768b27f@suse.com>
X-ClientProxiedBy: LO2P265CA0225.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87dd7dad-7c8f-40f8-43ad-08da1875cdc3
X-MS-TrafficTypeDiagnostic: SN2PR03MB2286:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <SN2PR03MB2286012BA330AE2E5C4B88198FE69@SN2PR03MB2286.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LujoEJ+UAa1vR+GUdnAkx8HnFSH2LxEBGlPZKPcfRmcSKhqT8yaITZWgP2ppzZzmeS+4XFIml3Jt1UuSyIBoHG48zxAHJ7Emq4POXd4SWkjxISPkhC9CQeMZhO9vwFLpcQ2sG8MwK8X8Y2bxpVisqJr0xaUHviKQ8nmDLa36c8G4TEB/uT3jwyZCoLZOZLGYiofThO6OcxYbBl80i2th/UPytCGHuCgaSS2uPChWkCtjAt+lSO30M+raj7L86GctNIMy7Etm7MBkB6/FbUS3Bk+gy8/CTV9Q8K0lVHbHl8T+AdEUOF5yIG1zxZXAIUprvuY6A2yESb7KuwwNd4yf7UQQbNqLb5yhDUssb2rOc0oAsJxswBPz4Ejp7AlvFbNLoufH32p5+MZNu2v2h09ajmkD+WgwyWGIucfMrRPTbD2B02yPmAYYPO41c6ww8HW+H0qAkpbY/7DWN2500Km/fscZ5A4JIs7Fp1GRzuRiO4q8yfIH7VZn0Pf3oylk4VD+s8hWh2FieLI89a3nCpuX/8QS67O4kcYuxEuxTnztWal52k7D1bQWcLVNlY/YhEaYydQ206cvIHqG+hsy5RzWuwyk47quNDw7U3AokSOdxpMyNoPbSj2baGPsUWYHzaTemlMuHOqRqGbMrHU1Qgm4Gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(54906003)(6916009)(4326008)(85182001)(66946007)(186003)(26005)(508600001)(7416002)(66476007)(8676002)(8936002)(316002)(6666004)(6512007)(6506007)(2906002)(9686003)(33716001)(107886003)(83380400001)(53546011)(38100700002)(86362001)(82960400001)(5660300002)(6486002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0JaNHZEZCtna1FxRUQ3OGU3LzF2aW9uYlhHcktMRnJQTzl0Y1dxRlZycUgv?=
 =?utf-8?B?dGJvOFVqSXEyM2tZcmNGKzFIc1owY3hiMEwzTkcvY2dmQ1RMazkxMnFCakxx?=
 =?utf-8?B?NDNUZm1UaVhzenpyZFRCZ1VBRTExNzlmU1NUSmVQNmRMRVZDNHF2ZGRQaE96?=
 =?utf-8?B?TW9ocklJRUZ6SXVCNDRNd3NZcFBlRittVTFacS9nUHBJQnljeC93aEU4VlF0?=
 =?utf-8?B?b01IaWlBL2QzVUZuMDRybks4YmYweHk4Mm1uWUZMeVdDNG5mdGFTZzJxQXRt?=
 =?utf-8?B?cmVmc2phQ1lDNlM4Y2h2ZXFGQ0xVOTFoRm5NYmVUUGd4MEx5NGhkK1FEL3Ja?=
 =?utf-8?B?eXM3S2FqMDZOeHVXV2c0RVhTWTR5VDlyQ0RJKzRqUjZHOWxKZTZsbHpSNERY?=
 =?utf-8?B?cUVVa1EwMUl6a0gxRlduaEpBNEh1WldmRlBZZG9nUVFqK1JWeHM2cGFwODZk?=
 =?utf-8?B?TTNUZjRTeE8yaEp1cjFFeDdJdktkaEdKdm0wVTlKME5MNjR5QXdzQ0ZuL2Iy?=
 =?utf-8?B?SXlUTDlxVm44SUI1VG1jTUY4Y0lKR21DU2NvblVsOTduVlg5SmZPZEpqWUxw?=
 =?utf-8?B?TW50VVRXY3BEdlJhdzJ1emxWUkFiRWovcnN3ZTNMZGQvOEFLMUxQN1p5b1A0?=
 =?utf-8?B?c0lpem90UHZJY0NjYTB3aE9icklJajgyMzZkd29vTGtjNnl0T1BvRmhPa3Rq?=
 =?utf-8?B?OXRzSzVuWlBWTWI1VzltamtCU2EzT0xJaFhZV1JXZU1uTEVLcTdPQzIxdGZH?=
 =?utf-8?B?WkF0QnlLTHVqcHg5VzVJd1NCSGIvQjZXbUdtT3JzMHlZMWxWZ2FKZ1F3YTFO?=
 =?utf-8?B?ZjFtVzhUampJcklROEgreFhRVjYrdXNGS0tlZnlqWnI2NklLdmF3SUVWaEtC?=
 =?utf-8?B?K0JZSWZDTkRhMFk0eUNCcjRidFdjWDdYaHRYejV1LzllY3Y3NXJnSU1TSDhv?=
 =?utf-8?B?ZU45ampKNjJ0R0pPTTVNK0E4d09nSWtsdWdxeWZQYlFVMEtsQlNjczdEcGJh?=
 =?utf-8?B?NmZQcDNpd3kxbk5HNEw0SVg3ZUxQMlZPSFN2L1hsWUhqL01lelVyaXZLamx4?=
 =?utf-8?B?ZjJmaWI3Z2VvdkNiS2pTWC84bVVyNFBoVDlQMU4vOWxjUkFJMkFYSEUxUnNC?=
 =?utf-8?B?cHFlWnF2QlpRK3ptT2FrekRRaUc2NXByaU9YbDVqb2Y4blJwZVMzQU9QM2RE?=
 =?utf-8?B?bU1LVXJmY0tBTUFwdzEyM0RZZWlnd29tbTdtZGlTZVNMaXIrK25jT3pHWHEw?=
 =?utf-8?B?KzF1QTFtdGw0b1luZm13b3c0VEgrM1hqaG53c3N2a0ErT1c1c28vUnZpemY3?=
 =?utf-8?B?TnVZN3d0UWllcjdjRkpLN0ZyU1NaemlWVGR5S3dwOUVDMVpIMmwxRjhHenY5?=
 =?utf-8?B?U0NFdHd1UkhzY1RFSFR5WGtVck5NR0xHR1M4ZVVXYzhleUpkY3RtKzRiN05L?=
 =?utf-8?B?VExzbUhYc3lPcS9RbXJsTTZzeWRkeS8vMWtoUmpFVjhVRHJTbGFoc3ErN25n?=
 =?utf-8?B?YVVpWWx6Q0tsdDlnS3ZUc25LbVErQU1YVjlsZm1vZFYzMEo3WXJSYTJXY2FD?=
 =?utf-8?B?NE4xbnI5RjBIQVVNUzdtd0JnTUYwQUNCWURzc1hVRmlUNEJqUFRTV2NCQ09z?=
 =?utf-8?B?ak9wdGxCQk9tYmx6aloxLytFMWlvVUlZSlB0ckg5bkR6L2pwSHZ6SFdhd0xY?=
 =?utf-8?B?aTE0MXlzRkROaW1pNmFOdGs5QXpVMWhHSS9jRS8vcytsbHNzamVIVGtWQ2N3?=
 =?utf-8?B?aitXTlhnZDU3ekYwQXBlK0piMTRBZC9Sc3VHTW1taXBtZ2pud1NkdXZ5L3U1?=
 =?utf-8?B?SzVNZWRQWmkyMXVncW5LME52Z3hHS1RIK3pqbHM3Q0JLbWNBUzBaTWRoWjFY?=
 =?utf-8?B?ZWd3NTBuOEc3RC9qeUU0U0hWeXlDVUV5emtwdGhHRCttZlkwM2hySkxXVmRL?=
 =?utf-8?B?OTJZZWs2L3NETmkxMnVZRXpNVkw1NGVldm93QjFvdzRHZTZZbC9hS1pSVlpW?=
 =?utf-8?B?OG9Xb1hVVGtEQ0IzYjhFUkxjc2sxM0tFTDduL1FJcis1VE9qSkxjSTU4QlE4?=
 =?utf-8?B?Ti9BQnduRDA2TXUyd2t4M2daL2ZBb1pSazRJT2lRdzJ3MytRemxtckpXb3FQ?=
 =?utf-8?B?NW5SV0RaVEZxNTc3Z2JXakdvZFVOek1yOXFpTVE1c3pCbU5wNkg5T2Y2aCtv?=
 =?utf-8?B?TmZiL01qNnMwaWFFMS84elJlQXBHcmNMWHdsSkZvaVFqbW5LWGZnRi9CeW1D?=
 =?utf-8?B?WFJtK2p4RXJiK3llKy9RaFZ2WGtKcHQrZzBsQWY5aFdjN2hOMmhhc2ZLZ01l?=
 =?utf-8?B?c3V5MVl1bkViRjZtM2Q0VElPb1hPc0xjdHdJUlhxTmJ5VnFqV3FBS281U2RW?=
 =?utf-8?Q?g3m0PGAXQ76xnHF0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87dd7dad-7c8f-40f8-43ad-08da1875cdc3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:05:47.0587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqUIpCBzwzaMgbaA4ZkQ4+7HDr9onjBwvb4TWsX8GgLReR3aC/bkjCPXrUE1rT1IxpHm0sePOB9xzOmvduvv1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2286
X-OriginatorOrg: citrix.com

On Thu, Apr 07, 2022 at 10:45:10AM +0200, Jan Beulich wrote:
> On 07.04.2022 10:28, Roger Pau Monné wrote:
> > On Fri, Apr 01, 2022 at 11:47:12AM +0100, Jane Malalane wrote:
> >> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> >> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> >> @@ -2145,6 +2145,12 @@ int __init vmx_vmcs_init(void)
> >>  
> >>      ret = _vmx_cpu_up(true);
> >>  
> >> +    /* Check whether hardware supports accelerated xapic and x2apic. */
> >> +    assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
> >> +    assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode &&
> >> +                                (cpu_has_vmx_apic_reg_virt ||
> >> +                                 cpu_has_vmx_virtual_intr_delivery);
> > 
> > Setting assisted_x{2}apic_available should only be done !ret, or else
> > we might be reporting those capabilities when VMX is not usable, which
> > would be misleading IMO.
> 
> Hmm, while I agree with the observation, wouldn't it be better if all
> the feature masks were cleared in case of failure, such that other
> code using the predicates wouldn't be mislead either? (That would
> likely want to be a separate, prereq change.)

Possibly, yes.

vmx_vmcs_init failing will lead to start_vmx failing and thus the
hvm_function table won't get setup, so I think we got away without
doing the cleaning because there where no code paths using it
anymore as HVM was disabled.

To not delay this series anymore it might be easier to just set
assisted_x{2}apic_available inside the !ret if where the keyhandler
also gets set.

Thanks, Roger.

