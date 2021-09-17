Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A26240FD15
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 17:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189502.339276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG51-0007cE-CK; Fri, 17 Sep 2021 15:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189502.339276; Fri, 17 Sep 2021 15:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG51-0007Yc-8P; Fri, 17 Sep 2021 15:47:11 +0000
Received: by outflank-mailman (input) for mailman id 189502;
 Fri, 17 Sep 2021 15:47:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50Eq=OH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mRG50-0006W6-BE
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 15:47:10 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 826b16fa-17ce-11ec-b6db-12813bfff9fa;
 Fri, 17 Sep 2021 15:47:06 +0000 (UTC)
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
X-Inumbo-ID: 826b16fa-17ce-11ec-b6db-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631893626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=cW68oEJxhg7ruw/Wz/7ZZTJZ5IG09WPYChe/mZQXPdQ=;
  b=EDWsobZ1a1aq4AKTefkRmALj1Skr9u60fVd0fRP/kgadxVyBY8p7TjPk
   oeRw8WOUSeUlqEDcC+h1/FXlQSl20PnCJijsmQBmTn8M1X5KXMVCtEaZw
   3qqTY6sXxN//YN4W5qgDAVsoIpgJeILKUgg1nhI0UQVRER70dCEmakIyn
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xItb0CioMwH5Zii2Prkp7bX2rdwRmY3bKzif0LdSjIujch0rlR42CfVRLl8apsOmfX3W2HJVQ0
 vhcXVy8D1P5bQ51b8bApDdqO6k3NftypaBp3PuyHDkiTWeGs8wknPbFtv3EJ6sgUFCUZdHJNH6
 QJy02e6xSpL1/8PfLGek9NQ5vwQ0quA5OQeycHeb8NMr55d9FMuw+KLokEp2D6X45P/hBOl3E7
 P7WxaFBKIY3AzBPZQuAVCT1S2mi1sOxlJyUMolXJXaKArS6YyfW6+7+esMR1mJinvdc2ZViiXJ
 VJzLnk77rFSpBLAqn4JhewXO
X-SBRS: 5.1
X-MesageID: 54784990
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1VvuP6tZXAqzZ8MeXI9zlWjPc+fnVIJZMUV32f8akzHdYApBsoF/q
 tZmKWuAb67fMGuket1ybtvl90oD7ZaDxtQ2TAtl/CBjEXkU+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y52IfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6p2xQzoMJKT1scskSkRcSnklE79G5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25wRTaqPN
 pJxhTxHbB/wSTdXAgYrCZcPuuCUtFnCYxxIgQfAzUYwyzeKl1EguFT3C/LXdcaNXt59hVuDq
 yTN+GGRKhMHMN2SzxKV/3TqgfXA9QvkXKoCGbv+8eRl6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZtjiXTWorXicpBkeVtFMVeog52mwJrH8uljDQDJeF3gYNYJg5JReqSEWO
 kGhwNLoDwFKqrSsYF2k7+qQ9GvpFzoVMjpXDcMbdjfp8+UPsalq0EmWHo0yQfbv5jHmMWqvm
 GHR9UDSk51W1JRShvvhpTgrlhrx/sChc+Ij2unAsotJBCtCbYi5bsSD7VHB5J6sx67IEwHc4
 BDodyWYhd3i7K1hdgTWG43h/5nzvp5p1QEwZnY1RPEcG8yFoSLLQGypyGgWyL1V3iM4ldjBO
 xS7hO+szMULYCvCgVFfOtrsYyjV8UQQPYu8Da2FBja/SrNwaBWG7ElTib24hju2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrdMuZd2l3tW7T6CGvjGI+GPjOP2iIi9EuxebjNjr4kRscu5neki2
 4wOb5fVk0oPDrKWj+u+2dd7EG3m5EMTXPjeg8dWavSCMkxhHmQgAOXW2rQvZ8pumKE9qwsC1
 ijVtpZwxAWtiHvZBx+Nb3w/OrrjUYwm9SAwPDA2PEbu0H8mON794KAafpoxXL8m6O08kqIkE
 6hbI52NUqZVVzDK2zUBdp2h/oZsQwum2FCVNC2/bTlhI5M5H17V+sXpdxfE/TUVCnblrtM3p
 rCtj1uJQZcKSwl4ItzRbfajkwG4sXQHwbogVErUONhDPk7r9dEyeSD2i/Y2JeAKKAnCmWTGh
 1rHX09AqLCU8YEv8dTPiaSVlKuTErNzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8z6oe9p7JeyQg4TnzHY07yV+FlK3iCm8JOqrdM1vlSvg7vA
 hCD/dxTOLOoPsL5EQFOeFp5P7rbjfxEyCPP6fkVIVnh4H4l9bWKZkxeIh2QhXEPN7ByKo4kn
 b8stcN+B9ZTUfb23gJqVhxpylk=
IronPort-HdrOrdr: A9a23:E7TCM6zPfimGcrC7Ey+MKrPxv+skLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjmfZq6z+8L3WBxB8bfYOCCggqVxe5ZnPLfKlHbakjDH6tmpN
 1dmstFea3N5DpB/L7HCWCDer5KqrT3k9HL9JTjJjVWPHxXgslbnnZE422gYytLrWd9dP4E/M
 323Ls4m9PsQwVaUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZtzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDh1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoykfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW/2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gvMCjl3ocSTbqmVQGcgoE2q+bcGUjbXy32A3Tqg/blkQS/xxtCvg0lLM92pAZJyHtycegc2w
 xoWp4Y442mdfVmGJ6VMt1xCPdfOla9My4kD1jiVWgPbJt3QE4li6SHqondt9vaNaDh8vMJ6e
 L8uRVjxDYPR34=
X-IronPort-AV: E=Sophos;i="5.85,301,1624334400"; 
   d="scan'208";a="54784990"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPrljNJuUzlaiE3uB7BySX4ZgGxchSW3zB/SUI87DnmM4V2i/ve1V5LJUNGL7YgQDM6MN5wSOmk3e6RlmPS9QwoFjcr7TYvegKJWro4H0kqMHhzE+Y8PXuYZmFTVm8d4GVIOeVSQtHoBBzpuX1QpgjkC8RwNonP1hw8RKtqvScUtQedFYu4bjzs957A0463RgUJaVPIktlbKi6sDIhh8e3NKsJfSM/ukZx9vRkNnJFRIPtW7mj6FjmAiRP9RXJYcmNxAcZ5M5s/1KQv5LSAKabtyosn5r6pqIR1uiTD48Dn3nSP6lPZ3P06cRsrXJjr/gYtwvS1wNUhJcaDRVq7rbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PD/IfqxTWeG2APbkwJ0yiHnyMtoPw+kS5Zi2MNtycSo=;
 b=h4vL46bJUIRvTbg8xpKGn7bRQo64FPPVSslmKMhEMiAF8NH9Mb42S2v/0rqzYGXQr5AtqgO5pQnoSs23fRjpxGXz4NVU8hrMpvY0BG+A9QPqe8cabewtXOBEaJEdWioK7YcpjXZMkN3zumz6RgEkhJjzzSlHRjFVWUpRn777IsfgZnCBqxSuZ86mK8gGsqlArnpOicfYvTFIRA1KlqZ22P9O2Vm6b6T+oZs1kz6slSaakkoKcJZcSNZPr19ze456wud7S+Q5WAA5bdxD1vEoUH6wgFyzGPh7gFTe5jLqGdJJB0mTttinuP18fH/J9JLVEk5WZbxWZgi9LrG37CnyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PD/IfqxTWeG2APbkwJ0yiHnyMtoPw+kS5Zi2MNtycSo=;
 b=m3kTSLDzfO7UgZuI6VMI+XhP63NJQovDXRrvdJEhI2BWuDvdBjgw7oIY/yM2DS3+cIP0UprQHfPo+SVqpexnNmeDrEznHzfVKvWZ7slcKmumhecgSwJYlGggtw6rBKugAvsiZV7UAccdduA4mwzG4kSfpqQEEFfQksPPXckNv+s=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>
Subject: [PATCH 4/6] tools/xenstored: use atexit to close interfaces
Date: Fri, 17 Sep 2021 17:46:23 +0200
Message-ID: <20210917154625.89315-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917154625.89315-1-roger.pau@citrix.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0415.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2de9c44-070a-4d21-4c1c-08d979f2622e
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB40577209041B6852C18BBCE48FDD9@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OTZ/QHx/pBtUWN3R32f+OFxoi37zvv5PVbCqVR0ZLI/M9FcJKBfXz1BWV+46XSMz8njvmk7J9iwdk2jcz7ftLgd2eXzCuMowWzqEYrYw26scAF5R68IbX2q9/k5w2VzxQg/3fVeiC9sRctdcnu5+E93LhyGOa91syHL7m9njtZzOP32G4hu9564ZHchC+kGmXeI6kQFgkcNu8BXm64LJRvXgoevjE0+kBaC870YOO9Y9eHmcKnPTkditQ6dZ1y1Czeb8KI+uECqxXBC5K8ditWsRfrCGukejv1XMPkNqluzHwTp1WabATkKyt9KosKf0oUed63SHon/1aR/pIWBDq+TEhKDiT+Kec7+rDpX3myxfZE4dVgI4/XU+QGX/jJLteC3FtzQW8cD+jMX61n+qilPprtH/oRh6unBPz9XeeL5Kkx5fHOZaqZgB3sBgGexHDWKt7wyUwwhgk+AmmCV43Kn0XxS295CADF8i4mETA/CAvklfXusdolPTPEnun2w6v8nesQ30ecJBpK4JUMyp2kjowCw5YfjJrXmIdHG2cUrorKDZaQC+fMDw/8yuPVIIwGaB3EtNz9XVcu+BnMrSxCRWsIjsrcIIOgILJUcLuLZ5BPSPh8fu1pJyAGbn7yXqknScxLmkyjb2tTacOWoORw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(2616005)(956004)(66946007)(66556008)(66476007)(316002)(6666004)(8936002)(8676002)(2906002)(4326008)(186003)(26005)(6916009)(54906003)(6496006)(508600001)(6486002)(38100700002)(36756003)(83380400001)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjhYUkRGU0MyZjRUOFE2RTJac1NLL1VGMVI0cW5PelpZTzdZby84ZG4wY283?=
 =?utf-8?B?VDF3NDVJNDBHMFZPbjBJUHhkenFlZXlkbklPQUl2YWF6WVdlNmhIalRiWjhD?=
 =?utf-8?B?QnhzbGw5OXg5VTJrYjZRWm1IZ2JzZHJkM0dsWXJZZzUxMWM4WWFqbU80akph?=
 =?utf-8?B?aU5sRm1rU21JUjMzeFlwcXRUL0gvME1VMEU3KzhiRlFxUFBYY2VsN2RvSnZx?=
 =?utf-8?B?ejZ2MXg0VXpQbmJ3dU5LS2lJL3lIOVRZYXNIVXQ2TGV0V1BVSFRTd3JlVzNj?=
 =?utf-8?B?RGttemtCRE12VTlUd21qdGtxcWpIZWJPMXBXRWIrZFdTSmNkdEp4a01wam1u?=
 =?utf-8?B?dG1pOHdNT1BWaXl1T0RrRU9ZQlVsZEZKNWRiYlVqZnlKa2RML00rcjRSYVRN?=
 =?utf-8?B?QXQvNVdJU3dZbWltaVJSbGJaZjRsdEdwYVVNRklYVy84ZTJxVzRkMmRqb25z?=
 =?utf-8?B?L1B1Slp0WElrZ0U2ZjlFNzBZMG82dytvb3NSWjJwUDBablVYR2VXSzgxalNs?=
 =?utf-8?B?N2ZlVjlSSDFNdHVMSDczQmNWbmwzaEZsZTdxUUR5ZkhZZXBHYWJWQS9hUDZv?=
 =?utf-8?B?Tm9yS3BPbnQ0QVNRSmFqUVNWMEhBU2VXc1hGc3FtanNMamZ0NTFGYnFkTXkw?=
 =?utf-8?B?Y3NIa29VWTdoM3ovS1B5RWgzeTdYTWl2aEcyalVjdDEvNXM2azJZRmZ2Rnpo?=
 =?utf-8?B?N05Pb05FeVQwcjJvSFVIekNGWXVRZnpQVkY0OVQrV21RYVVZSlFhK3U0aHJK?=
 =?utf-8?B?YW9jMFExaVViVVdyWHZ4ZGVVWER2aXpTMjgrWG9laUVoYUlNdE02ZXpJNk9Y?=
 =?utf-8?B?WEV5WkRCM3ZnSm82a2lMQk5yNWpZeGFBUHF6aHhKNnBmcGhsU2x1ejNOS0Ju?=
 =?utf-8?B?Y2V1RUp3VVo4RXpKMTV6Ukc3VDcxVkJiRk44L1Nscnk4NDhudXdubEpZMWE0?=
 =?utf-8?B?ZStxSTB0M2thR1VkUEpRaVFvNkdVTUVtcGpjYVQwcjFMYVM2TXBCckdWbWl3?=
 =?utf-8?B?TmMvbklxZGhTQURES2ZsNjM5UjRISHJ2UUFaTzhYL3FDZ29iRUxWRmFoQ05y?=
 =?utf-8?B?dGpPTkZaajI5K1BhSkozait0QVE3RmpaVXRIOWE1R00wOXZCRGVxUHYzTEkw?=
 =?utf-8?B?V2ZUQWlZbnZ1czh3WEN6enpJcWhoeWRWZXVCaUtFbzM0alFVelZIc2MzMnJu?=
 =?utf-8?B?dmlMZ3NHQzViNGFaV205endnZ2tGdlB0eUxvVU1QU3FQbStjTXllR29rSlRT?=
 =?utf-8?B?RE13MmZYc2czZktjNlFZYXloYUhRdlNUcWhNMnVhSkwzUjVDVXNYS0JNM040?=
 =?utf-8?B?TE1WcWY1RXdNTjZlb2wrVUhuamhBaEVxTTdORVB3YmNNOEx4dVVDZzIxb0xV?=
 =?utf-8?B?Q3kveVZEN3BleWZ4bWxKOXZ5RDE3bEsxNDNvZjROcTRFc1I5VkQ4Tk1XZEhy?=
 =?utf-8?B?RGFmWUlZL0R5eHNodTV0OFhDTWRGZk5GZHhpZDlGa0l2R1NwSUt2MHIxUm1w?=
 =?utf-8?B?Y01tWW1iMGR2NXljZ25NRVl1K1VQZHh5SU5tWTFhMVZBbGp4T2lhSXgyaFlM?=
 =?utf-8?B?dFdFUGh1d2xXeXB5ck8yZ1dSelFDWE5Jb2hkVDA4V2kwcVFFL0NsNENjVjh1?=
 =?utf-8?B?elFBT0txL2ltRVo2dGZLaWtlN2t2MzlVSzNrTFZRSUJsaC8zdndDaktnZENi?=
 =?utf-8?B?bktzd2dKdjJKakxTalpwYzBucjdtY3I0NHFIaGg4Y1ZYK1N3ekFZYXFEaXRz?=
 =?utf-8?Q?Xu2Z635D5HLPdFXC1D0O/ZjNQIjrua9ey3hB479?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2de9c44-070a-4d21-4c1c-08d979f2622e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 15:46:58.6929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmsC/IgnDRv+SzLndDcxq1N6dIs2mgYBIwBPWehRmFqaS0vbg/ld5qFtVLd8s5chucux5+C864q6EUTE3hgEDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

Exploiting the talloc clean up routines to close the Xen interfaces
is cumbersome, specially when atexit can be used to the same effect.

Convert xc and gnttab to use atexit which allows to drop one
indirection from the storing variables.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/xenstore/xenstored_core.h   |  2 +-
 tools/xenstore/xenstored_domain.c | 57 +++++++++++++------------------
 2 files changed, 25 insertions(+), 34 deletions(-)

diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 258f6ff382..a813bc5a8c 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -266,7 +266,7 @@ void init_pipe(int reopen_log_pipe[2]);
 #ifndef NO_SOCKETS
 extern const struct interface_funcs socket_funcs;
 #endif
-extern xengnttab_handle **xgt_handle;
+extern xengnttab_handle *xgt_handle;
 
 int remember_string(struct hashtable *hash, const char *str);
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 47e9107c14..8930303773 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -35,8 +35,8 @@
 #include <xenctrl.h>
 #include <xen/grant_table.h>
 
-static xc_interface **xc_handle;
-xengnttab_handle **xgt_handle;
+static xc_interface *xc_handle;
+xengnttab_handle *xgt_handle;
 static evtchn_port_t virq_port;
 
 xenevtchn_handle *xce_handle = NULL;
@@ -198,14 +198,14 @@ static const struct interface_funcs domain_funcs = {
 
 static void *map_interface(domid_t domid)
 {
-	return xengnttab_map_grant_ref(*xgt_handle, domid,
+	return xengnttab_map_grant_ref(xgt_handle, domid,
 				       GNTTAB_RESERVED_XENSTORE,
 				       PROT_READ|PROT_WRITE);
 }
 
 static void unmap_interface(void *interface)
 {
-	xengnttab_unmap(*xgt_handle, interface, 1);
+	xengnttab_unmap(xgt_handle, interface, 1);
 }
 
 static int destroy_domain(void *_domain)
@@ -240,7 +240,7 @@ static int destroy_domain(void *_domain)
 
 static bool get_domain_info(unsigned int domid, xc_dominfo_t *dominfo)
 {
-	return xc_domain_getinfo(*xc_handle, domid, 1, dominfo) == 1 &&
+	return xc_domain_getinfo(xc_handle, domid, 1, dominfo) == 1 &&
 	       dominfo->domid == domid;
 }
 
@@ -648,18 +648,6 @@ int do_reset_watches(struct connection *conn, struct buffered_data *in)
 	return 0;
 }
 
-static int close_xc_handle(void *_handle)
-{
-	xc_interface_close(*(xc_interface**)_handle);
-	return 0;
-}
-
-static int close_xgt_handle(void *_handle)
-{
-	xengnttab_close(*(xengnttab_handle **)_handle);
-	return 0;
-}
-
 /* Returns the implicit path of a connection (only domains have this) */
 const char *get_implicit_path(const struct connection *conn)
 {
@@ -737,35 +725,38 @@ void dom0_init(void)
 	xenevtchn_notify(xce_handle, dom0->port);
 }
 
+void interface_cleanup(void)
+{
+	if (xc_handle) {
+		xc_interface_close(xc_handle);
+		xc_handle = NULL;
+	}
+	if (xgt_handle) {
+		xengnttab_close(xgt_handle);
+		xgt_handle = NULL;
+	}
+}
+
 void domain_init(int evtfd)
 {
-	int rc;
+	int rc = atexit(interface_cleanup);
 
-	xc_handle = talloc(talloc_autofree_context(), xc_interface*);
-	if (!xc_handle)
-		barf_perror("Failed to allocate domain handle");
+	if (rc)
+		barf_perror("Unable to register cleanup handler");
 
-	*xc_handle = xc_interface_open(0,0,0);
-	if (!*xc_handle)
+	xc_handle = xc_interface_open(0,0,0);
+	if (!xc_handle)
 		barf_perror("Failed to open connection to hypervisor");
 
-	talloc_set_destructor(xc_handle, close_xc_handle);
-
-	xgt_handle = talloc(talloc_autofree_context(), xengnttab_handle*);
+	xgt_handle = xengnttab_open(NULL, 0);
 	if (!xgt_handle)
-		barf_perror("Failed to allocate domain gnttab handle");
-
-	*xgt_handle = xengnttab_open(NULL, 0);
-	if (*xgt_handle == NULL)
 		barf_perror("Failed to open connection to gnttab");
 
 	/*
 	 * Allow max number of domains for mappings. We allow one grant per
 	 * domain so the theoretical maximum is DOMID_FIRST_RESERVED.
 	 */
-	xengnttab_set_max_grants(*xgt_handle, DOMID_FIRST_RESERVED);
-
-	talloc_set_destructor(xgt_handle, close_xgt_handle);
+	xengnttab_set_max_grants(xgt_handle, DOMID_FIRST_RESERVED);
 
 	if (evtfd < 0)
 		xce_handle = xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
-- 
2.33.0


