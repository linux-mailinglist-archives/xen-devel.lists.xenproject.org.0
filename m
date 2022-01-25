Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ECB49B704
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:57:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260429.449894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNFh-0000Qg-Ss; Tue, 25 Jan 2022 14:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260429.449894; Tue, 25 Jan 2022 14:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNFh-0000O5-O3; Tue, 25 Jan 2022 14:56:57 +0000
Received: by outflank-mailman (input) for mailman id 260429;
 Tue, 25 Jan 2022 14:56:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCN9Z-00033A-LP
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:50:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 268b31fa-7dee-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 15:50:36 +0100 (CET)
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
X-Inumbo-ID: 268b31fa-7dee-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643122235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=GhalZGD2D4ReUCHvN7oqGy8w4o+0Nmnd91/EvCsNKkY=;
  b=X6XrYukwsdHlNtq1m7Kw7s5PTsreOXISyGxs7ELvc/1pn4sIy4jsfeqb
   c6m5gL/b1WQn9JjicsJrB2/hfK8/+XmHqYeSwrhD/1p79uSgRsXD51rQo
   aZ2MuD/4ej3L+leA5LD4XzvPHSl/RZ0RD964q92XYwB2/YTByxsY9avGz
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KZ73ny8FYS3S//ZfEdzkxd8uHUJaGlOLRpjpO0sqmyZXg50kUxonRe8/lHot//YXku4Ip9eGwt
 dvOa74+H3BZby/MXwW083Em6Fq+LRKDM98xyUB0EEpWtXHh+hi1/JQOkwaq7JLevdwUdTM9uar
 T35eB8lUIJkd6KUUVgwyIkDRVzcbgrN2bzucRC/qXECJgOnKW80zqfOvvu1APVhW8dwlDjxvzE
 fA25Ia6ImbaAo86Yd1nNCQVURAavMuqTEssU2TFuMOSVVu8EKkO96/Nu+n0yU8XWGLC/CeBBIN
 W7168KL20nvL/jNkmrzKZZnF
X-SBRS: 5.2
X-MesageID: 62716602
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LvnyB66D5yxPwwBQJYsaBgxRtNzAchMFZxGqfqrLsTDasY5as4F+v
 jBJXWnVOvqMNmL0KdFzad6+8RgOuZXVx9NgSQY5+HgyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 tJVh5GtZgMVIoLOhvgPSQlCGhBnBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgm1v354QRay2i
 8wxNXlgNw74Yzt1JA05VZQ4kcyvjGfgbGgNwL6SjfVuuDWCpOBr65DvP8DSYceiXthOkwCTo
 Weu13v9KgEXMpqY0zXt2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQrnmcjBMBdN5sD8I49h2f0LrO6jeAPz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpk+XFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tmuVh6b/PuREDGQ3C94acO51qXHa5
 BA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL4JdwBv24gdRYxWirhRdMPS
 BWP0e+2zMQLVEZGkIctO97hYyjU5faI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jOF3rghjmzK7bc2rnnyPjOvFDFbIGOhtDbd7Rr1jhE9yiF+Lo
 4832grj40g3bdASlQGOoddMdghbdCZibX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3TApy6QL+wD5t5s1whOikgYQSh13Q5ON7956YDbZonO7Ig8bU7n/JzS
 vAEfeSGA+hOFWubq2hMM8GlodwwbgmviCKPIzGhPGo1cal/SlGb4dTjZAbuqnUDV3Llqcskr
 rS8/QrHWp5fFR96BcPbZav3nVO8tHQQgsxoWE7MLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94rwSrlwBEtXGWXf/I2aDyiC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYln3WLNtJn6KgZtGuqFXn+ILvAK3X
 gSE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6rOidTEFfHxiQkygMfrJ6PbQsz
 folpMNLuRe0jQAnM4regy1Zn4hWwqfsj0nzWkkmPbLW
IronPort-HdrOrdr: A9a23:Cwltg6n3dtDepEMz7hy3CceY1T7pDfO0imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICO4qTMuftWjdyRaVxeRZg7cKrAeQfREWmtQtt5
 uINpIOc+EYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ARV0gJ1XYGNu/xKDwQeOApP+tdKH
 LKjfA32AZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kSFjiWWgPNJt3ck4l+KSHqInc2omRCek1Jd0J6d
 P8bG8=
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="62716602"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e03IFGgCyrCKx6s8lYZDWmksmJ1/MUigWozpwIjjZgWWKvnbJ8d43prPYJwUnBuHgruuHrKW5/ao50LsroqBFZnYf/MbFnwHdYLlrKRW4ODzdvG3UQPmNLEd33+Q3mH0LLlAPpmj9gZP57Y9FubxRbaPRLTRYZWZtjuMbWA6xOaHAv449onorb5n2FAvJJdVU2npaBOQQ5ZAHXgnBsb01dZoupYQ7uTVPe2pBt2rDQVXJVeaCKJ/rwlX9oC1iYMY7bLaMRB6pvVAcRgCOSAzF2P9Z1DCbaSVqQLDwU/6C/n2BiiQlw6aCen/myavke6FBKk3NqOr4yLxIEAft6Rj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy74D5vf2Qvx7Y9yHQrLLnzYNT6ecHYlSdzOweNumGo=;
 b=WSjjag2cAcbXGvjWxPZy/rs7oDDXugOI6Dh8XBCDk1wYByAVaCrdmnnSGf2UYPVGYB/CjmgMVTI/xBYeY2y1Abl/svq0FqTvlmwRzC+FnMuabG/AKWeZvxU+TSJ2EHNq47CPgrMaXzYMbOCvBGJNYCCbcCplOwVWdRDbOEf08KO4fMpDvZIoZhkFNkZd6iwo4sO70Gj/ezeyOCIA4YIOBhhg2Anay+rolKGv5rxbfCUyu9irbhlAqAcurQhdnc1O7Cv7uwFtuUwzcvhGnK7jxvJTuerojCMzCQwMI/PlRDi6BUGPLCs7/UzuymELow+mYbz4iDAThUqf+hrU9i7BAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xy74D5vf2Qvx7Y9yHQrLLnzYNT6ecHYlSdzOweNumGo=;
 b=FCSCbgqiR2UNFF/StKyfOEk/rgyjvr+4O4F9jojSHOHqdBwtevSCuP2YdFIuP50MflQ08f/YEB3ETzY1ft5mm6XB2Z0AVTBu2A8q4NTfG+HeVUb3b29s6hjkPV+5VWwm1mM6trAMTdWC3DIdFPwxOVqbC+BcIEiIp8nuxU/Aumk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 09/11] libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
Date: Tue, 25 Jan 2022 15:49:33 +0100
Message-ID: <20220125144935.44394-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144935.44394-1-roger.pau@citrix.com>
References: <20220125144935.44394-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d8581d9-e099-4ae8-127c-08d9e0120868
X-MS-TrafficTypeDiagnostic: BN6PR03MB2868:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB286854C11C9797EFE740F95D8F5F9@BN6PR03MB2868.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:299;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EnPmEdSM+GNjxA+KrzXQjxiITtPSImq/h1nPBhezpbsLBcuSQTC+geGOtP7k8k6XGEe/awt2Fk9pL/Q5CHhieW9xd17ViS7XAzPo63F9nHxYnyroJyJqS0tNxNTNtoKnY7+Fx9HJqBdFWibAc3tCkZ9QI8uUlYp8Rgq+qo/Uq56conE0e45eWS10K/cx0kxgDaRpWPpU7giIjtx6aOE/DJiZPENPI5aS3I67uC9oYQ0sgbI5hiwQeAXUBbMXZ9ybIjUhtYMnHIPmYnvvdAv9CN7AxUpwX8fbVZuFfM11c5rPIeQzeD1c4gMZSQllq4EJaEnuNWIz64TX+9kMtnfxeBMUcuUtWAIys6I0B8fbCJ1H2BU90MwcH1LAThiCC3ZpopUlIX9CBTOcovnWuNkVhomUHpC/+Yyd+Q6A878C6cLsKCJ4+StYOPHR6v8JGHSSelWKOPHcUrUSVsajrXy4kn0KvACxMn2H3TStXUdfSUb5NWGmQMXTcU3ceVivHJJDSnGAPIDhjW0ZUxxOmoBpOGVcKx+RB31fOTZHc12zhZsOUybK2IH8FM1eO3qXlZZlQy6vb3kArC1o/cTDRCevyFuHsUJ7X3DbBep30JXI7Dwg0kLRaaU1HtJkIDmjM9VlUWQOK4Z29sikJT8ITxalwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(83380400001)(316002)(6512007)(186003)(82960400001)(2906002)(54906003)(66476007)(66556008)(6486002)(6506007)(8936002)(6916009)(26005)(2616005)(8676002)(36756003)(4326008)(5660300002)(38100700002)(508600001)(1076003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0hFcWROb2YwaWlOeUtsK0VkVGtORDZKcTFNYWxaKy9FcktTbldQbjl1aStl?=
 =?utf-8?B?VDdvcjFMelEyd1dFV2NOMndjYURJSm4wbEFrNjlWVkxCdUJVTUg2S1cvWlBh?=
 =?utf-8?B?WW5qK05sUmZkSE5nNHQ4ZXRRUkw0U3lIQ3JSR0J1cWFhc0x0Rzg2NXgrbG4y?=
 =?utf-8?B?NmNHSkJya0JoVTBXd1hva3p1U0dZWit0Y0o0K3hrRERuUkNFRThIM1BQVXkw?=
 =?utf-8?B?OS83S3QyWjZJQ1krM0dVcUlMRWducjNIUXRCejhld1dWM0NqK05zR0RPYWFU?=
 =?utf-8?B?eXY5Y0krbFA4NkNVY1VnUkNXOXFUbU9aR3ROMk9wcEdoM20wTTJjTVJyMTk4?=
 =?utf-8?B?T0E4Y2pNQythWFNGcDNFN3RPZExBeWd1dTNTN01LT2lXU1I2eksra3VwcUR5?=
 =?utf-8?B?azJISjdUeW83ZVFZeW12S0dYYk9HVU5KWjY4Wm1TTG8wU1JSOFFoYUJtcUpZ?=
 =?utf-8?B?alJ1MXNqY2FjS2hNVlA5VXB3dHhXR3NLQ3d1VEdpb3ZlS0VZSWIrclkzM1Bm?=
 =?utf-8?B?TWl5alo3UVhNZHFqWlJjTWlKQms2NVJRTWRPSmZBWDdoNGdxaGt1TWpPalFy?=
 =?utf-8?B?L0x5NmFWbHBCOHhid3ErMDQ2aEo0ZjdGQlg2a05UU1JxR2tWOFR1dnNMM3Az?=
 =?utf-8?B?anRjMExRZGQ5UFY3cUN6K0daZXR1OGVHM2k3QW5OeEdrSUJpUi8xbDlta1RB?=
 =?utf-8?B?bEpkRTcyUWRBL24yZFJMY2tMNk5GbXVXSTFZSk9NWjgxY1lycm5iZ1d2UDFo?=
 =?utf-8?B?UFg2OFJJMkdxY0xmQ09SVEE2UmR3TnJhb3dVQzUyTEQ2dnp1alVQMS8zUFQ5?=
 =?utf-8?B?K0lVUDJzbFJnY1ZaUG1qeHd6MUdVdlBnQjRidWNNUGd2MStTV2J2bnNwZkJS?=
 =?utf-8?B?eW1peS9PbFphaWJrNmhhaDRIU1dtTlJvKzU2VWF5L2NaZ3RZN2JoRytGa3BU?=
 =?utf-8?B?Y01hTm1iWHhPMVBiZG83ZWNQZlJpWkVFMEVFUTZmcGJKL094S3BlSWNseHYv?=
 =?utf-8?B?Y3oydXc0ZU4wKzNTZ0J1RVluOEViRjdqdGx4eXhlUjVZd1FGMENoT24yQ1oy?=
 =?utf-8?B?aUNuVkNiNTQ4NDNnK05hRVBQTE5vd3F6TTNZTDlRWWdlNE1najY1cTVIaGhq?=
 =?utf-8?B?MFpBTTMrcHNXYjNFNmpYenQzc3lyN2I4NXJBZC81QzV2NXF4TnVESk5vR0to?=
 =?utf-8?B?NGVxQkxCNzVqSFVMS0VVZCtDRi9YZVkzR0t1cWZCY29oME5YS01iYjFQODJH?=
 =?utf-8?B?V0hjTWhjOHRjSjFQU1p5TEtEeHdKaUJ2VnY2QUtMdjRlVUcrNkFTc1VTcU9t?=
 =?utf-8?B?NFJYWWdOTzJ0U0ZDZ1J3U25pUDdaQ3VxTW5HUzZ4dGlKbkpJR1lhWW03UUlS?=
 =?utf-8?B?L05BUkRjZSs3blcrQW10QkJ4KzNldmNHQlVqd0tGanZGVXRWQm9FNWNzQ3FN?=
 =?utf-8?B?TXlJU0N6MVlING4zYzFDalVWUmlCcWNQczAvN3RhSFBzNC9KQXhVUnJxeE1T?=
 =?utf-8?B?SkZYYkVFZ1V3K0RDZzFRVnFUZ0lWZTB6d1ZKWUEvVHhMTFhsSUl4eTNxMXJ3?=
 =?utf-8?B?QUxibVJ2dmNnZy9yMG5oNVgvTk96RzJPTkIyNzU5UTVpUlhTRTdCMUxvTG05?=
 =?utf-8?B?Qm5tUjdocnNmRGtIU29JanRGNTNRYVUvTWNpRHF5SHc4MWNXVVdPL1NFRklL?=
 =?utf-8?B?am5yYkxhMlhJckVJUVZmMERXK2NKMFRZWHN3czVhbzBJamhMRGlxRnFqV1hN?=
 =?utf-8?B?TEhvWU14M1hlQ0dZdVNMRVZLNDlUV3d1SWpwUVJiRG91VzB2ZnByc09sMmRr?=
 =?utf-8?B?VVlyNmtWR1N2eWMvQkIzMnZBRU1zdnBtUER1UkNSMGE3QmN5QVcrdG90Z1dI?=
 =?utf-8?B?YStIVEVkdkJXQ3JWbmt5WVZIcjhyTWV2SHVVNGhjc0pPZVlER1pJZG9XQWhY?=
 =?utf-8?B?OGQ1NnF3VjBVRlM5TnprbVhLRkVZd01zWU5XM3lMUE4xZDBiOFdlYVJPWjk2?=
 =?utf-8?B?RldlWDRiejRKTi9VRUQ4RkNBQXB0bE9RdjNBVXdZYmN2ZEZoc0NjUnRNdXNo?=
 =?utf-8?B?WlVMVmJvMjBiVDgyZDRVN0Q5cmhoV3VJd0RVYkdTdVluUC9BN3ZPakxXM1BN?=
 =?utf-8?B?QVViNVg2cVN2Yzc2Z0F0MFB4SDlkeDZqbGp6VlNpcHFjbFp4ZXNvRGQySnp0?=
 =?utf-8?Q?vx+DVA8ysZF+5vQ1vPacN5E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8581d9-e099-4ae8-127c-08d9e0120868
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:50:30.6113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkEiPAukKUgPKBI2qLTLPJCvMs5YpP2Vo+A9F9AWDJ2IvNh2c9RqiOpMdkP53udxu70wtkIBWOzyBFkTgpjUDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2868
X-OriginatorOrg: citrix.com

With the addition of the xc_cpu_policy_* now libxl can have better
control over the cpu policy, this allows removing the
xc_cpuid_apply_policy function and instead coding the required bits by
libxl in libxl__cpuid_legacy directly.

Remove xc_cpuid_apply_policy.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v6:
 - Use a single call to libxl_cpuid_parse_config in order to add the
   extra options.

Changes since v4:
 - Correctly account for PVH guests being HVM in libxl__cpuid_legacy.
 - PAE option is only available to HVM guests (_not_ including PVH).

Changes since v2:
 - Use 'r' for libxc return values.
 - Fix comment about making a cpu policy compatible.
 - Use LOG*D macros.
---
 tools/include/xenctrl.h         |  18 -----
 tools/libs/guest/xg_cpuid_x86.c | 133 --------------------------------
 tools/libs/light/libxl_cpuid.c  |  73 ++++++++++++++++--
 3 files changed, 67 insertions(+), 157 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 95bd5eca67..745d67c970 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1829,24 +1829,6 @@ struct xc_xend_cpuid {
     char *policy[4];
 };
 
-/*
- * Make adjustments to the CPUID settings for a domain.
- *
- * This path is used in two cases.  First, for fresh boots of the domain, and
- * secondly for migrate-in/restore of pre-4.14 guests (where CPUID data was
- * missing from the stream).  The @restore parameter distinguishes these
- * cases, and the generated policy must be compatible with a 4.13.
- *
- * Either pass a full new @featureset (and @nr_features), or adjust individual
- * features (@pae, @itsc, @nested_virt).
- *
- * Then (optionally) apply legacy XEND overrides (@xend) to the result.
- */
-int xc_cpuid_apply_policy(xc_interface *xch,
-                          uint32_t domid, bool restore,
-                          const uint32_t *featureset,
-                          unsigned int nr_features, bool pae, bool itsc,
-                          bool nested_virt, const struct xc_xend_cpuid *xend);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index a2e2f7c850..28993f0356 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -370,139 +370,6 @@ int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
     return rc;
 }
 
-int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
-                          const uint32_t *featureset, unsigned int nr_features,
-                          bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *cpuid)
-{
-    int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    xen_cpuid_leaf_t *leaves = NULL;
-    struct cpuid_policy *p = NULL;
-    xc_cpu_policy_t *policy = NULL;
-    xc_cpu_policy_t *host = NULL;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
-    {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto out;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = -ENOMEM;
-    if ( (leaves = calloc(nr_leaves, sizeof(*leaves))) == NULL ||
-         (p = calloc(1, sizeof(*p))) == NULL ||
-         (policy = xc_cpu_policy_init()) == NULL ||
-         (host = xc_cpu_policy_init()) == NULL )
-        goto out;
-
-    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
-    if ( rc )
-    {
-        PERROR("Failed to get host policy");
-        rc = -errno;
-        goto out;
-    }
-
-    /* Get the domain's default policy. */
-    nr_msrs = 0;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                           : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_leaves, leaves, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = x86_cpuid_copy_from_buffer(p, leaves, nr_leaves,
-                                    &err_leaf, &err_subleaf);
-    if ( rc )
-    {
-        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
-              err_leaf, err_subleaf, -rc, strerror(-rc));
-        goto out;
-    }
-
-    if ( restore )
-    {
-        policy->cpuid = *p;
-        xc_cpu_policy_make_compat_4_12(xch, policy, host, di.hvm);
-        *p = policy->cpuid;
-    }
-
-    if ( featureset )
-    {
-        policy.cpuid = *p;
-        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
-                                            nr_features);
-        if ( rc )
-        {
-            ERROR("Failed to apply featureset to policy");
-            goto out;
-        }
-        *p = policy.cpuid;
-    }
-    else
-    {
-        p->extd.itsc = itsc;
-
-        if ( di.hvm )
-        {
-            p->basic.pae = pae;
-            p->basic.vmx = nested_virt;
-            p->extd.svm = nested_virt;
-        }
-    }
-
-    policy->cpuid = *p;
-    xc_cpu_policy_legacy_topology(xch, policy, di.hvm ? NULL : host);
-    *p = policy->cpuid;
-
-    rc = xc_cpu_policy_apply_cpuid(xch, policy, host, cpuid, di.hvm);
-    if ( rc )
-        goto out;
-
-    rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
-    if ( rc )
-    {
-        ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
-        goto out;
-    }
-
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto out;
-    }
-
-    rc = 0;
-
-out:
-    free(p);
-    free(leaves);
-    xc_cpu_policy_destroy(policy);
-    xc_cpu_policy_destroy(host);
-
-    return rc;
-}
-
 xc_cpu_policy_t *xc_cpu_policy_init(void)
 {
     return calloc(1, sizeof(struct xc_cpu_policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index e1acf6648d..6c8643fcca 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -441,9 +441,13 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
     GC_INIT(ctx);
+    xc_cpu_policy_t *policy = NULL;
+    xc_cpu_policy_t *host = NULL;
+    char *extra_feat;
+    bool hvm = info->type != LIBXL_DOMAIN_TYPE_PV;
     bool pae = true;
     bool itsc;
-    int r;
+    int r, rc = 0;
 
     /*
      * Gross hack.  Using libxl_defbool_val() here causes libvirt to crash in
@@ -454,6 +458,38 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     bool nested_virt = info->nested_hvm.val > 0;
 
+    policy = xc_cpu_policy_init();
+    host = xc_cpu_policy_init();
+    if (!policy || !host) {
+        LOGED(ERROR, domid, "Failed to init CPU policies");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    r = xc_cpu_policy_get_system(ctx->xch, XEN_SYSCTL_cpu_policy_host, host);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to fetch host policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    r = xc_cpu_policy_get_domain(ctx->xch, domid, policy);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to fetch domain CPU policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    if (restore)
+        /*
+         * Make sure the policy is compatible with pre Xen 4.13. Note that
+         * newer Xen versions will pass policy data on the restore stream, so
+         * any adjustments done here will be superseded.
+         */
+        xc_cpu_policy_make_compat_4_12(ctx->xch, policy, host, hvm);
+
+    xc_cpu_policy_legacy_topology(ctx->xch, policy, hvm ? NULL : host);
+
     /*
      * For PV guests, PAE is Xen-controlled (it is the 'p' that differentiates
      * the xen-3.0-x86_32 and xen-3.0-x86_32p ABIs).  It is mandatory as Xen
@@ -481,14 +517,39 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     itsc = (libxl_defbool_val(info->disable_migrate) ||
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
+    extra_feat = GCSPRINTF("pae=%d,invtsc=%d", pae, itsc);
+
+    /* Set Nested virt CPUID bits for HVM. */
+    if (hvm)
+        extra_feat = GCSPRINTF("%s,vmx=%d,svm=%d",
+                               extra_feat, nested_virt, nested_virt);
+
+    rc = libxl_cpuid_parse_config(&info->cpuid, extra_feat);
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to set CPU features: %s", extra_feat);
+        rc = ERROR_FAIL;
+        goto out;
+    }
 
-    r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                              pae, itsc, nested_virt, info->cpuid);
-    if (r)
-        LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
+    /* Apply the bits from info->cpuid. */
+    r = xc_cpu_policy_apply_cpuid(ctx->xch, policy, host, info->cpuid, hvm);
+    if (r) {
+        LOGEVD(ERROR, domid, -r, "Failed to apply CPUID changes");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    r = xc_cpu_policy_set_domain(ctx->xch, domid, policy);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to set domain CPUID policy");
+        rc = ERROR_FAIL;
+    }
 
+ out:
+    xc_cpu_policy_destroy(policy);
+    xc_cpu_policy_destroy(host);
     GC_FREE;
-    return r ? ERROR_FAIL : 0;
+    return rc;
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
-- 
2.34.1


