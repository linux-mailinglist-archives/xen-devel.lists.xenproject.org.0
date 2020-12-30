Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F372E7B9D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Dec 2020 18:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60221.105577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kufNF-0001qT-E1; Wed, 30 Dec 2020 17:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60221.105577; Wed, 30 Dec 2020 17:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kufNF-0001q4-A7; Wed, 30 Dec 2020 17:35:01 +0000
Received: by outflank-mailman (input) for mailman id 60221;
 Wed, 30 Dec 2020 17:35:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+2v=GC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kufND-0001py-KJ
 for xen-devel@lists.xenproject.org; Wed, 30 Dec 2020 17:34:59 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d72affe2-fb6a-4a4b-ba28-3d375a673333;
 Wed, 30 Dec 2020 17:34:57 +0000 (UTC)
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
X-Inumbo-ID: d72affe2-fb6a-4a4b-ba28-3d375a673333
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609349697;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=jRuINnmYOa/5KoolQNaundeVmJwj+VDfPCONJ7LQkOw=;
  b=Wq+1rMz5ac/9+Hc2Ulu9G0KXhvyKqxF8mj+R+GVFTuCT/Ao4MYo8Dd6n
   tPy7Joh8XqOXZTT42aJD+yxrL7ZIAT3C/dQyZtnn0ePEL3mqLlnZVhTUa
   i3/etzowGDV8IkZfhXul0/XnyJ3QtxUyDFP6HHnBk/dAkP5JbbBGvnOEu
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: g4SHdFR1EJYBKynpKjircudJ3rxNuCC6XtfFi4L7+ZJ0w1U6P2F27r6jJDRSm8g572rmH2IPG0
 lfiOxwQTfqT+/ewMaBXOG+I53tUeCEEkPF0Orfrwa26MN5Li37RDXYTwG2lVy6AfR8TI+TBTbq
 PGLkhBJIx9KkXuu+4x5wMyyzCE+pxUePIwRLRimdipf3aM00N8DXYApOAnHHRQd3wW8RBF5J9N
 XXaHlql/UjZkamxKzjyyl/5+F6NYoLnBFqyjCNdEFyG6PEU2Px5UJpU6diZeeB5R2zbAwaUYiH
 r3E=
X-SBRS: 5.2
X-MesageID: 34172589
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,461,1599537600"; 
   d="scan'208";a="34172589"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRXBLbGzadKYv2x1D9smHgeef8YB3zw8eqSUS97J/UYHpygWbsl8twyX02KuxT77Tuaw2U2jJx2ltxxMn1i7ylwef4dmk/2JT7GV+3hPJ2eQb6Svy29AhyjhMgnFd9KguCLLASJhrftSzDbUQCarsRSDnTn01JZG6QvhSrgXXEM+sFvyDgF2WbwFsClXT8EN8B5R6qne0u+CQCIYG5CMCaRnLXeyropsupNiy5P0iTjLJrhHDrspXF9xoeePQHFce0cieu2m3tI2Dl09d6ybQrHyHSTcC9f3iNwIR+EW3ikaQVO7Z3yKY+6Nxhe11rmBAdx38lzMiylUG371JtjGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rD97J0qexyqUc5qGNFGzyy8YntChTzAmA5ZqLrTlyQ=;
 b=Mn1uw6z95eKzCJJu8z6XTGr0se+x7QY0Cde8tBzzcIlA6xQ6HjHjnaGXaPIUysoNV2q8NDS9x3YMvZjTC90aI3lepuA0V4DnnV1etjwheU7Clxy0kt7Ozn3MXwmt4KWsMQEo+J8T5GdioafN+UIh6AmWRY7BocW1Cs+OwTvppk8v+sAKMYdNwp7NXwZWdPuAVzNiaF39ZR1CMW380Kay0j/ZO6npOojRD+UABBHVi9neQ8wbLwLtFta65In6CrZKlDoTowGWnSBFL8aTECXQAKEYpotlFcFl4oDIJMw0i7g144QY35+ZooTv7EskC8he4z0cbsFG9p0qhx+PGzViug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rD97J0qexyqUc5qGNFGzyy8YntChTzAmA5ZqLrTlyQ=;
 b=Q9OVB0fG1vbKYliTHmjpvEJbGhmClWJ9tWdzhI84z1Bs1KT3MBGH/46J4wZlj6/SHbTze8Meul7FINP+/HHG8VU3Tddqp5dInRjWpY0+Bd3ufiectpBkfvW7vAqYAGA5cV3QHfV3b8Nm6efsiBRpUVcTrX1CM7rV0p0AVy9Kgvk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] xen: remove the usage of the P ar option
Date: Wed, 30 Dec 2020 18:34:46 +0100
Message-ID: <20201230173446.1768-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0341.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c79897df-e76a-4c8c-b459-08d8ace93735
X-MS-TrafficTypeDiagnostic: DM6PR03MB4972:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4972C1DEF142BF35F638C1A38FD70@DM6PR03MB4972.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v2Vp/MBuOx/x3SeKzkF9Plm7wNVG0T5ZuyXPUAqwaHJRLHlUNA9DjSh9NxjFyE53qoWQk3IYsucLsDDfC2Y7lwIglstM9PU05v9ME+AcGs8dyT0ZgxVJ2CSPHJXVb9Zh8uf//34wIW9/QdVgeB2nr/ko+UPAHkwhRchgrJHBZZrjOV1HhpOux0t6Sn7YUZtoY7Uht5ZoD2upo3+J6p+UThFbNsF5QqO29MV/jrRB61Um95OjQGYVta9YQeTuex/L44PrPA0oX1A0sjIXyHQ1wsqS3Ibq8z2DIeg3xlwCxpTfZdtW9RulabjzuISGVgYzLrO8NP9x5vF2sl5ZGie3vF9SZFiMGcZFnMj+rrE5iUHx5ZZ+YYWzljPJ3bB/SlBLiR+st/EWO/7zIHnGDLFV7p8mWw9agWnapEirU2ktEZVEQMjU62S9hnv2fNfKBLOj8oxKXmXO9DjI3qslSMlFGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(83380400001)(66476007)(66556008)(36756003)(6486002)(6916009)(66946007)(5660300002)(316002)(86362001)(4326008)(54906003)(16526019)(1076003)(6496006)(26005)(8936002)(6666004)(8676002)(966005)(956004)(2906002)(478600001)(186003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?empQM0M2SnFWazczRTUvUzJoeFlJcG4yMDZ6alMyY0xsYSszeStnMm9hajBr?=
 =?utf-8?B?ZlVSTGd0Ymx5Si9mdUtqR2RycHJsZHlia2l2K0VnUkVkTmRpN1dNd3A3SUxa?=
 =?utf-8?B?SHdQWUNSRy9lU1h0aXV2TVZXL2VETWVaSFlLa1BUTlZQemduYW1LaVZrYytm?=
 =?utf-8?B?cVdFTFJRWWwvWGVzUGU1anNZbGM4N1ppQzF1aGhJUDcweGJNQk45aVhOSXJx?=
 =?utf-8?B?Qlg0dEo5Mjc3V2ZoRmxSZGRuQmhscDU2MnN3ZWZYRVoyUnhZalBvZzBQRXVF?=
 =?utf-8?B?T2ZJRnhVVW50ZHlTWWU2WnVmNG5pZXo2emNHb0tsS1VZUHVnU2VBazlTS3pJ?=
 =?utf-8?B?ekpQdStyOHR1amNLOWVzQ0NsSmNEUFRsWkhYQk5jbFZuaG43azRIbTZJdkNh?=
 =?utf-8?B?SE9kS0VvdjZlL0RnVG14ZUhYOTFZR2VINkxIK3dhZDZrVGhJRWFhVnJZU25U?=
 =?utf-8?B?UHlHKzZ6ejFYYUxzUVlWYXN5ZVNDdy9qQXBsZlpzZmRxbzZWcy9nOFJmRU5y?=
 =?utf-8?B?d05CK1JoL0x4TVczRHh5SGMxVlVZZGd2SDl1M0VNcDRhamo5WXNmT0NDaklG?=
 =?utf-8?B?bHYrN1FyRURpMFNOcWIvTVZWU1UyNTZJM1RzTE9VY1BlUXVYcHVoSTdUWFNL?=
 =?utf-8?B?U0xuMDRFZGlraHlyVWVaeVRIclNFcGhnelE2eXg4QTFoL3ZCcHE4YlNaalBw?=
 =?utf-8?B?Y0kybU9yb0IxM3grellRN0VqdUZZbkExUW43WEhVdCtKK3Z2YnpYK3ZpNlV6?=
 =?utf-8?B?WmJoODJVQnVxVHNwU081dkViSFplTXI3WEF1WkRveFRkdW9jZWdnR2N2R05a?=
 =?utf-8?B?M1cvNTFJRE5oK1pqaHluVE9abng2WS81bTVmWStRWlIrM2V5cEVXV2VmWTd4?=
 =?utf-8?B?RnFpWHB2SE5sOExaby84eGRiclc3ODFrenZQLzZLdDU5dmxlbGdVTmpwNEhB?=
 =?utf-8?B?eDg4TEpKR0ZVcEJTVjFEMnQ1aEpUMTI5TVI2QUdMdG1mZnlxbWxGNUk5dmxt?=
 =?utf-8?B?dExWSCtWRHNkdmVOVW9GMVdLcGlUeDBMV3JvS0syVDRxWitESnBqZnI5VmdN?=
 =?utf-8?B?RzkwekFKc2hZZlplc0twa2NTaHpCMXA5UFdOclZQNTJ2NFdSbzRseGkvdDJh?=
 =?utf-8?B?dHJpZVdEQUFLVGx6YWRNZ0JFREcxdUVjRlovQ0dEb0o4VEZNTDZ0T2xUdlBN?=
 =?utf-8?B?MWVpSTNPVUVuOG5QOVl2T0g1aXdKbE1TbUMybFlab3NsVTVPSmxPYTlxcTlU?=
 =?utf-8?B?eDRMRC9OQ1FEeGtXb1YyeWxPTXFSSEJXeHk4RDg1UWhrUm4zNFJ3a3N2SW9r?=
 =?utf-8?Q?1LC0WMValBm65qneNiLQJePSSdCSLhgWdW?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 17:34:52.5523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: c79897df-e76a-4c8c-b459-08d8ace93735
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvLeRGVw8Y32ldKVd3CMK9ct31ufRz7IOs2rMqhd7qdOy+Y4BSRFYxXb+NEgL4NoTjvcilS9XF51PHvdvTqJeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4972
X-OriginatorOrg: citrix.com

It's not part of the POSIX standard [0] and as such non GNU ar
implementations don't usually have it.

It's not relevant for the use case here anyway, as the archive file is
recreated every time due to the rm invocation before the ar call. No
file name matching should happen so matching using the full path name
or a relative one should yield the same result.

This fixes the build on FreeBSD.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

[0] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/ar.html
---
I'm unsure whether the r and s options are also needed, since they
seem to only be relevant when updating a library, and Xen build system
always removes the old library prior to any ar call.
---
 xen/Rules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index aba6ca2a90..8fcffffc98 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -71,7 +71,7 @@ cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out %.a,$(real-prereqs)) \
 # ---------------------------------------------------------------------------
 
 quiet_cmd_ar = AR      $@
-cmd_ar = rm -f $@; $(AR) cPrs $@ $(real-prereqs)
+cmd_ar = rm -f $@; $(AR) crs $@ $(real-prereqs)
 
 # Objcopy
 # ---------------------------------------------------------------------------
-- 
2.29.2


