Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C1648BF09
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 08:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256254.439631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Y9b-0002Ud-Vg; Wed, 12 Jan 2022 07:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256254.439631; Wed, 12 Jan 2022 07:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Y9b-0002RD-R7; Wed, 12 Jan 2022 07:34:43 +0000
Received: by outflank-mailman (input) for mailman id 256254;
 Wed, 12 Jan 2022 07:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSVc=R4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Y9a-0002Ql-95
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 07:34:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19ac725a-737a-11ec-81c1-a30af7de8005;
 Wed, 12 Jan 2022 08:34:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 583281F3BB;
 Wed, 12 Jan 2022 07:34:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 28B3713B32;
 Wed, 12 Jan 2022 07:34:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tc1lCI+E3mEeDwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 12 Jan 2022 07:34:39 +0000
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
X-Inumbo-ID: 19ac725a-737a-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641972879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WpAam2Xb/p4rOHtj0x911ZgbJaMNbmmnG47Q7yxMM7Q=;
	b=g9ut3n6sDqSDmG71Q+UW30bgHb+JAclEiezNTjJSd/x1lNbsV0gdNhpLUNf9mUcB0EFPk4
	kgO5r1eu3wAKmkGlFa6z4CV5pRJ1XWpYg6RQ/vNPXoMQucIbWcTnzeiZmE9UvBWdD5/8gc
	fFHNQuTv9z0yHkdRojG3EIcgO3j8J18=
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111145817.22170-1-jgross@suse.com>
 <20220111145817.22170-18-jgross@suse.com>
 <a2d4c905-c477-8553-85a7-90168d914b6e@srcf.net>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 17/18] mini-os: use function vectors instead of switch
 for file operations
Message-ID: <08672989-53be-1551-f001-0d2c0435b586@suse.com>
Date: Wed, 12 Jan 2022 08:34:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a2d4c905-c477-8553-85a7-90168d914b6e@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1yRxLjG8LI6TWxRXbZOs6dgGzDbd4tlbj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1yRxLjG8LI6TWxRXbZOs6dgGzDbd4tlbj
Content-Type: multipart/mixed; boundary="PLE3ZJvZpi5M3UTKkAGKQjQ8OKjGp7roo";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <08672989-53be-1551-f001-0d2c0435b586@suse.com>
Subject: Re: [PATCH v2 17/18] mini-os: use function vectors instead of switch
 for file operations
References: <20220111145817.22170-1-jgross@suse.com>
 <20220111145817.22170-18-jgross@suse.com>
 <a2d4c905-c477-8553-85a7-90168d914b6e@srcf.net>
In-Reply-To: <a2d4c905-c477-8553-85a7-90168d914b6e@srcf.net>

--PLE3ZJvZpi5M3UTKkAGKQjQ8OKjGp7roo
Content-Type: multipart/mixed;
 boundary="------------24BCAA1F1F5DE129C8C99AE9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------24BCAA1F1F5DE129C8C99AE9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.01.22 19:08, Andrew Cooper wrote:
> On 11/01/2022 14:58, Juergen Gross wrote:
>> Introduce file type specific function vectors for all the needed file
>> operations which are file type specific in order to prepare replacing
>> the large switch statements in each generic file function.
>>
>> Add a function to allocate a new file type dynamically in order to
>> prepare removing direct dependencies to external components in the
>> future. For this reason switch the file type from an enum to an
>> unsigned int. Prepare removal of some statically defines file types
>> by putting them at the end of the defined list.
>>
>> Change the debug output for the file type from a single character to
>> a string in order to support a future removal of the file_types[]
>> array.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> A few misc observations.
>=20
>> diff --git a/include/lib.h b/include/lib.h
>> index 7a0546b..b40e213 100644
>> --- a/include/lib.h
>> +++ b/include/lib.h
>> @@ -154,25 +155,51 @@ do {                                            =
               \
>>   void sanity_check(void);
>>  =20
>>   #ifdef HAVE_LIBC
>> -enum fd_type {
>> -    FTYPE_NONE =3D 0,
>> -    FTYPE_CONSOLE,
>> -    FTYPE_FILE,
>> -    FTYPE_XENBUS,
>> -    FTYPE_XC,
>> -    FTYPE_EVTCHN,
>> -    FTYPE_GNTMAP,
>> -    FTYPE_SOCKET,
>> -    FTYPE_TAP,
>> -    FTYPE_BLK,
>> -    FTYPE_KBD,
>> -    FTYPE_FB,
>> -    FTYPE_MEM,
>> -    FTYPE_SAVEFILE,
>> -    FTYPE_TPMFRONT,
>> -    FTYPE_TPM_TIS,
>> +#define FTYPE_NONE       0
>> +#define FTYPE_CONSOLE    1
>> +#define FTYPE_FILE       2
>> +#define FTYPE_SOCKET     3
>> +#define FTYPE_MEM        4
>> +#define FTYPE_SAVEFILE   5
>> +#define FTYPE_FB         6
>> +#define FTYPE_KBD        7
>> +#define FTYPE_TAP        8
>> +#define FTYPE_BLK        9
>> +#define FTYPE_TPMFRONT  10
>> +#define FTYPE_TPM_TIS   11
>> +#define FTYPE_XENBUS    12
>> +#define FTYPE_GNTMAP    13
>> +#define FTYPE_EVTCHN    14
>> +#define FTYPE_XC        15
>> +#define FTYPE_N         16
>> +#define FTYPE_SPARE     16
>> +
>> +typedef int file_read_func(int fd, void *buf, size_t nbytes);
>> +typedef int file_write_func(int fd, const void *buf, size_t nbytes);
>> +typedef off_t file_lseek_func(int fd, off_t offset, int whence);
>> +typedef int file_close_func(int fd);
>> +typedef int file_fstat_func(int fd, struct stat *buf);
>> +typedef int file_fcntl_func(int fd, int cmd, va_list args);
>> +typedef bool file_select_func(int fd);
>=20
> Are these typedef's useful?=C2=A0 I don't see them used anywhere other =
than
> the file_ops structure.

I can drop them.

>=20
>> +
>> +struct file_ops {
>> +    const char *name;
>> +    file_read_func *read;
>> +    file_write_func *write;
>> +    file_lseek_func *lseek;
>> +    file_close_func *close;
>> +    file_fstat_func *fstat;
>> +    file_fcntl_func *fcntl;
>> +    file_select_func *select_rd;
>> +    file_select_func *select_wr;
>>   };
>>  =20
>> +unsigned int alloc_file_type(struct file_ops *ops);
>=20
> const.

Yes.

>=20
>> +
>> +off_t lseek_default(int fd, off_t offset, int whence);
>> +bool select_yes(int fd);
>> +bool select_read_flag(int fd);
>> +
>>   LIST_HEAD(evtchn_port_list, evtchn_port_info);
>>  =20
>>   struct evtchn_port_info {
>> @@ -183,7 +210,7 @@ struct evtchn_port_info {
>>   };
>>  =20
>>   struct file {
>> -    enum fd_type type;
>> +    unsigned int type;
>>       bool read;	/* maybe available for read */
>>       off_t offset;
>>       union {
>> @@ -199,7 +226,7 @@ struct file {
>>   extern struct file files[];
>>  =20
>>   struct file *get_file_from_fd(int fd);
>> -int alloc_fd(enum fd_type type);
>> +int alloc_fd(unsigned int type);
>>   void close_all_files(void);
>>   extern struct thread *main_thread;
>>   void sparse(unsigned long data, size_t size);
>> diff --git a/lib/sys.c b/lib/sys.c
>> index 323a7cd..c327247 100644
>> --- a/lib/sys.c
>> +++ b/lib/sys.c
>> @@ -98,6 +98,39 @@ struct file files[NOFILE] =3D {
>>       { .type =3D FTYPE_CONSOLE }, /* stderr */
>>   };
>>  =20
>> +static struct file_ops file_ops_none =3D {
>> +    .name =3D "none",
>> +};
>> +
>> +static struct file_ops *file_ops[FTYPE_N + FTYPE_SPARE] =3D {
>> +    [FTYPE_NONE] =3D &file_ops_none,
>> +};
>=20
> Both want to be const, because all file_ops ought to live in rodata.

file_ops[] can't be const, it will just point to const data.

>=20
>> +
>> +unsigned int alloc_file_type(struct file_ops *ops)
>> +{
>> +    unsigned int i;
>> +
>> +    pthread_mutex_lock(&fd_lock);
>> +
>> +    for ( i =3D FTYPE_N; i < ARRAY_SIZE(file_ops) && file_ops[i]; i++=
 );
>=20
> No need for a for loop.=C2=A0 Given the mutex, you can safely do someth=
ing
> like this:
>=20
> static unsigned int i =3D FTYPE_N;
>=20
> BUG_ON(i =3D=3D ARRAY_SIZE(file_ops));
> file_ops[i++] =3D ops;

Will change it that way.

>=20
> Alternatively, if you do want to keep the loop, we might want to confir=
m
> that the same ops structure doesn't get registered twice.
>=20
>> +    BUG_ON(i =3D=3D ARRAY_SIZE(file_ops));
>> +    file_ops[i] =3D ops;
>> +
>> +    pthread_mutex_unlock(&fd_lock);
>> +
>> +    printk("New file type \"%s\"(%u) allocated\n", ops->name, i);
>> +
>> +    return i;
>> +}
>> +
>> +static struct file_ops *get_file_ops(unsigned int type)
>> +{
>> +    if ( type >=3D ARRAY_SIZE(file_ops) || !file_ops[type] )
>> +        return &file_ops_none;
>> +
>> +    return file_ops[type];
>> +}
>> +
>>   struct file *get_file_from_fd(int fd)
>>   {
>>       if ( fd < 0 || fd >=3D NOFILE )
>> @@ -108,7 +141,7 @@ struct file *get_file_from_fd(int fd)
>>  =20
>>   DECLARE_WAIT_QUEUE_HEAD(event_queue);
>>  =20
>> -int alloc_fd(enum fd_type type)
>> +int alloc_fd(unsigned int type)
>>   {
>>       int i;
>>       pthread_mutex_lock(&fd_lock);
>> @@ -249,6 +282,11 @@ int isatty(int fd)
>>  =20
>>   int read(int fd, void *buf, size_t nbytes)
>>   {
>> +    struct file_ops *ops =3D get_file_ops(files[fd].type);
>> +
>> +    if ( ops->read )
>> +        return ops->read(fd, buf, nbytes);
>> +
>>       switch (files[fd].type) {
>>           case FTYPE_SAVEFILE:
>>   	case FTYPE_CONSOLE: {
>> @@ -328,6 +366,11 @@ int read(int fd, void *buf, size_t nbytes)
>>  =20
>>   int write(int fd, const void *buf, size_t nbytes)
>>   {
>> +    struct file_ops *ops =3D get_file_ops(files[fd].type);
>> +
>> +    if ( ops->write )
>> +        return ops->write(fd, buf, nbytes);
>> +
>>       switch (files[fd].type) {
>>           case FTYPE_SAVEFILE: {
>>                   int ret =3D 0, tot =3D nbytes;
>> @@ -370,8 +413,45 @@ int write(int fd, const void *buf, size_t nbytes)=

>>       return -1;
>>   }
>>  =20
>> +off_t lseek_default(int fd, off_t offset, int whence)
>> +{
>> +    switch ( whence )
>> +    {
>> +    case SEEK_SET:
>> +        files[fd].offset =3D offset;
>> +        break;
>> +
>> +    case SEEK_CUR:
>> +        files[fd].offset +=3D offset;
>> +        break;
>> +
>> +    case SEEK_END:
>> +    {
>> +        struct stat st;
>> +        int ret;
>> +
>> +        ret =3D fstat(fd, &st);
>> +        if ( ret )
>> +            return -1;
>> +        files[fd].offset =3D st.st_size + offset;
>> +        break;
>> +    }
>> +
>> +    default:
>> +        errno =3D EINVAL;
>> +        return -1;
>> +    }
>> +
>> +    return files[fd].offset;
>> +}
>> +
>>   off_t lseek(int fd, off_t offset, int whence)
>>   {
>> +    struct file_ops *ops =3D get_file_ops(files[fd].type);
>> +
>> +    if ( ops->lseek )
>> +        return ops->lseek(fd, offset, whence);
>> +
>>       switch(files[fd].type) {
>>   #ifdef CONFIG_BLKFRONT
>>          case FTYPE_BLK:
>> @@ -393,28 +473,7 @@ off_t lseek(int fd, off_t offset, int whence)
>>             return (off_t) -1;
>>       }
>>  =20
>> -    switch (whence) {
>> -       case SEEK_SET:
>> -          files[fd].offset =3D offset;
>> -          break;
>> -       case SEEK_CUR:
>> -          files[fd].offset +=3D offset;
>> -          break;
>> -       case SEEK_END:
>> -          {
>> -             struct stat st;
>> -             int ret;
>> -             ret =3D fstat(fd, &st);
>> -             if (ret)
>> -                return -1;
>> -             files[fd].offset =3D st.st_size + offset;
>> -             break;
>> -          }
>> -       default:
>> -          errno =3D EINVAL;
>> -          return -1;
>> -    }
>> -    return files[fd].offset;
>> +    return lseek_default(fd, offset, whence);
>>   }
>>  =20
>>   int fsync(int fd) {
>> @@ -425,8 +484,15 @@ int fsync(int fd) {
>>   int close(int fd)
>>   {
>>       int res =3D 0;
>> +    struct file_ops *ops =3D get_file_ops(files[fd].type);
>>  =20
>>       printk("close(%d)\n", fd);
>> +    if ( ops->close )
>> +    {
>> +        res =3D ops->close(fd);
>> +        goto out;
>> +    }
>> +
>>       switch (files[fd].type) {
>>           default:
>>               break;
>> @@ -497,6 +563,7 @@ int close(int fd)
>>               return -1;
>>       }
>>  =20
>> + out:
>>       memset(files + fd, 0, sizeof(struct file));
>>       files[fd].type =3D FTYPE_NONE;
>>       return res;
>> @@ -521,7 +588,13 @@ int stat(const char *path, struct stat *buf)
>>  =20
>>   int fstat(int fd, struct stat *buf)
>>   {
>> +    struct file_ops *ops =3D get_file_ops(files[fd].type);
>> +
>>       init_stat(buf);
>> +
>> +    if ( ops->fstat )
>> +        return ops->fstat(fd, buf);
>> +
>>       switch (files[fd].type) {
>>   	case FTYPE_SAVEFILE:
>>   	case FTYPE_CONSOLE:
>> @@ -587,6 +660,18 @@ int fcntl(int fd, int cmd, ...)
>>   {
>>       long arg;
>>       va_list ap;
>> +    int res;
>> +    struct file_ops *ops =3D get_file_ops(files[fd].type);
>> +
>> +    if ( ops->fcntl )
>> +    {
>> +        va_start(ap, cmd);
>> +        res =3D ops->fcntl(fd, cmd, ap);
>> +        va_end(ap);
>> +
>> +        return res;
>> +    }
>> +
>>       va_start(ap, cmd);
>>       arg =3D va_arg(ap, long);
>>       va_end(ap);
>> @@ -640,18 +725,29 @@ int closedir(DIR *dir)
>>   /* We assume that only the main thread calls select(). */
>>  =20
>>   #if defined(LIBC_DEBUG) || defined(LIBC_VERBOSE)
>> -static const char file_types[] =3D {
>> -    [FTYPE_NONE]	=3D 'N',
>> -    [FTYPE_CONSOLE]	=3D 'C',
>> -    [FTYPE_XENBUS]	=3D 'S',
>> -    [FTYPE_XC]		=3D 'X',
>> -    [FTYPE_EVTCHN]	=3D 'E',
>> -    [FTYPE_SOCKET]	=3D 's',
>> -    [FTYPE_TAP]		=3D 'T',
>> -    [FTYPE_BLK]		=3D 'B',
>> -    [FTYPE_KBD]		=3D 'K',
>> -    [FTYPE_FB]		=3D 'G',
>> +static const char *file_types[] =3D {
>=20
> static const char *const file_types[]

Okay.

>=20
>> +    [FTYPE_NONE]    =3D "none",
>> +    [FTYPE_CONSOLE] =3D "console",
>> +    [FTYPE_XENBUS]  =3D "xenbus",
>> +    [FTYPE_XC]      =3D "ctrl",
>> +    [FTYPE_EVTCHN]  =3D "evtchn",
>> +    [FTYPE_SOCKET]  =3D "socket",
>> +    [FTYPE_TAP]     =3D "net",
>> +    [FTYPE_BLK]     =3D "blk",
>> +    [FTYPE_KBD]     =3D "kbd",
>> +    [FTYPE_FB]      =3D "fb",
>>   };
>> +
>> +static char *get_type_name(unsigned int type)
>=20
> const.

Okay.

>=20
>> +{
>> +    if ( type < ARRAY_SIZE(file_ops) && file_ops[type] )
>> +        return file_ops[type]->name;
>> +
>> +    if ( type < ARRAY_SIZE(file_types) && file_types[type] )
>> +        return file_types[type];
>> +
>> +    return "none";
>> +}
>>   #endif
>>   #ifdef LIBC_DEBUG
>>   static void dump_set(int nfds, fd_set *readfds, fd_set *writefds, fd=
_set *exceptfds, struct timeval *timeout)
>> @@ -663,7 +759,7 @@ static void dump_set(int nfds, fd_set *readfds, fd=
_set *writefds, fd_set *except
>>   	if (FD_ISSET(i, set)) { \
>>   	    if (comma) \
>>   		printk(", "); \
>> -	    printk("%d(%c)", i, file_types[files[i].type]); \
>> +	    printk("%d(%s)", i, get_type_name(files[i].type)); \
>>   	    comma =3D 1; \
>>   	} \
>>       } \
>> @@ -697,7 +793,7 @@ static void dump_pollfds(struct pollfd *pfd, int n=
fds, int timeout)
>>           fd =3D pfd[i].fd;
>>           if (comma)
>>               printk(", ");
>> -        printk("%d(%c)/%02x", fd, file_types[files[fd].type],
>> +        printk("%d(%s)/%02x", fd, get_type_name(files[fd].type),
>>               pfd[i].events);
>>               comma =3D 1;
>>       }
>> @@ -709,6 +805,18 @@ static void dump_pollfds(struct pollfd *pfd, int =
nfds, int timeout)
>>   #define dump_pollfds(pfds, nfds, timeout)
>>   #endif
>>  =20
>> +bool select_yes(int fd)
>> +{
>> +    return true;
>> +}
>> +
>> +bool select_read_flag(int fd)
>> +{
>> +    struct file *file =3D get_file_from_fd(fd);
>> +
>> +    return file->read;
>> +}
>=20
> I don't see these getting used, even in a fallback case.

They will be used in later patches.

>=20
>> +
>>   /* Just poll without blocking */
>>   static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, =
fd_set *exceptfds)
>>   {
>> @@ -762,9 +870,35 @@ static int select_poll(int nfds, fd_set *readfds,=
 fd_set *writefds, fd_set *exce
>>       for (i =3D 0; i < nfds; i++) {
>>   	switch(files[i].type) {
>>   	default:
>> +        {
>> +            struct file_ops *ops =3D file_ops[files[i].type];
>> +
>> +            if ( ops )
>> +            {
>> +                if ( FD_ISSET(i, readfds) )
>> +                {
>> +                    if ( ops->select_rd && ops->select_rd(i) )
>> +                        n++;
>> +                    else
>> +                        FD_CLR(i, readfds);
>> +                }
>> +                if ( FD_ISSET(i, writefds) )
>> +                {
>> +                    if ( ops->select_wr && ops->select_wr(i) )
>> +                        n++;
>> +                    else
>> +                        FD_CLR(i, writefds);
>> +                }
>> +	        FD_CLR(i, exceptfds);
>=20
> Hard tab.

Thanks for noting.

>=20
>> +
>> +                break;
>> +            }
>> +
>>   	    if (FD_ISSET(i, readfds) || FD_ISSET(i, writefds) || FD_ISSET(i=
, exceptfds))
>>   		printk("bogus fd %d in select\n", i);
>>   	    /* Fallthrough.  */
>> +        }
>=20
> Is this fallthrough really appropriate, given the break in the ops case=
?

I think this was meant for the FTYPE_SAVEFILE case. For all other file
types this wouldn't make any sense.

Note that in the other Mini-OS series I'm setting the savefile select
callbacks appropriately.


Juergen

--------------24BCAA1F1F5DE129C8C99AE9
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------24BCAA1F1F5DE129C8C99AE9--

--PLE3ZJvZpi5M3UTKkAGKQjQ8OKjGp7roo--

--1yRxLjG8LI6TWxRXbZOs6dgGzDbd4tlbj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHehI4FAwAAAAAACgkQsN6d1ii/Ey9k
kgf9Fpa0a8Ku0jrEAASfw4Py+jT/e4/J/ljzJu/lX6OivcZelBK5hSzanxxt+3Pen3fygNKQiscj
AtD4CNBlriFKuGOKlO9lEt2ze+qMCyfkbk3CEg+S8UiXFsFXNe0ypy7nQJ2cyxGvbE+Uj/RNU9DG
3GAR2cyLezlZqjr7N+fH+rzsh0ueJAdvYtUhbNHAPZNvhaMCx83jYYxkj+Ue+VUEIXKKs9FS1pHh
rvi1QD7rrWOH2N8xiSxBsv/ckzw1ETX/cAHGyzi/8zGCYaCDequVrLBqqfDIsduzdgDo0gsvt3g2
dzliOz4U/BNmLA1obkGB45+1S247CLCjs4PEcRe6MQ==
=qZYx
-----END PGP SIGNATURE-----

--1yRxLjG8LI6TWxRXbZOs6dgGzDbd4tlbj--

